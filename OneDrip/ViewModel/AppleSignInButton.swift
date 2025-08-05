import SwiftUI
import AuthenticationServices
import CloudKit

struct AppleSignInButtonView: View {
    var onSignedIn: () -> Void

    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
                        let userID = appleIDCredential.user
                        let email = appleIDCredential.email
                        let fullName = appleIDCredential.fullName?.givenName

                        let predicate = NSPredicate(format: "id == %@", userID)
                        let query = CKQuery(recordType: "User", predicate: predicate)
                        let publicDB = CKContainer.default().publicCloudDatabase

                        publicDB.perform(query, inZoneWith: nil) { records, error in
                            if let error = error {
                                print("❌ Error checking for existing user: \(error.localizedDescription)")
                                return
                            }

                            if let records = records, records.isEmpty {
                            
                                CloudKitUserManager.shared.saveUser(
                                    id: userID,
                                    email: email,
                                    fullName: fullName
                                )
                            } else {
                                print("🔁 User already exists in CloudKit.")
                            }

                            UserDefaults.standard.set(userID, forKey: "userID")

                            CloudKitJourneyManager.shared.fetchJourneys(for: userID) { journeys, error in
                                if let error = error {
                                    print("❌ Error fetching journeys: \(error.localizedDescription)")
                                } else {
                                    print("🟢 Retrieved \(journeys?.count ?? 0) journeys.")
                                }
                            }

                            CloudKitEntryManager.shared.fetchEntries(for: userID) { entries, error in
                                if let error = error {
                                    print("❌ Error fetching entries: \(error.localizedDescription)")
                                } else {
                                    print("📘 Retrieved \(entries?.count ?? 0) entries.")
                                }
                            }

                            DispatchQueue.main.async {
                                onSignedIn()
                            }
                        }
                    }

                case .failure(let error):
                    print("❌ Apple Sign-In failed: \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
        .frame(width: 310, height: 58)
        .cornerRadius(23)
        .padding(.horizontal)
    }
}

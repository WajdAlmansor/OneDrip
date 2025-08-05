import Foundation
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var userId: String?

    init() {
        if let id = UserDefaults.standard.string(forKey: "userID") {
            self.userId = id
            self.isSignedIn = true
        } else {
            self.isSignedIn = false
        }
    }

    func saveUserId(_ id: String) {
        self.userId = id
        self.isSignedIn = true
        UserDefaults.standard.set(id, forKey: "userID")
    }

    func signOut() {
        self.userId = nil
        self.isSignedIn = false
        UserDefaults.standard.removeObject(forKey: "userID")
    }
}

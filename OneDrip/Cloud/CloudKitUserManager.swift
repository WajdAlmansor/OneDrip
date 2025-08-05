


import Foundation
import CloudKit

class CloudKitUserManager {
    static let shared = CloudKitUserManager()

    private let container = CKContainer.default()
    private let publicDB = CKContainer.default().publicCloudDatabase

    func saveUser(id: String, email: String?, fullName: String?) {
        let record = CKRecord(recordType: "User")
        record["id"] = id as CKRecordValue
        record["createdAt"] = Date() as CKRecordValue

        if let email = email {
            record["email"] = email as CKRecordValue
        }

        if let fullName = fullName {
            record["fullName"] = fullName as CKRecordValue
        }

        publicDB.save(record) { result, error in
            if let error = error {
                print("❌ Failed to save user to CloudKit: \(error.localizedDescription)")
            } else {
                print("✅ User saved to CloudKit successfully.")
            }
        }
    }
}

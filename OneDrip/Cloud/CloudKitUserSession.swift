import CloudKit

class CloudKitUserSession {
    static let shared = CloudKitUserSession()
    private init() {}

    var currentUserId: String?

    func fetchUserId(completion: @escaping (String?) -> Void) {
        if let cachedId = currentUserId {
            completion(cachedId)
            return
        }

        CKContainer.default().fetchUserRecordID { recordID, error in
            if let recordID = recordID {
                self.currentUserId = recordID.recordName
                completion(recordID.recordName)
            } else {
                print("⚠️ Failed to fetch user ID: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
    }
}

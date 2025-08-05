import CloudKit

class CloudKitEntryManager {
    static let shared = CloudKitEntryManager()
    private let db = CKContainer.default().publicCloudDatabase

    func fetchEntries(for journeyId: String, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        let predicate = NSPredicate(format: "journeyId == %@", journeyId)
        let query = CKQuery(recordType: "Entry", predicate: predicate)

        db.perform(query, inZoneWith: nil) { records, error in
            completion(records, error)
        }
    }

}

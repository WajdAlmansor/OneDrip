import CloudKit

class CloudKitJourneyManager {
    static let shared = CloudKitJourneyManager()
    
    private let publicDB = CKContainer.default().publicCloudDatabase

    func saveJourney(
        title: String,
        durationDays: Int,
        dailyMinutes: Int,
        startDate: Date,
        userId: String,
        completion: @escaping (Result<CKRecord, Error>) -> Void
    ) {
        let record = CKRecord(recordType: "Journey")
        record["title"] = title as CKRecordValue
        record["durationDays"] = durationDays as CKRecordValue
        record["dailyMinutes"] = dailyMinutes as CKRecordValue
        record["startDate"] = startDate as CKRecordValue
        record["userId"] = userId as CKRecordValue
        record["createdAt"] = Date() as CKRecordValue
        
        publicDB.save(record) { savedRecord, error in
            if let error = error {
                completion(.failure(error))
            } else if let savedRecord = savedRecord {
                completion(.success(savedRecord))
            }
        }
    }
    
    func fetchJourneys(for userId: String, completion: @escaping ([CKRecord]?, Error?) -> Void) {
           let predicate = NSPredicate(format: "userId == %@", userId)
           let query = CKQuery(recordType: "Journey", predicate: predicate)

           CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
               completion(records, error)
           }
       }
}

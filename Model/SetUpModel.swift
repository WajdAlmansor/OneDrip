import SwiftUI

struct QuestionPage: Identifiable {
    let id = UUID()
    let question: String
    let dropColor: Color
    let options: [String]? // nil إذا ما فيه خيارات
}


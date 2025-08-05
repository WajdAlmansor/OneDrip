import SwiftUI


struct CircleItem: Identifiable, Equatable {
    let id = UUID()
    let text: String
}

struct CircleView: View {
    let item: CircleItem
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 63)
                .fill(color)
                .frame(width: 139, height: 126)
                .shadow(radius: 5)

            Text(item.text)
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}




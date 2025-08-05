import SwiftUI

struct TimerButton: View {
    var title: String
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 25, weight: .regular, design: .rounded))
                .frame(width: 155, height: 65)
                .background(color)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(hex: "#333333"), lineWidth: 1)
                )
                .shadow(color: Color(hex: "#333333").opacity(0.5), radius: 4, x: 0, y: 2)
                .foregroundColor(.black)
        }
    }
}

import SwiftUI

struct DayCircleView: View {
    let day: Int
    let isSelected: Bool
    let scale: CGFloat
    @State private var noteText: String = ""

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            
            Circle()
                .fill(Color(hex: "FEE4A4"))
                .frame(width: 50, height: 50)
                .scaleEffect(scale)
                .shadow(radius: isSelected ? 8 : 2)
                .animation(.easeInOut(duration: 0.25), value: isSelected)

            
            if isSelected {
                VStack(alignment: .leading, spacing: 16) {
                    Text("\(day) MAY")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Accomplished:")
                        .foregroundColor(.gray)

                    CustomTextEditor(text: $noteText)
                        .frame(height: 130)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(contentButtons, id: \.icon) { item in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(item.color)
                                    .frame(width: 90, height: 90)
                                    .overlay(
                                        Image(systemName: item.icon)
                                            .font(.system(size: 26))
                                            .foregroundColor(.black)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: "FFFDD0"))
                        .frame(width: 65, height: 65)
                        .overlay(
                            Image(systemName: "mic.fill")
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "F88379"))
                        )
                        .shadow(radius: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                .transition(.opacity)
            }
        }
    }

    var contentButtons: [(icon: String, color: Color)] {
        [
            ("photo.on.rectangle.angled", Color(hex: "FFA89A")),
            ("photo.fill.on.rectangle.fill", Color(hex: "CFADE8")),
            ("video.fill.badge.plus", Color(hex: "B4E8C2"))
        ]
    }
}

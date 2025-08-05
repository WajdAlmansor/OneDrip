import SwiftUI

struct Timer: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            VStack {
        
                HStack {
                    Button(action: {
                        print("رجوع")
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }

                    Spacer()

                    Text("Timer")
                        .multilineTextAlignment(.center)
                        .font(.custom("ArialRoundedMTBold", size: 36))

                    Spacer()

                    Button(action: {
                        print("الضغط على التقويم")
                    }) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                }
                .padding()

            
                VStack(spacing: 8) {
                    Text("1 May")
                        .font(.system(size: 30, weight: .regular, design: .rounded))
                    Text("1 May - 20 May")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)

            
                ZStack {
                    Circle()
                        .fill(Color(hex: "#FFE5B2"))
                        .frame(width: 275, height: 275)
                        .overlay(
                            Circle()
                                .stroke(Color(hex: "#333333"), lineWidth: 1)
                        )

                    Text("00:15:00")
                        .font(.system(size: 48, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.top, 20)

            
                VStack(spacing: 16) {
                    TimerButton(title: "Start", color: Color(hex: "#FFFFCC")) {
                        print("✅ Start pressed")
                    }
                    TimerButton(title: "Resume", color: Color(hex: "#D9D9D9")) {
                        print("▶️ Resume pressed")
                    }
                    TimerButton(title: "End", color: Color(hex: "#F08080")) {
                        print("⛔️ End pressed")
                    }
                }
                .padding(.top, 30)

                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    Timer()
}

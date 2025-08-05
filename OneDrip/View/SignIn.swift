import SwiftUI

struct SignIn: View {
    var onSignedIn: () -> Void
    @State private var isSignedIn = UserDefaults.standard.string(forKey: "userID") != nil
    @State private var hasCompletedSetup = false

    var body: some View {
        if hasCompletedSetup {
            Home()
        } else if isSignedIn {
            SetUp {
                hasCompletedSetup = true
            }
        } else {
            ZStack(alignment: .top) {
                Color("Background").ignoresSafeArea()

            
                RoundedRectangle(cornerRadius: 150, style: .continuous)
                    .fill(Color(hex: "B0E0E6"))
                    .frame(width: 401, height: 775)
                    .offset(y: 169)

            
                VStack(spacing: 16) {
                    VStack(spacing: 5) {
                        Text("OneDrip")
                            .font(.custom("ArialRoundedMTBold", size: 48))
                            .padding(.top, 30)

                        Text("Small steps. Real change. Memories that last.")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    .padding(30)

                    Spacer(minLength: 40)

                    VStack(spacing: 8) {
                        Text("1% everyday")
                            .font(.custom("ArialRoundedMTBold", size: 43))

                        Text("Is all it takes to capture your progress\nand keep your journey alive.")
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, -150)

                    VStack {
                        HStack(spacing: 1) {
                            Image(systemName: "drop.fill")
                                .foregroundColor(Color(hex: "CFADE8"))
                                .font(.system(size: 56))
                            Image(systemName: "drop.fill")
                                .foregroundColor(Color(hex: "5EB8D7"))
                                .font(.system(size: 85))
                            Image(systemName: "drop.fill")
                                .foregroundColor(Color(hex: "FFA89A"))
                                .font(.system(size: 56))
                        }
                        .padding(.top, 8)
                    }
                    .padding(.top, -30)

                    Spacer()
                }

                
                Text("Join a quiet journey of progress, where\nyour skills grow one small drip at a time.")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .position(x: 200.5, y: 580)

            
                AppleSignInButtonView {
                    isSignedIn = true
                }
                .position(x: 200.5, y: 660)
            }
            .frame(width: 401, height: 583)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    SignIn {
        print("Preview: Signed in")
    }
}


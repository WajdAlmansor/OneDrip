import SwiftUI

struct Settings: View {
    @State private var notificationsEnabled = true

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                
                    HStack {
                        Button(action: {
                            print("رجوع")
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 30))
                                .foregroundColor(.primary)
                        }

                        Spacer()

                        Text("Settings")
                            .font(.custom("ArialRoundedMTBold", size: 36))

                        Spacer()

                
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30))
                            .opacity(0)
                    }
                    .padding(.horizontal)

                    Spacer()
                    
                    SettingsSection(title: "Account", color: Color(hex: "#B2EBF2")) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Email")
                                Spacer()
                                Text("aaa@example.com")
                                    .foregroundColor(.gray)
                            }
                            Divider()
                            Button(action: {
                                print("Log out tapped")
                            }) {
                                Text("Log out")
                                    .foregroundColor(.black)
                            }
                            Divider()
                            Button(action: {
                                print("Delete account tapped")
                            }) {
                                Text("Delete account")
                                    .foregroundColor(.black)
                            }

                        }
                        .padding(.vertical, 12)
                    }

                
                    SettingsSection(title: "Notifications", color: Color(hex: "#CE93D8")) {
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                            .padding(.vertical, 12)
                    }

                
                    SettingsSection(title: "Privacy / Backup", color: Color(hex: "#FFAB91")) {
                        Button(action: {
                            print("iCloud Sync tapped")
                        }) {
                            HStack {
                                Text("iCloud Sync")
                                    .font(.system(size: 18, weight: .regular))
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color(hex: "#FFAB91"))
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 0)) 
                        }
                    }


                    // Info
                    SettingsSection(title: "Info", color: Color(hex: "#A5D6A7")) {
                        VStack(alignment: .leading, spacing: 12) {
                            Button(action: {
                                print("Support tapped")
                            }) {
                                Text("Support / Contact Us")
                                    .foregroundColor(.black)
                            }
                            Divider()
                            Button(action: {
                                print("Privacy tapped")
                            }) {
                                Text("Privacy Policy")
                                    .foregroundColor(.black)
                            }
                            Divider()
                            Button(action: {
                                print("Terms tapped")
                            }) {
                                Text("Terms & Conditions")
                                    .foregroundColor(.black)
                            }

                        }
                        .padding(.vertical, 12)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct SettingsSection<Content: View>: View {
    var title: String
    var color: Color
    var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.horizontal, 4)

            VStack {
                content()
            }
            .padding(.horizontal)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}

#Preview {
    Settings()
}

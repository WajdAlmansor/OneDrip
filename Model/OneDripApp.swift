import SwiftUI

@main
struct OneDripApp: App {
    @StateObject var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            if appViewModel.isSignedIn {
                Home()
            } else {
                SignIn {
                    appViewModel.isSignedIn = true
                }
            }
        }
    }
}

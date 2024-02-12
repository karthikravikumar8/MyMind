import SwiftUI

@main
struct MyMindApp: App {
    
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(appViewModel)
        }
    }
}

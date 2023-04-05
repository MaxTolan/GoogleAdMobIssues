// System initializer: tells the system to go to the exercise navigation view first to get the user started
import SwiftUI
import GoogleMobileAds

@main
struct SquatCounterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ExerciseNavigation()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Google Mobile Ads SDK
        GADMobileAds.sharedInstance().start(completionHandler: nil)

        return true
    }
}

//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//  var window: UIWindow?
//
//  func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//
//    // Initialize Google Mobile Ads SDK
//    GADMobileAds.sharedInstance().start(completionHandler: nil)
//
//    return true
//  }
//
//}

//@main
//struct SquatCounterApp: App {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
//
//        return true
//      }
//    var body: some Scene {
//            WindowGroup {
//                ExerciseNavigation()
//            }
//
//        }
//}
extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

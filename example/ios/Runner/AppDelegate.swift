import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
// void dummyMethodToEnforceBundling() {
//   // This function exists to prevent linker stripping
// }
// public func dummyMethodToEnforceBundling() -> Int64 {
//   return dummy_method_to_enforce_bundling()
// }
// let dummyVar = dummyMethodToEnforceBundling();
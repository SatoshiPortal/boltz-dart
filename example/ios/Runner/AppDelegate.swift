import Flutter
import UIKit

<<<<<<< HEAD
@main
=======
// let dummy = dummy_method_to_enforce_bundling()
// print(dummy)
@UIApplicationMain
>>>>>>> trunk
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

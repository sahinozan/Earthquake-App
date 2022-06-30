import UIKit
import Flutter
import GoogleMaps
// import Firebase
import FirebaseCore
import FirebaseFirestore
// import FirebaseAuth

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override init() {
    super.init()
    FirebaseApp.configure()
  }
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDX3OXYNrfuuKWvsY8Z4sSj7hjudUTW7bg")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
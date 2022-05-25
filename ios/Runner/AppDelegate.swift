import UIKit
import Flutter
import GoogleMaps

GOOGLE_MAPS_API_KEY = GMSServices.provideAPIKey("AIzaSyAIZXaAnpyY-Rzk2LUFEgy_TkzTuOj2k00")

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GOOGLE_MAPS_API_KEY
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

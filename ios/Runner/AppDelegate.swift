import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var favorites: [String] = []
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.myapp/favorites", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
      switch call.method {
      case "saveFavorite":
        if let id = call.arguments as? [String: Any], let pokemonId = id["id"] as? String {
          self.favorites.append(pokemonId)
          result(nil)
        }
      case "getFavorites":
        result(self.favorites)
      case "removeFavorite":
        if let args = call.arguments as? [String: Any], 
          let pokemonId = args["id"] as? String {
            self.favorites.removeAll(where: { element in element == pokemonId })
            result(nil)
          }
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return true
  }
}

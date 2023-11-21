//
//  Persistence.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AyachiZakariaQuiz")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

It looks like there might be a typo in your question ("sprite shit" instead of "sprite sheet"). Assuming you are asking about loading a sprite sheet into a SwiftUI app in Swift, I'll provide a general approach.

To load a sprite sheet in a SwiftUI app, you can follow these steps:

Prepare Your Sprite Sheet:

Make sure your sprite sheet is in a format that is easy to work with. Common formats include PNG and GIF.
Ensure that all sprites are arranged in a grid within the sprite sheet.
Add the Sprite Sheet to Your Xcode Project:

Drag and drop the sprite sheet into your Xcode project. Make sure to add it to the target you are working on.
Create a SwiftUI View for Your Sprite:

Create a new SwiftUI view that will represent a single sprite from the sprite sheet.
swift
Copy code
import SwiftUI

struct SpriteView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50) // Adjust the size as needed
    }
}
Slice the Sprite Sheet:

Use the UIImage or NSImage APIs to slice the sprite sheet into individual sprites. You can create an array of images, each representing a single sprite.
swift
Copy code
extension UIImage {
    func sliceSpriteSheet(columns: Int, rows: Int) -> [UIImage] {
        var sprites: [UIImage] = []

        let spriteWidth = self.size.width / CGFloat(columns)
        let spriteHeight = self.size.height / CGFloat(rows)

        for row in 0..<rows {
            for column in 0..<columns {
                let rect = CGRect(x: CGFloat(column) * spriteWidth, y: CGFloat(row) * spriteHeight, width: spriteWidth, height: spriteHeight)
                if let image = self.cgImage?.cropping(to: rect) {
                    sprites.append(UIImage(cgImage: image))
                }
            }
        }

        return sprites
    }
}
Use this function to slice your sprite sheet into individual sprites.
Use the SpriteView in Your SwiftUI App:

Use the SpriteView you created in your main SwiftUI view.
swift
Copy code
struct ContentView: View {
    let sprites: [UIImage] = // Call the sliceSpriteSheet function here

    var body: some View {
        VStack {
            ForEach(sprites, id: \.self) { sprite in
                SpriteView(imageName: "yourSpriteImageName") // Pass the appropriate image name here
            }
        }
    }
}
Adjust the layout and appearance according to your app's requirements.
Remember to replace "yourSpriteImageName" with the actual image name you assigned to the individual sprites when you added them to your Xcode project. Additionally, adjust the sizing and layout based on your specific needs.









In Swift, you can check whether the device has an active internet connection by using the `Reachability` class. If you are working with iOS, Apple recommends using the `Network` framework for these tasks. Here's an example using the `Network` framework:

```swift
import Network

class NetworkManager {

    private let monitor = NWPathMonitor()

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Device is connected to the internet.")
            } else {
                print("Device is not connected to the internet.")
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}

// Example usage
let networkManager = NetworkManager()
```

This example sets up a `NWPathMonitor` to monitor the device's network path. The `pathUpdateHandler` closure is called whenever the network status changes. If the `path.status` is `.satisfied`, it means the device is connected to the internet. If not, it means there is no internet connection.

Make sure to add the necessary permissions in your app's Info.plist file for network access. Add the following key:

```xml
<key>NSAllowsArbitraryLoads</key>
<true/>
```

This allows your app to make arbitrary loads, including accessing the internet.

Note: The `Network` framework is available starting from iOS 12.0, macOS 10.14, watchOS 5.0, and tvOS 12.0. If you need to support earlier versions, you may want to consider using third-party libraries like `ReachabilitySwift`.










In SwiftUI, you can use `Alert` to notify the user when there is no internet connection. Here's an example of how you might modify the code to work in a SwiftUI environment:

```swift
import SwiftUI
import Network

class NetworkManager: ObservableObject {
    @Published var isInternetConnected = true

    private let monitor = NWPathMonitor()

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isInternetConnected = (path.status == .satisfied)
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()

    var body: some View {
        VStack {
            if networkManager.isInternetConnected {
                Text("Device is connected to the internet.")
            } else {
                Text("Device is not connected to the internet.")
                    .onAppear {
                        networkManager.showNoInternetAlert()
                    }
            }
        }
    }
}

extension NetworkManager {
    func showNoInternetAlert() {
        let alertController = UIAlertController(
            title: "No Internet Connection",
            message: "Please check your internet connection and try again.",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        // Ensure that you present the alert on the main thread
        DispatchQueue.main.async {
            // You need to get the root view controller of the current scene
            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

In this SwiftUI example, the `ContentView` displays different text based on the internet connection status. If there is no internet connection, the `onAppear` modifier triggers the alert. The `NetworkManager` class is an `ObservableObject`, allowing it to update the UI automatically when the internet connection status changes. The `Alert` is presented using the `UIAlertController` in the `showNoInternetAlert` method.

Please note that SwiftUI's `Alert` is a bit different from UIKit's `UIAlertController`, and you typically use the `Alert` view directly in your SwiftUI code. However, for presenting alerts in response to changes outside SwiftUI's view hierarchy, the approach with `UIAlertController` might be suitable.





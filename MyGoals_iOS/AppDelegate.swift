//
//  AppDelegate.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 04. 17..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
        
        // to be able to handle the actions upon notifications
        notificationCenter.delegate = self
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MyGoals_iOS")
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
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Processing notifications in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        /*
        if notification.request.content.categoryIdentifier ==
                 "MEETING_INVITATION" {
           // Retrieve the meeting details.
           let meetingID = notification.request.content.userInfo["MEETING_ID"] as! String
           let userID = notification.request.content.userInfo["USER_ID"] as! String
                 
           // Add the meeting to the queue.
           //sharedMeetingManager.queueMeetingForDelivery(user: userID, meetingID: meetingID)

           // Play a sound to let the user know about the invitation.
           completionHandler(.sound)
           return
        }
        else {
           // Handle other notification types...
        }*/

        // Don't alert the user for other types.
        //completionHandler(UNNotificationPresentationOptions(rawValue: 0))
        
        // show alert while app is running in foreground
        completionHandler([.alert, .badge, .sound])
    }
    
    // Handling the actions for the notifications (is used for jumping to the correct viewController)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                didReceive response: UNNotificationResponse,
                withCompletionHandler completionHandler:
                   @escaping () -> Void) {
       // Get the meeting ID from the original notification.
       let userInfo = response.notification.request.content.userInfo
            
       if (response.notification.request.content.categoryIdentifier == "GOLDEN_SENTENCE_NOTIFICATION") {
          // Retrieve the meeting details.
          let sampleData1 = userInfo["SAMPLE_DATA_1"] as! String
          let sampleData2 = userInfo["SAMPLE_DATA_2"] as! String
                
          switch response.actionIdentifier {
          case "CLOSE_ACTION":
             print(sampleData1 + sampleData2)

             /* Open a specific VC
             https://fluffy.es/open-app-in-specific-view-when-push-notification-is-tapped-ios-13/
              
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let newViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
             
             (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController?.present(newViewController, animated: false, completion: nil)
             */
             
             break
                    
          default:
             break
          }
       }
       else {
          // Handle other notification types...
       }
        
       // Always call the completion handler when done.
       completionHandler()
    }
    
}

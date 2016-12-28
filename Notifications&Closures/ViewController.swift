//
//  ViewController.swift
//  Notifications&Closures
//
//  Created by Next on 26/12/16.
//  Copyright © 2016 Next. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notification center observer
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateNotification), name: NSNotification.Name(rawValue: "COLORCHANGING"), object: nil)
        
        
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.body = "Call Me When You Get This"
        //content.badge = 1
        content.sound = UNNotificationSound.default()
        
        //adding image
        if let path = Bundle.main.path(forResource: "erp_logo", ofType: "png") {
            let url = URL(fileURLWithPath: path)
            
            do {
                let attachment = try UNNotificationAttachment(identifier: "logo", url: url, options: nil)
                content.attachments = [attachment]
            } catch {
                print("The attachment was not loaded.")
            }
        }
        
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
                                                title: "Delete", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                              actions: [snoozeAction,deleteAction],
                                              intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        
        content.categoryIdentifier = "UYLReminderCategory"
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                        repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        
        
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
                
            }
        })
        
    }

    func updateNotification() {
        
        self.view.backgroundColor = UIColor.cyan
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


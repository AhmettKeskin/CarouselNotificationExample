//
//  NotificationHelper.swift
//  NotificationContentExample
//
//  Created by Ahmet Keskin on 13/01/2018.
//  Copyright © 2018 AhmetKeskin. All rights reserved.
//

import Foundation
import UserNotifications
import UserNotificationsUI

class NotificationHelper {
        
    class func registerNotification(){
        if #available(iOS 10.0, *) {
            let options: UNAuthorizationOptions = [.alert]
            UNUserNotificationCenter.current().requestAuthorization(options: options) { (authorized, error) in
                if authorized {
                    let categoryIdentifier = "carousel"
                    let carouselNext = UNNotificationAction(identifier: "carousel.next", title: ">>", options: [])
                    let carouselPrevious = UNNotificationAction(identifier: "carousel.previous", title: "<<", options: [])
                    let carouselCategory = UNNotificationCategory(identifier: categoryIdentifier, actions: [carouselNext, carouselPrevious], intentIdentifiers: [], options: [])
                    UNUserNotificationCenter.current().setNotificationCategories([carouselCategory])
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    class func prepareLocalPushAndSend(timeInterval: TimeInterval){
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.categoryIdentifier = "carousel"
        content.title = "Dolap.com"
        content.subtitle = ""
        content.body = "carousel notification"
        
        content.userInfo = ["images" : "https://cdn.dolap.com/product/org/bebek/patik/0-3-ay-13-diger_9802441.jpg" +
            ",https://cdn.dolap.com/product/org/giyim/bluz/s-36-diger_10031017.jpg" +
            ",https://cdn.dolap.com/product/org/ayakkabi/ince-topuklu/38-forever-new_8322065.jpg" +
            ",https://cdn.dolap.com/product/org/aksesuar/taki/diger_10027815.jpg"
        ]
        
        let request = UNNotificationRequest(identifier: "exampleNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
}

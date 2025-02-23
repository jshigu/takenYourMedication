//
//  File.swift
//  wdk02 Watch App
//
//  Created by 世吉 on 2024/06/04.
//
//
import UIKit
import UserNotifications

//class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
//    var selectionValueTime2 = 0
//    var selectionValueMini2 = 5
//    
//    static let shared = NotificationManager()
//    
//    private override init() {
//        super.init()
//        // フォアグラウンドでも通知が表示されるようにする
//        UNUserNotificationCenter.current().delegate = self
//        requestAuthorization()
//    }
//    
//    private func requestAuthorization() {
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                let _ = print("許可されました")
//                //print("許可されました！")
//            }else{
//                let _ = print("拒否されました...")
//                //print("拒否されました...")
//            }
//        }
//    }
//    
//    //通知の削除
//    private func deleteAuthorization() {
//        let center = UNUserNotificationCenter.current()
//        //PendingNotificationを全削除
//        //通知をしたけれどもまだ端末に通知が届いていない場合
//        center.removeAllPendingNotificationRequests()
//        // DeliveredNotificationを全削除
//        //通知は完了したけれども端末の通知センターに通知が残っている場合
//        center.removeAllDeliveredNotifications()
//    }
//    
//    // 通知内容を確認
//    private func listAuthorization() {
//        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
//            for request in requests {
//                print("通知ID: \(request.identifier), 通知Title: \(request.content.title)")
//            }
//        }
//    }
//    
//    func scheduleNotification() {
//        //ローカル通知の削除
//        deleteAuthorization()
//          
//        //記録されているベル_リスト値を入れる
//        selectionValueTime2 = 0
//        selectionValueMini2 = 5
//        
//        //通知の中身を設定
//        let content = UNMutableNotificationContent()
//        content.title = "Bell \(selectionValueTime2):\(selectionValueMini2)"
//        content.body = "It's time!"
//        content.sound =  UNNotificationSound.default // 音を指定
//        content.badge = 1
//        
//        //"指定時間後に通知を発行するトリガー
//        var date = DateComponents()
//        date.hour = selectionValueTime2
//        date.minute = selectionValueMini2
//        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
//        
//        //通知のリクエストの作成
//        let request = UNNotificationRequest(identifier: "uniqueIdentifier", content: content, trigger: trigger)
//        //リクエストの追加
//        UNUserNotificationCenter.current().add(request)
//            
//        listAuthorization()
//    }
//    
//    // 通知が表示される際に呼ばれるデリゲートメソッド
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        if #available(iOS 14.0, *) {
//            completionHandler([.banner, .sound, .badge])
//        } else {
//            completionHandler([.alert, .sound])
//        }
//    }
//}
//

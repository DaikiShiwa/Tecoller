//
//  MyDogViewController.swift
//  Tecoller
//
//  Created by 志波大輝 on 2018/11/28.
//  Copyright © 2018 志波大輝. All rights reserved.
//

import UIKit
import UserNotifications
import MBCircularProgressBar

class MyDogViewController: UIViewController {
    
    let content = UNMutableNotificationContent()
    let timerNotificationIdentifier = "id1"
    
//    var trigger: UNNotificationTrigger
    
    @IBOutlet weak var mainBarView: MBCircularProgressBarView!
    
    @IBOutlet weak var tempBarView: MBCircularProgressBarView!
    
    @IBOutlet weak var dogtempBarView: MBCircularProgressBarView!
    
    @IBOutlet weak var humBarView: MBCircularProgressBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainBarView.value = 0
        self.tempBarView.value = 0
        self.dogtempBarView.value = 0
        self.humBarView.value = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 5.0) {
            self.mainBarView.value = 44
            self.tempBarView.value = 32
            self.dogtempBarView.value = 38
            self.humBarView.value = 50
        }
    }
//    func startPush(){
//        //5秒後にプッシュ通知を飛ばす
//        //通知飛ばしていいかの許可
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            if(settings.authorizationStatus == .authorized){
//                //知らせる
//                self.push()
//            }else{
//                UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert], completionHandler: { (granted, error) in
//                    if let error = error{
//                        print(error)
//                    }else{
//                        if(granted){
//                            self.push()
//                        }
//                    }
//                })
//            }
//        }
//    }
//
    func push(){
        //テキストフィールドの中にある文字をセットする
        content.title = "ポチ"
        content.body = "熱中症になりそうだよ〜"
        content.sound = UNNotificationSound.default

        if let path = Bundle.main.path(forResource: "481327.jog_", ofType: "png") {
            content.attachments = [try! UNNotificationAttachment(identifier: timerNotificationIdentifier, url: URL(fileURLWithPath: path), options: nil)]
        }
//        let attach = try! UNNotificationAttachment(identifier: timerNotificationIdentifier, url: timerIconURL!, options: nil)
//
//        content.attachments.append(attach)
        //5秒後に送信する
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: timerNotificationIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            //エラー処理
            if let error = error{
                print(error)
            }else{
                print("配信されました！")
            }
        }
    }
//
    @IBAction func tap(_ sender: Any) {
        push()
    }
}
//
//    func show(style: UIAlertController.Style) {
//        let alertController = UIAlertController(title: "title", message: nil, preferredStyle: style)
//        let action1 = UIAlertAction(title: "action1", style: .default){ (action: UIAlertAction) in
//            print("tap action1")
//        }
//        alertController.addAction(action1)
//
//        //
//        let action2 = UIAlertAction(title: "action2", style: .default){ (action: UIAlertAction) in
//            print("tap action2")
//        }
//        alertController.addAction(action2)
//
//        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        UIApplication.shared.keyWindow?.rootViewController?.present(alertController,animated: true,completion: nil)
//    }


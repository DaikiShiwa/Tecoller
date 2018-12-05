//
//  LoginViewController.swift
//  Tecoller
//
//  Created by 志波大輝 on 2018/11/29.
//  Copyright © 2018 志波大輝. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var dogNameTextField: UITextField!
    
    @IBOutlet weak var didTouchButton: UIButton!
    
    //    deinit {
//        if let observers = observers {
//            NotificationCenter.default.removeObserver(observers.player)
//            NotificationCenter.default.removeObserver(observers.willEnterForeground)
//            observers.boundsObserver.invalidate()
//        }
//    }
//
//    private var observers: (player: NSObjectProtocol, willEnterForeground: NSObjectProtocol, boundsObserver: NSKeyValueObservation)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogNameTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //キーボードを閉じる
        dogNameTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dogNameTextField.resignFirstResponder()
    }
    
    
}
//        let path = Bundle.main.path(forResource: "sample", ofType: "mp4")!
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        player.actionAtItemEnd = .none // default: pause
//        //player.isMuted = false // default: false
//        player.play()
//
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = view.bounds
//        playerLayer.videoGravity = .resizeAspectFill
//        playerLayer.zPosition = -2
//        view.layer.insertSublayer(playerLayer, at: 0)
//
//        let dimOverlay = CALayer()
//        dimOverlay.frame = view.bounds
//        dimOverlay.backgroundColor = UIColor.black.cgColor
//        dimOverlay.zPosition = -1
//        dimOverlay.opacity = 0.4
//        view.layer.insertSublayer(dimOverlay, at: 0)
//
//        let playerObserver = NotificationCenter.default.addObserver(
//            forName: .AVPlayerItemDidPlayToEndTime,
//            object: player.currentItem,
//            queue: .main) { [weak playerLayer] _ in
//                playerLayer?.player?.seek(to: CMTime.zero)
//                playerLayer?.player?.play()
//        }
//
//        let willEnterForegroundObserver = NotificationCenter.default.addObserver(
//            forName: UIApplication.willEnterForegroundNotification,
//            object: nil,
//            queue: .main) { [weak playerLayer] _ in
//                playerLayer?.player?.play()
//        }
//
//        let boundsObserver = view.layer.observe(\.bounds) { [weak playerLayer, weak dimOverlay] view, _ in
//            DispatchQueue.main.async {
//                playerLayer?.frame = view.bounds
//                dimOverlay?.frame = view.bounds
//            }
//        }
//
//        observers = (playerObserver, willEnterForegroundObserver, boundsObserver)
//    }

//
//  SignUserVC.swift
//  playaround
//
//  Created by Marco Martínez on 09/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//
import AVFoundation
import UIKit

class SignUserVC: UIViewController {
    
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    @IBOutlet weak var container:UIView!
    
    lazy var signUpVC:SignUpVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpScreen") as! SignUpVC
    
    lazy var onBoardingVC:OnBoardingVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnBoardingScreen") as! OnBoardingVC
    
    lazy var loginVC:LoginVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as! LoginVC
    
    
    
    override func viewDidLoad() {
        let theURL:URL = Bundle.main.url(forResource:"bg_video", withExtension: "mp4")!
        
        
        avPlayer = AVPlayer(url: theURL)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        avPlayerLayer.frame = view.layer.bounds
        
        let bgView = UIView(frame: self.view.bounds)
        bgView.backgroundColor = UIColor(red: 5/255, green: 58/255, blue: 99/255, alpha: 0.6)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        view.layer.insertSublayer(bgView.layer, at: 1)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        
        onBoardingVC.view.frame = container.bounds
        signUpVC.view.frame = container.bounds
        loginVC.view.frame = container.bounds
        
        onBoardingVC.parentVC = self
        signUpVC.parentVC = self
        loginVC.parentVC = self
        
        onBoardingVC.view.tag = 100
        container.addSubview(onBoardingVC.view)
        
        //SignUpScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil )
    }
    
    func showLoginScreen(){
        container.viewWithTag(100)?.removeFromSuperview()
        loginVC.view.tag = 100
        container.addSubview(loginVC.view)
    }
    
    func showSignUpScreen(){
        container.viewWithTag(100)?.removeFromSuperview()
        signUpVC.view.tag = 100
        container.addSubview(signUpVC.view)
    }
    
    func showOnBoarding(){
        container.viewWithTag(100)?.removeFromSuperview()
        onBoardingVC.view.tag = 100
        container.addSubview(onBoardingVC.view)
    }
    
    func signInWithoutUser(){
        performSegue(withIdentifier: "FirstScreenSegue", sender: nil)
    }
}

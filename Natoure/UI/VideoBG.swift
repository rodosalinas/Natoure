//
//  VideoBG.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import AVFoundation
import UIKit

class VideoBG:UIViewController{
    
    private var avPlayer: AVPlayer!
    private var avPlayerLayer: AVPlayerLayer!
    private var paused: Bool = false
    
    var url:URL? = nil
    
    func generateView(){
        if(url != nil){
            avPlayer = AVPlayer(url: url!)
            avPlayerLayer = AVPlayerLayer(player: avPlayer)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            avPlayer.volume = 0
            avPlayer.actionAtItemEnd = .none
            avPlayerLayer.frame = view.layer.bounds
            
            
            view.layer.insertSublayer(avPlayerLayer, at: 0)
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: avPlayer.currentItem)
        }
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil )
    }
    
    func play(){
        avPlayer.play()
        paused = false
    }
    
    func pause(){
        avPlayer.pause()
        paused = false
    }
    
    func isPaused() -> Bool{
        return self.paused
    }
    
}

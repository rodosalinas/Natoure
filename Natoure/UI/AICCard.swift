//
//  AICCard.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import AVFoundation
import UIKit


class AICCard: UIControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var aic:AICResume!
    
    var bgSource : Picture? = nil
    
    func updateView(){
        
        
        if aic.preview != nil{
            bgSource = aic.preview!
        }else if aic.video != nil{
            bgSource = aic.video!
        }
        
        print(bgSource!.type)
        
        
        
        if bgSource != nil {
            switch bgSource?.type {
            case "IMG":
                self.addSubview(getImageBG())
            case "VIDEO":
                self.layer.addSublayer(getVideoBG())
            default:
                break
            }
            
        }
        
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        overlay.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        self.addSubview(overlay)
        
        let title = UITextView(frame: CGRect(x: 5, y: self.frame.height * 0.70, width: self.frame.width - 10, height: self.frame.height * 0.25))
        
        title.text = aic.name
        title.textAlignment = .center
        
        title.textColor = UIColor.white
        title.backgroundColor = UIColor.clear
        self.addSubview(title)
        
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }
    
    func getImageBG() -> UIImageView{
        
        print(bgSource!.url)
        let imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        imageBG.downloadedFrom(link: bgSource!.url)
        imageBG.contentMode = .center
        return imageBG
    }
    
    func getVideoBG() -> AVPlayerLayer{
        let avPlayer = AVPlayer(url: URL(string: bgSource!.url)!)
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        avPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        avPlayer.play()
        
        NotificationCenter.default.addObserver(self,
         selector: #selector(playerItemDidReachEnd(notification:)),
         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
         object: avPlayer.currentItem)
         
         return avPlayerLayer
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil )
    }

}

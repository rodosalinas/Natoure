//
//  SlidingCards.swift
//  playaround
//
//  Created by Marco Martínez on 02/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import AVFoundation
import UIKit

class SlidingCards: UIControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var current = 0
    
    var videos:[AVPlayer] = []
    
    var  pointsInformation : [LocationResume] = []
    var scrollBar:UIScrollView!
    
    var cardWidth:CGFloat!
    
    var scrollWidth:CGFloat = 0
    func updateView(){
        scrollBar = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        cardWidth = self.frame.width * 0.35
        
        
        for (cardIndex, card) in pointsInformation.enumerated(){
            
            let position = 10 + (cardWidth * CGFloat(cardIndex)) + (10 * CGFloat(cardIndex))
            
            let view = UIView(frame: CGRect(x: position, y: 0, width: cardWidth, height: self.frame.height)  )
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            
            
            
            if card.preview != nil{
                if card.preview!.type == "IMG"{
                    let imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: cardWidth, height: self.frame.height))
                    imageBG.downloadedFrom(link: card.preview!.url)
                    imageBG.contentMode = .center
                    imageBG.layer.masksToBounds = true
                    view.addSubview(imageBG)
                    print("ok")
                    print("\(position)")
                }else{
                    
                    let avPlayer = AVPlayer(url: URL(string: card.preview!.url)!)
                    let avPlayerLayer = AVPlayerLayer(player: avPlayer)
                    avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    avPlayer.volume = 0
                    avPlayer.actionAtItemEnd = .none
                    
                    avPlayerLayer.frame = view.layer.bounds
                    videos.append(avPlayer)
                    view.layer.addSublayer(avPlayerLayer)
                    
                    avPlayer.play()
                    
                    NotificationCenter.default.addObserver(self,
                                                           selector: #selector(playerItemDidReachEnd(notification:)),
                                                           name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                           object: avPlayer.currentItem)
                    print(card.preview!.type)
                }
            }else if card.video != nil {
                if card.video!.type == "IMG"{
                    let imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: cardWidth, height: self.frame.height))
                    imageBG.downloadedFrom(link: card.video!.url)
                    imageBG.contentMode = .center
                    imageBG.layer.masksToBounds = true
                    view.addSubview(imageBG)
                    print("ok")
                    print("\(position)")
                }else{
                    
                    let avPlayer = AVPlayer(url: URL(string: card.video!.url)!)
                    let avPlayerLayer = AVPlayerLayer(player: avPlayer)
                    avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    avPlayer.volume = 0
                    avPlayer.actionAtItemEnd = .none
                    
                    avPlayerLayer.frame = view.layer.bounds
                    videos.append(avPlayer)
                    view.layer.addSublayer(avPlayerLayer)
                    
                    avPlayer.play()
                    
                    NotificationCenter.default.addObserver(self,
                                                           selector: #selector(playerItemDidReachEnd(notification:)),
                                                           name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                           object: avPlayer.currentItem)
                    print(card.video!.type)
                }
            }else{
                
            }
            
            let bg = UIView(frame: CGRect(x: 0, y: 0, width: cardWidth, height: self.frame.height  ))
            bg.backgroundColor = UIColor(red: 5/255, green: 58/255, blue: 99/255, alpha: 0.6)
            view.addSubview(bg)
            
            
            if card.ecoRating != nil {
                let ecoRating = RatingControl( frame: CGRect(x: 2, y: view.frame.height - 35, width: cardWidth * 0.6, height: 20))
                
                ecoRating.positiveAsset = UIImage(named: "ico_hojaon")
                ecoRating.emptyAsset = UIImage(named: "ico_hojaoff")
                ecoRating.halfAsset = UIImage(named: "ico_hojaoff")
                
                ecoRating.userRate = Float(card.ecoRating!)!
                
                //print(card.ecoRating)
                ecoRating.backgroundColor = UIColor.clear
                if card.ratingCount != nil {
                    let countRatingLabel = UILabel(frame: CGRect(x: ecoRating.frame.width + 5 , y: ecoRating.frame.origin.y , width: 60, height: 20) )
                    countRatingLabel.text =  "(\(card.ratingCount!))"
                    countRatingLabel.font = UIFont.systemFont(ofSize: 14.0)
                    countRatingLabel.textColor = UIColor.white
                    view.addSubview(countRatingLabel)
                }
                view.addSubview(ecoRating)
            }
            
            let activityNameLabel = UILabel(frame: CGRect(x: 5, y: view.frame.height - 85 , width: cardWidth - 10, height: 45) )
            
            activityNameLabel.numberOfLines = 0
            activityNameLabel.text = card.name
            activityNameLabel.font = UIFont.systemFont(ofSize: 12.0)
            activityNameLabel.textAlignment = .center
            activityNameLabel.textColor = UIColor.white
            
            
            
            
            let typeMarker =  UIView(frame: CGRect(x: 0, y: view.frame.height - 12 , width: cardWidth, height: 12)  )
            typeMarker.layer.cornerRadius = 10
            typeMarker.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            switch card.tourismTypes {
            case "RURAL"?:
                typeMarker.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            case "ADVENTURE"?:
                typeMarker.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            case "NATURE"?:
                typeMarker.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            default:
                typeMarker.backgroundColor = UIColor.clear
            }
            
            let btn = UIButton(frame: view.bounds)
            btn.tag = card.id!
            btn.addTarget(self, action: #selector(sendAction(button: )), for: .touchUpInside)
            
            
            
            //btn.backgroundColor
            
            scrollWidth +=  cardWidth + 10
            
            view.backgroundColor = UIColor.white
            
            view.addSubview(typeMarker)
            
            view.addSubview(activityNameLabel)
            view.addSubview(btn)
            scrollBar.addSubview(view)
        }
        
        scrollWidth += 10
        
        scrollBar.contentSize = CGSize(width: scrollWidth, height: self.frame.height)
        scrollBar.isScrollEnabled = true
        
        scrollBar.showsHorizontalScrollIndicator = false
        
        self.addSubview(scrollBar)
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }
    
    func scrollToPosition(_ index: Int) {
        UIView.animate(withDuration: 0.2, animations: {
            self.scrollBar.contentOffset.x = self.cardWidth * CGFloat(index) + 10 * CGFloat(index)
        })
    }
    
    
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil )
    }
    
    @objc func sendAction(button:UIButton) {
        
        current = button.tag
        print(button.tag)
        print("clicked inside")
        
        sendActions(for: .valueChanged)
        
        
    }

}

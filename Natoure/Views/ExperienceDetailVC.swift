//
//  ExperienceDetailVC.swift
//  natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/06/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Alamofire
import AVFoundation
import SwiftyJSON
import UIKit


class ExperienceDetailVC: UIViewController {
   
    @IBOutlet var scrollView:UIScrollView?
    @IBOutlet var scrollContent:UIView?
    
    @IBOutlet weak var experienceTitle: UILabel!
    @IBOutlet weak var experienceLocation: UILabel!
    
    @IBOutlet weak var experienceDetail: UILabel!
    
    @IBOutlet weak var experienceIncludes: UILabel!
    
    @IBOutlet weak var dificultyRate: RatingControl!
    @IBOutlet weak var advisedAgeLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var groupCapacityLabel: UILabel!
    @IBOutlet weak var recommendedGearLabel: UILabel!
    @IBOutlet weak var lenguagesLabel: UILabel!
    @IBOutlet weak var nearCityLabel: UILabel!
    
    @IBOutlet weak var experienceCardTitle: UILabel!
    @IBOutlet weak var experienceCardCommunity: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var petfriendlyLabel: UILabel!
    @IBOutlet weak var kidsfriendlyLabel: UILabel!
    @IBOutlet weak var hostingLabel: UILabel!
    
    @IBOutlet weak var videoContainer: UIView!
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    
    @IBAction func bookNow(_ sender: Any) {
        let url = "http://natoure.org/api/order/"
        
        
        /*
         experienceID
         
         @param $request [
         *  int experienceID: Identificador de una experiencia
         *  int userID: Identificador de un usuario
         *  string date: fecha inicio de la orden
         *  array details: detalles de compra de la orden
         *  string endDate: fecha final de la orden
         *  string status
         *  ]
        */
        
        Alamofire.request(url, method:.patch).validate().responseJSON { response in
            
        }
    }
    
    var experience: Experience? = nil
    
    override func viewDidLoad() {
        print("here")
        if experience != nil {
            self.scrollView?.contentSize.height = 600
            
            print(experience!.name)
            
            self.dificultyRate.userRate = Float((experience!.difficulty))
            
            
            self.experienceTitle.text = experience?.name
            
            self.experienceLocation.text = "\(experience!.country) / \(experience!.address)"
            
            self.experienceDetail.text = experience?.resume
            
            let includes = experience?.includes.replacingOccurrences(of: ",", with: "\n")
            
            self.experienceIncludes.text = includes
            
            
            self.experienceCardTitle.text = experience?.name
            
            self.experienceCardCommunity.text = experience?.hostName
            
            let value = Float((experience?.difficulty)!)
            
            self.dificultyRate.rate = value
            self.advisedAgeLabel.text = "\(experience!.ageMin) - \(experience!.ageMax)"
            self.hoursLabel.text = experience?.workdays
            self.groupCapacityLabel.text = String(experience!.groupCapacity)
            self.recommendedGearLabel.text = experience?.clothes
            self.lenguagesLabel.text = experience?.language//nearCity
            self.nearCityLabel.text = experience!.nearCity
            
            
            if experience!.petFriendly == 1{
                self.petfriendlyLabel.text = "Si"
            }else{
                self.petfriendlyLabel.text = "No"
            }
            
            if experience!.kidsFriendly == 1{
                self.kidsfriendlyLabel.text = "Si"
            }else{
                self.kidsfriendlyLabel.text = "No"
            }
            
            if experience!.sleepOver == 1{
                self.hostingLabel.text = "Si"
            }else{
                self.hostingLabel.text = "No"
            }
            
            
            let url = NSURL(string: experience!.video)
            
            print(experience!.video)
            
            avPlayer = AVPlayer(url: url! as URL)
            
            avPlayerLayer = AVPlayerLayer(player: avPlayer)
            
            avPlayerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            avPlayer.volume = 0
            avPlayer.actionAtItemEnd = .none
            videoContainer.layer.addSublayer(avPlayerLayer)
            avPlayer.play()
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: avPlayer.currentItem)
            
            //self.
            
            //self.price.text = experience?.prices[0].price
        }
        
        //https://natoure.org/api/experience?experienceID=3
        //let url = "https://natoure.org/api/\(currentList)/list"
        //let url = "https://natoure.org/api/experience?experienceID=3&prices=true"
       
            
            
        
        
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
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        //p.seek(to: kCMTimeZero)
        p.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
}


//
//  HostVC.swift
//  playaround
//
//  Created by Marco Martínez on 16/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class HostVC: UIViewController{
    
    var host:Host? = nil
    let url = "https://natoure.org/api/host?hostID=1&acknowledgment=true&galleries=true"
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var ecoRating: RatingControl!
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var aic: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var videoContainer: UIView!
    @IBOutlet weak var culturalCir: UIView!
    @IBOutlet weak var adventureCir: UIView!
    @IBOutlet weak var natureCir: UIView!
    @IBOutlet weak var ruralCir: UIView!
    
    @IBOutlet weak var aicLogo: UIImageView!
    override func viewDidLoad() {
        
        if host != nil {
            self.name.text = self.host!.name
            self.city.text = "\(self.host!.country) / \(self.host!.state)"
            self.aic.text = self.host!.aicName
            self.about.text = self.host!.about
            self.descriptionLabel.text = self.host!.description
            
            if self.host!.aicLogo != nil{
                aicLogo.downloadedFrom(link: self.host!.aicLogo!.url)
            }
            let activities = self.host!.tourismTypes!.components(separatedBy: ",")
            var nature = false
            var rural = false
            var adventure = false
            var cultural = false
            for activity in activities{
                if activity == "NATURE"{
                    nature = true
                }
                if activity == "RURAL"{
                    rural = true
                }
                if activity == "ADVENTURE"{
                    adventure = true
                }
                if activity == "CULTURAL"{
                    cultural = true
                }
            }
            if !nature{
                natureCir.backgroundColor = UIColor.clear
                natureCir.layer.borderWidth = 2
                natureCir.layer.borderColor = UIColor(red: 90/255, green: 200/255, blue: 95/255, alpha: 1).cgColor
            }
            if !rural{
                
                ruralCir.backgroundColor = UIColor.clear
                ruralCir.layer.borderWidth = 2
                ruralCir.layer.borderColor = UIColor(red: 226/255, green: 92/255, blue: 48/255, alpha: 1).cgColor
            }
            if !adventure{
                
                adventureCir.backgroundColor = UIColor.clear
                adventureCir.layer.borderWidth = 2
                adventureCir.layer.borderColor = UIColor(red: 46/255, green: 130/255, blue: 210/255, alpha: 1).cgColor
            }
            if !cultural{
                
                culturalCir.backgroundColor = UIColor.clear
                culturalCir.layer.borderWidth = 2
                culturalCir.layer.borderColor = UIColor(red: 198/255, green: 187/255, blue: 70/255, alpha: 1).cgColor
            }
            //self.host!tourismTypes
        }
        /*Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result{
            case .success(let data):
                
                print(data)
                
                do{
                    let expJSON = JSON(data)
                    let decoder = JSONDecoder()
                    self.host = try decoder.decode(Host.self, from: expJSON["Host"].rawData())
                    
                    if self.host != nil{
                        self.name.text = self.host!.name
                        self.city.text = "\(self.host!.country) / \(self.host!.state)"
                        self.aic.text = self.host!.aicName
                        self.about.text = self.host!.about
                        self.descriptionLabel.text = self.host!.description
                        
                    }
                    
                    //print(experience.hostName!)
                    
                    //self.experience = experience
                    
                    //self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
                    
                    
                }catch let err {
                    print("Err", err)
                }
                
            case .failure(let error):
                print( error)
            }
        }*/
    }
}

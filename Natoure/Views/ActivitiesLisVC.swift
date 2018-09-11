//
//  ActivitiesLisVC.swift
//  playaround
//
//  Created by Marco Martínez on 28/06/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import AVFoundation
import UIKit

class ActivitiesLisVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var experiencesListTable: UITableView!
    
    var videos:[AVPlayer] = []
    
    var locations:[LocationResume] = []
    
    var destinationVC: DestinationsVC? = nil
    
    override func viewDidLoad() {
        experiencesListTable.delegate = self
        experiencesListTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell", for: indexPath) as! ListCell
        
        if locations[indexPath.row].preview != nil{
            if locations[indexPath.row].preview!.type == "IMG"{
                let imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.container.frame.width, height: cell.container.frame.height))
                imageBG.downloadedFrom(link: locations[indexPath.row].preview!.url)
                imageBG.contentMode = .center
                imageBG.layer.masksToBounds = true
                cell.container.addSubview(imageBG)
            }else{
                
                let avPlayer = AVPlayer(url: URL(string: locations[indexPath.row].preview!.url)!)
                let avPlayerLayer = AVPlayerLayer(player: avPlayer)
                avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                avPlayer.volume = 0
                avPlayer.actionAtItemEnd = .none
                
                avPlayerLayer.frame = cell.container.layer.bounds
                videos.append(avPlayer)
                cell.container.layer.addSublayer(avPlayerLayer)
                
                avPlayer.play()
                
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(playerItemDidReachEnd(notification:)),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: avPlayer.currentItem)
                
            }
        }/*else if locations[indexPath.row].video != nil {
            if locations[indexPath.row].video!.type == "IMG"{
                let imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.container.frame.width, height: cell.container.frame.height))
                imageBG.downloadedFrom(link: locations[indexPath.row].video!.url)
                imageBG.contentMode = .center
                imageBG.layer.masksToBounds = true
                cell.container.addSubview(imageBG)
            }else{
                
                let avPlayer = AVPlayer(url: URL(string: locations[indexPath.row].video!.url)!)
                let avPlayerLayer = AVPlayerLayer(player: avPlayer)
                avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                avPlayer.volume = 0
                avPlayer.actionAtItemEnd = .none
                
                avPlayerLayer.frame = cell.container.layer.bounds
                videos.append(avPlayer)
                cell.container.layer.addSublayer(avPlayerLayer)
                
                avPlayer.play()
                
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(playerItemDidReachEnd(notification:)),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: avPlayer.currentItem)
                
            }
        }else{
            
        }*/
        
        if locations[indexPath.row].ecoRating != nil{
            cell.ecoRatingContainer.userRate = Float(locations[indexPath.row].ecoRating!)!
            cell.ecoRatingLabel.text = "(\(locations[indexPath.row].ecoRatingCount!))"
            
        }else{
            cell.ecoRatingLabel.isHidden = true
        }
        
        if locations[indexPath.row].rating != nil {
            cell.ratingContainer.userRate = Float(locations[indexPath.row].rating!)!
        }
        cell.title.text = locations[indexPath.row].name
        cell.stateLabel.text = locations[indexPath.row].state
        
        if locations[indexPath.row].hostName != nil{
            cell.subtitle.text = locations[indexPath.row].hostName
        }
        
        cell.experienceType.text = locations[indexPath.row].tourismTypes
        
        switch locations[indexPath.row].tourismTypes {
        case "RURAL"?:
            cell.experienceTypeColorBar.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
        case "ADVENTURE"?:
            cell.experienceTypeColorBar.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
        case "NATURE"?:
            cell.experienceTypeColorBar.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            
        case "CULTURAL"?:
            cell.experienceTypeColorBar.backgroundColor = UIColor(red: 228/255, green: 92/255, blue: 37/255, alpha: 1.00)
        default:
            cell.experienceTypeContainer.isHidden = true
        }
        
       
        /*if(currentList == "host"){
         cell = hostCell(cell: cell, index: indexPath.row)
         }*/
        
        
        //cell.layer.insertSublayer(avPlayerLayer, at: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "ExperienceDetailSegue", sender: nil)
        if destinationVC != nil{
            destinationVC?.getDestinationData(id: locations[indexPath.row].id!)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
   
    
    func getImage(_ url_str:String, _ imageView:UIImageView){
        print(url_str)
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler:{
            (data, response, error) in
            if(data != nil){
                let image = UIImage(data: data!)
                if(image != nil){
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
                    })
                }
            }
        })
        task.resume()
    }
    
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil )
    }
    
}

class ListCell:UITableViewCell{
    //@IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var ecoRatingContainer: RatingControl!
    
    
    @IBOutlet weak var ecoRatingLabel: UILabel!
    
    @IBOutlet weak var ratingContainer: RatingControl!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var experienceTypeContainer: UIView!
    
    @IBOutlet weak var experienceTypeColorBar: UIView!
    @IBOutlet weak var experienceType: UILabel!
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}

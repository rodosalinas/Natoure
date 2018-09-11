//
//  DestinationsVC.swift
//  playaround
//
//  Created by Marco Martínez on 28/06/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

enum activityType:String{
    case ADVENTURE
    case RURAL
    case NATURE
    case CULTURAL
    case none
}

class DestinationsVC:UIViewController{
    
    
    @IBOutlet weak var containerConstrait: NSLayoutConstraint!
    
    var locations:[LocationResume] = []
    var locationsFlag:[LocationResume] = []
    //var preloaderAlert:LoaderVC!
    
    var isMapShowed = true
    
    var activityTypeSelected = activityType.none
    
    
    var list :ActivitiesLisVC!
    var map  :MapListVC!
    
    var type = "ExperienceList"
    var path = "experience"
    
    var experience:Experience? = nil
    var host:Host? = nil
    var aic:AIC? = nil
    
    @IBOutlet weak var switchButton: UIButton!
    
    @IBOutlet weak var locationsContainer: UIView!
    
    @IBOutlet weak var culturalBtn: UIButton!
    @IBOutlet weak var natureBtn: UIButton!
    @IBOutlet weak var ruralBtn: UIButton!
    @IBOutlet weak var adventureBtn: UIButton!
    
    
    @IBAction func switchMAp(_ sender: Any) {
        if isMapShowed{
            
            if let image = UIImage(named: "conserva_pin_boton.png") {
                switchButton.setImage(image, for: .normal)
            }
            
            isMapShowed = false
            self.locationsContainer.addSubview(self.list.view)
            map.removeFromParentViewController()
        }else{
            
            if let image = UIImage(named: "tarjetas_icono.png") {
                switchButton.setImage(image, for: .normal)
            }
            
            isMapShowed = true
            self.locationsContainer.addSubview(self.map.view)
            list.removeFromParentViewController()
        }
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func filterRural(_ sender: Any) {
        if activityTypeSelected != .RURAL{
            activityTypeSelected = .RURAL
            locationsFlag.removeAll()
            for location in locations{
                if location.tourismTypes == "RURAL" {
                    locationsFlag.append(location)
                }
            }
            
            map.locations = locationsFlag
            map.reloadMap()
            //map.viewDidLoad()
            list.locations = locationsFlag
            list.experiencesListTable.reloadData()
            
            ruralBtn.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 0
            
            culturalBtn.backgroundColor = UIColor.lightGray
            culturalBtn.borderColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 2
            
            adventureBtn.backgroundColor = UIColor.lightGray
            adventureBtn.borderColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 2
            
            natureBtn.backgroundColor = UIColor.lightGray
            natureBtn.borderColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 2
            
            
        }else{
            activityTypeSelected = .none
            locationsFlag.removeAll()
            map.locations = locations
            map.reloadMap()
            list.locations = locations
            list.experiencesListTable.reloadData()
            
            
            culturalBtn.backgroundColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 0
            
            adventureBtn.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 0
            
            natureBtn.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 0
        }
        
    }
    
    @IBAction func filterCultural(_ sender: Any) {
        if activityTypeSelected != .CULTURAL{
            activityTypeSelected = .CULTURAL
            locationsFlag.removeAll()
            for location in locations{
                if location.tourismTypes == "CULTURAL" {
                    locationsFlag.append(location)
                }
            }
            map.locations = locationsFlag
            map.reloadMap()
            //map.viewDidLoad()
            list.locations = locationsFlag
            list.experiencesListTable.reloadData()
            
            culturalBtn.backgroundColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 0
            
            
            ruralBtn.backgroundColor = UIColor.lightGray
            ruralBtn.borderColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 2
            
            adventureBtn.backgroundColor = UIColor.lightGray
            adventureBtn.borderColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 2
            
            natureBtn.backgroundColor = UIColor.lightGray
            natureBtn.borderColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 2
            
            
        }else{
            activityTypeSelected = .none
            locationsFlag.removeAll()
            map.locations = locations
            map.reloadMap()
            list.locations = locations
            list.experiencesListTable.reloadData()
            
            
            ruralBtn.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 0
            
            adventureBtn.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 0
            
            natureBtn.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 0
        }
        
    }
    
    @IBAction func filterNature(_ sender: Any) {
        if activityTypeSelected != .NATURE{
            activityTypeSelected = .NATURE
            
            locationsFlag.removeAll()
            for location in locations{
                if location.tourismTypes == "NATURE" {
                    locationsFlag.append(location)
                }
            }
            map.locations = locationsFlag
            map.reloadMap()
            //map.viewDidLoad()
            list.locations = locationsFlag
            list.experiencesListTable.reloadData()
            
            natureBtn.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 0
            
            culturalBtn.backgroundColor = UIColor.lightGray
            culturalBtn.borderColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 2
            
            ruralBtn.backgroundColor = UIColor.lightGray
            ruralBtn.borderColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 2
            
            
            adventureBtn.backgroundColor = UIColor.lightGray
            adventureBtn.borderColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 2
            
            
        }else{
            activityTypeSelected = .none
            locationsFlag.removeAll()
            map.locations = locations
            map.reloadMap()
            list.locations = locations
            list.experiencesListTable.reloadData()
            
            
            culturalBtn.backgroundColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 0
            
            ruralBtn.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 0
            
            adventureBtn.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 0
            
        }
        
    }
    
    @IBAction func filterAdventure(_ sender: Any) {
        if activityTypeSelected != .ADVENTURE{
            activityTypeSelected = .ADVENTURE
            
            locationsFlag.removeAll()
            for location in locations{
                if location.tourismTypes == "ADVENTURE" {
                    locationsFlag.append(location)
                }
            }
            
            
            adventureBtn.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.82, alpha: 1.00)
            adventureBtn.borderWidth = 0
            
            map.locations = locationsFlag
            map.reloadMap()
            //map.viewDidLoad()
            list.locations = locationsFlag
            list.experiencesListTable.reloadData()
            
            culturalBtn.backgroundColor = UIColor.lightGray
            culturalBtn.borderColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 2
            
            ruralBtn.backgroundColor = UIColor.lightGray
            ruralBtn.borderColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 2
            
            
            natureBtn.backgroundColor = UIColor.lightGray
            natureBtn.borderColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 2
            
            
        }else{
            activityTypeSelected = .none
            locationsFlag.removeAll()
            map.locations = locations
            map.reloadMap()
            list.locations = locations
            list.experiencesListTable.reloadData()
            
            
            culturalBtn.backgroundColor = UIColor(red: 0.87, green: 0.36, blue: 0.23, alpha: 1.00)
            culturalBtn.borderWidth = 0
            
            ruralBtn.backgroundColor = UIColor(red: 0.78, green: 0.73, blue: 0.27, alpha: 1.00)
            ruralBtn.borderWidth = 0
            
            natureBtn.backgroundColor = UIColor(red: 0.25, green: 0.62, blue: 0.29, alpha: 1.00)
            natureBtn.borderWidth = 0
        }
        
    }
    
    override func viewDidLoad() {
        let param = ["created": true]
        
        //preloaderAlert = self.storyboard?.instantiateViewController(withIdentifier: "PreLoader") as! LoaderVC
        
        if path == "aic" {
            culturalBtn.isHidden = true
            natureBtn.isHidden = true
            ruralBtn.isHidden = true
            adventureBtn.isHidden = true
            containerConstrait.constant = 60
            locationsContainer.layoutIfNeeded()
        }
        
        let url = "https://natoure.org/api/\(path)/list"
        
        Alamofire.request(url, method:.post, parameters: param).validate().responseJSON { response in
            //self.preloaderAlert.dismissMe()
            switch response.result{
            case .success(let data):
                
                //self.preloaderAlert.dismissMe()
                let jsonExperiences = JSON(data)
                var index = 0
                
                print("hey dude")
                print(jsonExperiences)
                
                for _ in jsonExperiences[self.type] {
                    
                    do {
                        let algo = try jsonExperiences[self.type][index].rawData()
                        let decoder = JSONDecoder()
                        let location = try decoder.decode(LocationResume.self, from: algo)
                        
                        
                        self.locations.append(location)
                        
                    }catch let err {
                        print("Err", err)
                    }
                    index += 1
                }
                
                print(self.locations.count)
                
                self.map = MapListVC()
                self.list = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListExperiences") as! ActivitiesLisVC
                
                self.list.destinationVC = self
                self.map.destinationVC = self
                
                self.map.locations = self.locations
                self.list.locations = self.locations
                
                self.map.view.translatesAutoresizingMaskIntoConstraints = false
                
                self.map.view.frame = self.locationsContainer.bounds //Here
                self.list.view.frame = self.locationsContainer.bounds
                
                self.locationsContainer.addSubview(self.map.view)
                self.addChildViewController(self.map)
                
                
                
                self.map.didMove(toParentViewController: self)
                
                
                
            case .failure(let error):
                print( "error: \(error)")
                //self.preloaderAlert.dismissMe()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //openModal()
    }
    
    func openModal() {
        
        /*preloaderAlert.providesPresentationContextTransitionStyle = true
        preloaderAlert.definesPresentationContext = true
        preloaderAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        preloaderAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //customAlert.delegate = self
        self.present(preloaderAlert, animated: true, completion: nil)
        print("presenting")*/
        
    }
    
    func getDestinationData(id:Int){
        
        print("\(id)")
        
        var url:String { switch type{
            case "ExperienceList":
                return "https://natoure.org/api/experience?experienceID=\(id)&prices=true"
            case "HostList":
                return "https://natoure.org/api/host?hostID=\(id)&acknowledgment=true&galleries=true&experiences=true"
            case "AICList":
                return "https://natoure.org/api/aic?aicID=\(id)"
            default:
                return  "https://natoure.org/api/aic?aicID=3&prices=true"
            }
        }
        
        Alamofire.request(url, method:.get).validate().responseJSON { response in
            //self.preloaderAlert.dismissMe()
            switch response.result{
            case .success(let data):
                //print(data)
                
                switch self.type{
                case "ExperienceList":
                    //let experience:Experience
                    do{
                        let expJSON = JSON(data)
                        let decoder = JSONDecoder()
                        self.experience = try decoder.decode(Experience.self, from: expJSON["Experience"].rawData())
                        
                        
                        self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
                        
                    }catch let err {
                        print("Err", err)
                    }
                case "HostList":
                    //let experience:Experience
                    do{
                        let expJSON = JSON(data)
                        let decoder = JSONDecoder()
                        self.host = try decoder.decode(Host.self, from: expJSON["Host"].rawData())
                        
                        self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
                        print(data)
                    }catch let err {
                        print("Err", err)
                    }
                case "AICList":
                    //let experience:Experience
                    do{
                        let expJSON = JSON(data)
                        let decoder = JSONDecoder()
                        self.aic = try decoder.decode(AIC.self, from: expJSON["AIC"].rawData())
                        
                        self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
                    }catch let err {
                        print("Err", err)
                    }
                default:
                    break
                }
            case .failure(let error):
                break
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowDetailSegue") {
            /*let placeController = segue.destination as! PlacesContainerVC
            
            switch self.type{
            case "ExperienceList":
                placeController.experience = self.experience
            case "HostList":
                placeController.host = self.host
            case "AICList":
                placeController.aic = self.aic
                
            default:
                break
            }*/
            
            
            //let duration = sender as Double
            //listViewController.currentList = self.currentList
        }
    }
    
    
    //https://stackoverflow.com/questions/27103278/creating-a-uitableviewcell-programmatically-in-swift
}

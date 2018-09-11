//
//  AICVC.swift
//  playaround
//
//  Created by Marco Martínez on 16/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import Alamofire
import UIKit

/*
class AICVC:UIViewController{
    
    var aic:AIC? = nil
    let url = "https://natoure.org/api/aic?aicID=1&acknowledgment=true&galleries=true&projects=true&species=true"
    
    @IBOutlet weak var abrev: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var adminName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minAlt: UILabel!
    @IBOutlet weak var maxAlt: UILabel!
    @IBOutlet weak var majorEcoSystems: UILabel!
    @IBOutlet weak var communities: UILabel!
    
    @IBOutlet weak var scrollView:UIScrollView!
    
    @IBOutlet weak var priorityProjectLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var feeLabel: UILabel!
    
    
    override func viewDidLoad() {
        if aic != nil {
            name.text = aic?.name
            abrev.text = aic?.acronim
            adminName.text = aic?.adminName
            cityName.text = "\(self.aic!.country) / \(self.aic!.state)"
            
            majorEcoSystems.text = aic?.majorEcosystem
            communities.text = aic?.communities
            
            //print(aic!.id)
            if aic!.tempMin != nil{
                minTemp.text = String(aic!.tempMin!)
            }
            if aic!.tempMax != nil{
                maxTemp.text = String(aic!.tempMax!)
            }
            if aic!.altitudeMin != nil{
                minAlt.text = String(aic!.altitudeMin!)
            }
            if aic!.altitudeMax != nil{
                maxAlt.text = String(aic!.altitudeMax!)
            }
            
            if aic!.priorityProject != nil{
                priorityProjectLabel.text = aic!.priorityProject![0].achievements
            }else{
                priorityProjectLabel.isHidden = true
            }
            
            rulesLabel.text = aic!.rules
            
            feeLabel.text = "Costo $\(aic!.fee) MXN"
        }
        
    }
}*/

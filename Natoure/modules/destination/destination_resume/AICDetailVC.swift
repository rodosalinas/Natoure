//
//  AICVC.swift
//  Natoure
//
//  Created by Marco Martínez on 11/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

class AICDetailVC: UIViewController {
    var aic:AIC? = nil
    var parentVC:DestinationChildToParentProtocol!
    
    
    
    @IBOutlet weak var aicLogo: UIImageView!
    @IBOutlet weak var acronim: UILabel!
    @IBOutlet weak var aicName: UILabel!
    @IBOutlet weak var aicType: UILabel!
    
    override func viewDidLoad() {
        aicLogo.downloadedFrom(link: (aic!.logo?.url)!)
        acronim.text = aic!.acronim
        aicName.text = aic!.name
        aicType.text = aic!.aicType
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        parentVC.backPressed()
    }
    
}

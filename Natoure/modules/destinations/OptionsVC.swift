//
//  OptionsVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class OptionsVC: UIViewController {
    
    var presenter: OptionsViewToPresenterProtocol?
    var map :DestinationsMapVC?
    
    @IBOutlet weak var culturalBtn: UIButton!
    @IBOutlet weak var ruralBtn: UIButton!
    @IBOutlet weak var naturalBtn: UIButton!
    @IBOutlet weak var adventureBtn: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var mapTopConstraint: NSLayoutConstraint!
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
        
        culturalBtn.tag = 0
        culturalBtn.addTarget(self, action: #selector(filterView(sender: )), for: .touchDown)
        ruralBtn.tag = 1
        ruralBtn.addTarget(self, action: #selector(filterView(sender: )), for: .touchDown)
        naturalBtn.tag = 2
        naturalBtn.addTarget(self, action: #selector(filterView(sender: )), for: .touchDown)
        adventureBtn.tag = 3
        adventureBtn.addTarget(self, action: #selector(filterView(sender: )), for: .touchDown)
        
        self.map =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DestinationsMapVC") as? DestinationsMapVC
        
        
        
        self.map?.view.frame = CGRect(x: 0, y: 0, width: viewContainer.frame.width, height: viewContainer.frame.height)
        
        map?.mainVC = self
        
        
        
        viewContainer.addSubview(self.map!.view)
        
    }
    
    
    @objc func filterView(sender: UIButton) {
        //print(sender.tag)
    }
    
    
    
    @IBAction func backToMenu(_ sender: Any) {
        
    }
    
    @IBAction func changeView(_ sender: Any) {
        
    }
    
}

extension OptionsVC:OptionsPresenterToViewProtocol{
    
    func showAICPoints(_ aicList: [AICResume]) {
        
        mapTopConstraint.constant = 60
        
        culturalBtn.isHidden = true
        ruralBtn.isHidden = true
        naturalBtn.isHidden = true
        adventureBtn.isHidden = true
        
        self.view.layoutIfNeeded()
        
        /*viewContainer.frame = CGRect(x: 0, y: viewContainer.frame.origin.y, width: viewContainer.frame.width, height: viewContainer.frame.height)*/
        
        (map as! DestinationsParentToMapProtocol).setMapAICPoints(aicList)
    }
    
    
}

extension OptionsVC: DestinationsMapToParentProtocol{
    func itemClicked(id:Int){
        presenter?.optionClicked(id: id)
    }
}


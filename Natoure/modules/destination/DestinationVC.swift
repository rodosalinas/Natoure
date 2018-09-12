//
//  DestinationVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

class DestinationVC: UIViewController {
    var presenter:DestinationViewToPresenterProtocol?
    var type:DestinationType?
    
    var destinations:[UIViewController] = []
    
    override func viewDidLoad() {
        presenter?.updateView()
    }
    
    
}

extension DestinationVC:DestinationPresenterToViewProtocol{
    func presentAIC(_ aic: AIC) {
        let aicVC = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "AICDetail") as? AICVC
        self.view.addSubview((aicVC?.view)!)
        //var aicVC = AICDetail
        //print(aic)
    }
    
    
}

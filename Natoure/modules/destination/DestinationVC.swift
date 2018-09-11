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
    
    override func viewDidLoad() {
        presenter?.updateView()
    }
    
    
}

extension DestinationVC:DestinationPresenterToViewProtocol{
    func presentAIC(_ aic: AIC) {
        
    }
    
    
}

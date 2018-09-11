//
//  OnboardingVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

class OnboardingVC: UIViewController {
    
    lazy var subViews:[UIViewController] = {
        return[
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide01") ,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide02") ,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide03")
        ]
    }()
    
    override func viewDidLoad() {
        
    }
    
}

extension OnboardingVC{
}

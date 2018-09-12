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
        let aicVC = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "AICDetailVC") as? AICDetailVC
        aicVC!.aic = aic
        aicVC!.parentVC = self
        destinations.append(aicVC!)
        
        self.view.addSubview(destinations[destinations.count - 1].view!)
        //var aicVC = AICDetail
        //print(aic)
    }
    
    
}

extension DestinationVC:DestinationChildToParentProtocol{
    func backPressed() {
        if destinations.count == 1{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

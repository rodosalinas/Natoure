//
//  MenuVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 09/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    var presenter:MenuViewToPresenterProtocol!
    
    @IBOutlet weak var exploraButton:UIButton!
    @IBOutlet weak var conectateButton:UIButton!
    @IBOutlet weak var conservaButton:UIButton!
    
    override func viewDidLoad() {
        exploraButton.tag = 0
        exploraButton.addTarget(self, action: #selector(optionButtonClicked(sender: )), for: .touchDown)
        
        conectateButton.tag = 1
        conectateButton.addTarget(self, action: #selector(optionButtonClicked(sender: )), for: .touchDown)
        
        conservaButton.tag = 2
        conservaButton.addTarget(self, action: #selector(optionButtonClicked(sender: )), for: .touchDown)
        
    }
    
    @objc func optionButtonClicked(sender: UIButton)  {
        presenter.optionSelected(id: sender.tag)
    }
    
}

extension MenuVC: MenuPresenterToViewProtocol{
    
}

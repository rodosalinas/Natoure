//
//  SignVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import AVFoundation
import UIKit

class SignVC: UIViewController {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        
    }
}

extension SignVC: SignPresenterToViewProtocol{
    
}

extension SignVC: SignUpToParent{
    
}

extension SignVC: LoginToParent{
    
}

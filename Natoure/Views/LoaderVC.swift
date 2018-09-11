//
//  LoaderVC.swift
//  playaround
//
//  Created by Marco Martínez on 28/06/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import UIKit

class LoaderVC: UIViewController {
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var imageGifContainer: UIImageView!
    
    override func viewDidLoad() {
        imageGifContainer.loadGif(name: "loading")
    }
    
    func dismissMe(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
}

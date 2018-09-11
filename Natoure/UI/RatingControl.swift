//
//  RaterController.swift
//  natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 16/06/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

class RatingControl: UIControl {
    
    var images = [UIImageView]()
    
    @IBInspectable
    var positiveAsset:UIImage?
    @IBInspectable
    var emptyAsset:UIImage?
    @IBInspectable
    var halfAsset:UIImage?
    
    @IBInspectable
    var userRate : Float = 0
    
    var rate : Float = 0/*{
        didSet{
            updateView()
        }
    }*/
    
    func updateView(){
        let width = self.frame.width / 6
        images.removeAll()
        subviews.forEach{ $0.removeFromSuperview() }
        
        
        if userRate > 5{
            rate = 5
        }else if userRate < 0{
            rate = 0
        }else{
            rate = userRate
        }
        
        for i in 0..<5{
            
            let imageView = UIImageView(frame : CGRect(x: (width / 6) + (width * CGFloat(i)) + ((width / 6) * CGFloat(i))  , y: self.frame.height / 2 - width / 2, width: width, height:  width))
            
            if rate > Float(i) && rate < Float(i + 1){
                imageView.image = halfAsset
            }else if rate < Float(i){
                imageView.image = emptyAsset
            }else{
                imageView.image = positiveAsset
            }
            
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            images.append(imageView)
            self.addSubview(images[i])
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }
}

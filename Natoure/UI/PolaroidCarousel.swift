//
//  PolaroidCarousel.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import UIKit

enum PolaroidCarouselTypes {
    case AICResume
    case LocationResume
    case Default
}

class PolaroidCarousel: UIControl {
    
    var cards:[Any] = []
    
    var current = 0
    
    var scrollBar:UIScrollView!
    var scrollWidth:CGFloat = 0
    
    private var type:PolaroidCarouselTypes!
    
    func updateView(){
        
        if cards.count > 0 {
            
            let cardWidth = self.frame.width * 0.35
            scrollBar = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            
            switch cards[0] {
            case is AICResume:
                type = .AICResume
            case is LocationResume:
                type = .LocationResume
            default:
                print("unknown type")
            }
            
            for(index, card) in cards.enumerated(){
                
                let position = 10 + (cardWidth * CGFloat(index)) + (10 * CGFloat(index))
                
                let viewContainer = UIView(frame: CGRect(x: position, y: 0, width: cardWidth, height: self.frame.height)  )
                viewContainer.layer.cornerRadius = 10
                viewContainer.layer.masksToBounds = true
                viewContainer.backgroundColor = UIColor.white
                
                let btn = UIButton(frame: self.bounds)
                
                switch type{
                case .AICResume:
                    
                    let aicCard = AICCard(frame: CGRect(x: 0, y: 0, width: viewContainer.frame.width, height: viewContainer.frame.height))
                    
                    aicCard.aic = (card as! AICResume)
                    aicCard.updateView()
                    aicCard.layer.masksToBounds = true
                    btn.tag = (cards[index] as! AICResume).id
                    viewContainer.addSubview(aicCard)
                    //print( (card as! AICResume).video!.type)
                default:
                    break
                }
                
                
                
                btn.addTarget(self, action: #selector(sendAction(button: )), for: .touchUpInside)
                
                btn.backgroundColor = UIColor.clear
                btn.layer.masksToBounds = true
                print(btn.tag)
                viewContainer.addSubview(btn)
                
                scrollBar.addSubview(viewContainer)
                
                scrollWidth +=  cardWidth + 10
            }
            
            
            
            scrollWidth += 10
            
            scrollBar.contentSize = CGSize(width: scrollWidth, height: self.frame.height)
            scrollBar.isScrollEnabled = true
            
            scrollBar.showsHorizontalScrollIndicator = false
            
            self.addSubview(scrollBar)
            
        }
        
        
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }
    
    @objc func sendAction(button:UIButton) {
        
        current = button.tag
        //print(button.tag)
        //print("clicked inside")
        sendActions(for: .valueChanged)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

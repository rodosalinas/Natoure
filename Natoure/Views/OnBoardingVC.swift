//
//  OnBoardingVC.swift
//  playaround
//
//  Created by Marco Martínez on 09/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    var parentVC:SignUserVC? = nil
    
    var currentView = 0
    
    var timer = Timer()
    
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var  pageIndicator:UIPageControl!
    
    @IBAction func showSignUpScreen(_ sender: Any) {
        if parentVC != nil{
            parentVC?.showSignUpScreen()
        }
    }
    
    @IBAction func showLoginScreen(_ sender: Any) {
        if parentVC != nil{
            parentVC?.showLoginScreen()
        }
    }
    
    lazy var subViews:[UIViewController] = {
        return[
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide01") ,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide02") ,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Slide03")
        ]
    }()
    
    
    
    override func viewDidLoad() {
        for index in 0..<subViews.count {
            subViews[index].view.frame.origin.x = self.view.frame.size.width * CGFloat(index)
            subViews[index].view.frame.size = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height )
            self.scrollView.addSubview(subViews[index].view)
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(subViews.count), height: scrollView.frame.size.height )
        
        scrollView.isScrollEnabled = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {_ in
            self.scrollOnBorading()
        })
        
    }
    
    
    
    func scrollOnBorading(){
        
        if currentView < subViews.count - 1{
            currentView += 1
        }else{
            currentView = 0
        }
        
        pageIndicator.currentPage = currentView
        let point = CGPoint(x: CGFloat(currentView) * self.scrollView.bounds.width, y: 0)
        self.scrollView.scrollTo(direction: point, animated: true)
    }
}

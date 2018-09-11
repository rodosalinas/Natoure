//
//  OptionsRouter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//


import Foundation
import UIKit




class OptionsRouter: OptionsPresenterToRouterProtocol{
    
    
    
    var type: DestinationType?
    
    
    class func createModule(_ type: DestinationType?) ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "OptionsVC") as? OptionsVC
        
        let presenter: OptionsViewToPresenterProtocol & OptionsInterectorToPresenterProtocol = OptionsPresenter()
        let interactor: OptionsPresentorToInterectorProtocol = OptionsInterector()
        let router: OptionsPresenterToRouterProtocol = OptionsRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        interactor.type = type != nil ? type : .aic
        
        
        
        return view!;
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func showDestination(_ type: DestinationType?, destinationId: Int) {
        /*print("Cachin")
        print(destinationId)
        print(type)*/
        let destinationVC = DestinationRouter.createModule(type: type, id: destinationId)
        OptionsRouter.topController.present(destinationVC, animated: true, completion: nil)
    }
    
    static var topController:UIViewController{
        return (UIApplication.shared.keyWindow?.rootViewController?.presentedViewController)!
    }
}

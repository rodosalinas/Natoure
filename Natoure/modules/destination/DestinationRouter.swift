//
//  DestinationRouter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//



import Foundation
import UIKit




class DestinationRouter: DestinationPresenterToRouterProtocol{
    
    
    
    //var type: DestinationType?
    
    
    class func createModule(type: DestinationType?, id:Int) ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "DestinationVC") as? DestinationVC
        
        let presenter: DestinationViewToPresenterProtocol & DestinationInteractorToPresenterProtocol = DestinationPresenter()
        let interactor: DestinationPresenterToInteractorProtocol = DestinationInteractor()
        let router: DestinationPresenterToRouterProtocol = DestinationRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        //interactor.type = type != nil ? type : .aic
        
        
        
        return view!;
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
        
    }
}

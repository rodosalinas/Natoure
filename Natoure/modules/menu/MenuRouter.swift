//
//  MenuRouter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 09/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//


import Foundation
import UIKit

class MenuRouter: MenuPresenterToRouterProtocol{
    
    //var type: DetinationType?
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC
        
        let presenter: MenuViewToPresenterProtocol & MenuInteractorToPresenterProtocol = MenuPresenter()
        let interactor: MenuPresentorToInteractorProtocol = MenuInteractor()
        let router: MenuPresenterToRouterProtocol = MenuRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view!;
        
    }
    
    func showSelectionList(_ type: DestinationType) {
        /*let optionsRouter = OptionsRouter()
        
        optionsRouter.type = type*/
        
        let optionsVC = OptionsRouter.createModule(type)
        /*if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            UIPresentationController(optionsVC, animated: true, completion: nil)
        }*/
        //optionsVC.show(optionsVC, sender: nil)
        AppDelegate().rootVC?.present(optionsVC, animated: true, completion: nil)
        //UIApplication.shared.keyWindow?.rootViewController?.present(optionsVC, animated: true, completion: nil)
        //UIViewController().present(optionsVC, animated: true, completion: nil)
        
        //present(optionsVC, animated: true)
        
        //UIPresentationController.present
        
         //mainstoryboard.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC
        
        
        
        
        /*window = UIWindow(frame: UIScreen.main.bounds);
        window?.rootViewController = optionsVC
        window?.makeKeyAndVisible()*/
        
        /*
         let menuVC = MenuRouter.createModule()
         
         
         window = UIWindow(frame: UIScreen.main.bounds);
         window?.rootViewController = menuVC
         window?.makeKeyAndVisible()
         */
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}


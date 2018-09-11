//
//  MenuPresenter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 09/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

class MenuPresenter: MenuViewToPresenterProtocol {
    var view: MenuPresenterToViewProtocol?
    var interactor: MenuPresentorToInteractorProtocol?
    var router: MenuPresenterToRouterProtocol?
    
    func updateView() {
        
    }
    
}

extension MenuPresenter: MenuInteractorToPresenterProtocol{
    
    func optionSelected(id: Int) {
        var type : DestinationType {
            switch id {
            case 0:
                return .experience
            case 1:
                return .host
            case 2:
                return .aic
            default:
                return .aic
            }
        }
        
        //view
        
        router?.showSelectionList(type)
    }
}

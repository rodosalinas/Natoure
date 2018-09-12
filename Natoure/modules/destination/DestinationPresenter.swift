//
//  DestinationPresenter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

class DestinationPresenter: DestinationViewToPresenterProtocol {
    var view: DestinationPresenterToViewProtocol?
    
    var interactor: DestinationPresenterToInteractorProtocol?
    
    var router: DestinationPresenterToRouterProtocol?
    
    var type: DestinationType?
    
    func updateView() {
        
        switch type! {
        case .aic:
            interactor?.fetchAIC()
        default:
            break
        }
    }
    
    
}

extension DestinationPresenter: DestinationInteractorToPresenterProtocol{
    func aicFetched(_ aic: AIC) {
        view?.presentAIC(aic)
    }
    
    
}

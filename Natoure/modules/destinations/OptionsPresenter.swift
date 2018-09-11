//
//  OptionsPresenter.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

class OptionsPresenter: OptionsViewToPresenterProtocol{
    var view: OptionsPresenterToViewProtocol?;
    var interector: OptionsPresentorToInterectorProtocol?;
    var router: OptionsPresenterToRouterProtocol?
    var type:DestinationType?
    
    func updateView() {
        interector?.fetchAICList()
    }
    
    func optionClicked(id: Int) {
        router?.showDestination(type, destinationId: id)
    }
}

extension OptionsPresenter: OptionsInterectorToPresenterProtocol{
    func aicListFetched(_ aicList:[AICResume]){
        view!.showAICPoints(aicList)
        type = .aic
    }
}

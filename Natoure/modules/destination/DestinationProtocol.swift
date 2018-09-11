//
//  DestinationProtocol.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

protocol DestinationPresenterToViewProtocol: class {
    //func showAICPoints(_ aicList: [AICResume])
    func presentAIC(_ aic:AIC)
}

protocol DestinationInteractorToPresenterProtocol: class {
    //func aicListFetched(_ aicList:[AICResume])
    func aicFetched(_ aic:[AIC])
    
}

protocol DestinationPresenterToInteractorProtocol: class {
    var presenter: DestinationInteractorToPresenterProtocol? {get set}
    func fetchAIC(id:Int)
}

protocol DestinationViewToPresenterProtocol: class {
    var view: DestinationPresenterToViewProtocol? {get set}
    var interactor: DestinationPresenterToInteractorProtocol? {get set}
    var router: DestinationPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol DestinationPresenterToRouterProtocol: class {
    static func createModule(type:DestinationType?, id:Int) -> UIViewController
}

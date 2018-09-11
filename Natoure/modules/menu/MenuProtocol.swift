//
//  MenuProtocol.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 09/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit



protocol MenuPresenterToViewProtocol: class {
    //func showAICPoints(_ aicList: [AICResume])
}

protocol MenuInteractorToPresenterProtocol: class {
    //func aicListFetched(_ aicList:[AICResume])
    
}

protocol MenuPresentorToInteractorProtocol: class {
    var presenter: MenuInteractorToPresenterProtocol? {get set}
}

protocol MenuViewToPresenterProtocol: class {
    var view: MenuPresenterToViewProtocol? {get set}
    var interactor: MenuPresentorToInteractorProtocol? {get set}
    var router: MenuPresenterToRouterProtocol? {get set}
    func updateView()
    func optionSelected(id:Int)
    //func updateView();
}

protocol MenuPresenterToRouterProtocol: class {
    //var type:DetinationType? {get set}
    static func createModule() -> UIViewController;
    func showSelectionList(_ type: DestinationType)
}



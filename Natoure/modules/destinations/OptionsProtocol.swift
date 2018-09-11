//
//  OptionsProtocol.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

public enum DestinationType {
    case experience
    case host
    case aic
}

protocol OptionsPresenterToViewProtocol: class {
    func showAICPoints(_ aicList: [AICResume])
   // func showNews(news: LiveNewsModel);
   //func showError();
    //func showList()
}

protocol OptionsInterectorToPresenterProtocol: class {
    func aicListFetched(_ aicList:[AICResume])
    //func liveNewsFetched(news: LiveNewsModel);
    //func liveNewsFetchedFailed();
}

protocol OptionsPresentorToInterectorProtocol: class {
    var presenter: OptionsInterectorToPresenterProtocol? {get set} ;
    var type:DestinationType? {get set}
    func fetchAICList()
    //func fetchLiveNews();
}

protocol OptionsViewToPresenterProtocol: class {
    var view: OptionsPresenterToViewProtocol? {get set}
    var interector: OptionsPresentorToInterectorProtocol? {get set}
    var router: OptionsPresenterToRouterProtocol? {get set}
    func updateView()
    func optionClicked(id:Int)
}

protocol OptionsPresenterToRouterProtocol: class {
    var type:DestinationType? {get set}
    static func createModule(_ type: DestinationType?) -> UIViewController;
    func showDestination(_ type: DestinationType?, destinationId:Int)
}

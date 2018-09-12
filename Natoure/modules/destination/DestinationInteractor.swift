//
//  DestinationInteractor.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 10/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

class DestinationInteractor:DestinationPresenterToInteractorProtocol{
    var presenter: DestinationInteractorToPresenterProtocol?
    let networker = NetworkManager()
    var id: Int?
    
    func fetchAIC() {
        networker.getAIC(id: id!){ result, error in
            if error != nil{
                
            }else{
                print(result)
                self.presenter?.aicFetched((result?.AIC)!)
            }
        }
    }
}



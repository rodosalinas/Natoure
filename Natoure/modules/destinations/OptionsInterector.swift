//
//  OptionsInterector.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation


class OptionsInterector : OptionsPresentorToInterectorProtocol{
    
    
    
    var presenter: OptionsInterectorToPresenterProtocol?
    var type: DestinationType?
    
    let networker = NetworkManager()
    
    //var type:DetinationType!
    
    func fetchAICList(){
        switch type! {
        case .aic:
            networker.getAICList(){ result, error in
                if error != nil{
                    /*print("******")
                     print("OptionsInterector")
                     print("******")
                     self.presenter?.aicListFetched(result!.AICList)*/
                }else{
                    self.presenter?.aicListFetched(result!.AICList)
                }
                
            }
        default:
            print("ups")
        }
        
    }
    
}

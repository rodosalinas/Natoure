//
//  NetworkManager.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//


import Foundation

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    
    let router = Router<NatoureAPI>()
    
    func getAICList(completion: @escaping (_ destinations: AICList?,_ error: String?)->()){
        router.request(.aicList) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: data!)
                let destinations = try jsonDecoder.decode( AICList.self, from: jsonData)
                
                completion(destinations,  error as! String?)
                
            }catch {
                print("Error deserializing JSON: \(error)")
                completion(nil, "Error deserializing JSON \(error)")
            }
        }
        
    }
    
    func getAIC(id:Int, completion: @escaping (_ responseData: AICData?,_ error: String?)->()){
        router.request(.aic(id: id)) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: data!)
                let responseData = try jsonDecoder.decode( AICData.self, from: jsonData)
                
                completion(responseData,  error as! String?)
                
            }catch {
                print("Error deserializing JSON: \(error)")
                completion(nil, "Error deserializing JSON \(error)")
            }
        }
    }
    
}

//
//  Router.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//


import Foundation
import Alamofire

public typealias NetworkRouterCompletion = (_ data: [String : Any]?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    
    
    internal func cancel() {
        
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        print(route.baseURL.appending(route.path))
        Alamofire.request(route.baseURL.appending(route.path), method: route.method, parameters: route.params, encoding: JSONEncoding.default, headers: route.headers).validate().responseJSON{ response in
            
            if let result = response.result.value as? [String : Any]{
                completion(result, response.response, response.error)
            }else{
                completion(nil, response.response, response.error)
            }
            
            
        }
    }

}

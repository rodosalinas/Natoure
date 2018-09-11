//
//  NatoureApi.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 21/08/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import Alamofire


public enum NatoureAPI{
    case login(user:String, password:String)
    case aicList
    case aic(id:Int)
}

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

extension NatoureAPI:EndPointType{
    
   
    
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://natoure.org/api/"
        case .qa: return "https://natoure.org/api/"
        case .staging: return "https://natoure.org/api/"
        }
    }
    
    var baseURL: String {
        guard URL(string: environmentBaseURL) != nil else { fatalError("baseURL could not be configured.")}
        return environmentBaseURL
    }
    //let url = "https://natoure.org/api/\(path)/list"
    var path: String {
        switch self {
        case .login:
            return ""
        case .aic(let id):
            return "aic?aicID=\(id)&acknowledgment=true&galleries=true&projects=true&species=true"
        case .aicList:
            return "aic/list?created=true"
        }
    }
    
    var fileDestination: String? {
        
        return ""
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .aicList:
            return .post
        default:
            return .get
        }
    }
    
    
    
    var headers: HTTPHeaders? {
        
        return nil
    }
    
    var params: [String : Any]? {
        return nil
    }
    
}

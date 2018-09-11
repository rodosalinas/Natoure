//
//  EndPointType.swift
//  playaround
//
//  Created by Marco Martínez on 28/06/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import Foundation
import Alamofire

public typealias HTTPHeaders = [String:String]


protocol EndPointType {
    var baseURL:String {get}
    var path:String{get}
    var method:HTTPMethod{get}
    var fileDestination:String?{get}
    var headers: HTTPHeaders? { get }
    var params: [String:Any]? {get}
}

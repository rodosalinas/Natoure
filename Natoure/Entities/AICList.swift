//
//  AICList.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

struct AICList: Codable {
    let AICList : [AICResume]
    
    private enum CodingKeys: String, CodingKey {
        case AICList
    }
}


struct AICResume: Codable{
    
    let id: Int
    let name : String
    let aicType : String
    let logo : Picture?
    let video : Picture?
    let preview : Picture?
    let countryID: Int
    let status : String
    let country : String
    let state : String
    let stateName : String
    let latitude : Double
    let longitude : Double
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case aicType
        case logo
        case video
        case preview
        case countryID
        case status
        case country
        case state
        case stateName
        case latitude
        case longitude
    }
    
    
}


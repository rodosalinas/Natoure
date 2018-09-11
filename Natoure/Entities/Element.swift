//
//  Element.swift
//  Natoure
//
//  Created by Marco Martínez on 04/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation

struct Element: Codable {
    let id: Int?
    let hostID: Int?
    let name:String
    let video:Picture?
    let preview:Picture?
    let hostName:String?
    let hostPicture:Picture?
    let aicName:String?
    let tourismTypes:String?
    let activities:String?
    let activitieCodes:String?
    let latitude:Double
    let longitude:Double
    let shapeInfo:String?
    let countryID: Int?
    let stateID: Int?
    let country:String?
    let state:String?
    let ecoRating:String?
    let ecoRatingCount: Int?
    let rating:String?
    let ratingCount:Int?
    let status:String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case hostID
        case name
        case video
        case preview
        case hostName
        case hostPicture
        case aicName
        case tourismTypes
        case activities
        case activitieCodes
        case latitude
        case longitude
        case shapeInfo
        case countryID
        case stateID
        case country
        case state
        case ecoRating
        case ecoRatingCount
        case rating
        case ratingCount
        case status
    }
    
}



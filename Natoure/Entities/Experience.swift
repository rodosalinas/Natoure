//
//  Experience.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 07/07/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

struct Experience: Codable {
    
    let id: Int
    let hostID: Int
    let name : String
    let video : String
    let preview : String?
    let resume : String
    let difficulty: Int
    let duration : String
    let ageMin: Int
    let ageMax: Int
    let groupCapacity: Int
    let address : String
    let workdays : String
    let nearCity : String?
    let includes : String
    let equipment : String
    let clothes : String
    let language : String
    let volunteer: Int
    let onetime: Int
    let kidsFriendly: Int
    let petFriendly: Int
    let sleepOver: Int
    let season : String
    let addicionalInfo : String
    let hostName : String
    let experienceTypeName : String
    let experienceType : String
    let tourismType : String
    let countryID: Int
    let stateID: Int
    let country : String
    let state : String
    let ecoRating : String
    let ecoRatingCount: Int
    let rating : String
    let ratingCount: Int
    let status : String
    let geography : Geography
    let prices : [Prices]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case hostID
        case name
        case video
        case preview
        case resume
        case difficulty
        case duration
        case ageMin
        case ageMax
        case groupCapacity
        case address
        case workdays
        case nearCity
        case includes
        case equipment
        case clothes
        case language
        case volunteer
        case onetime
        case kidsFriendly
        case petFriendly
        case sleepOver
        case season
        case addicionalInfo
        case hostName
        case experienceTypeName
        case experienceType
        case tourismType
        case countryID
        case stateID
        case country
        case state
        case ecoRating
        case ecoRatingCount
        case rating
        case ratingCount
        case status
        case geography
        case prices
    }
}

struct Prices: Codable {
    
    let id:Int
    let price:String
    let clientType:String
    let convertedPrice:String
    let currency:String
    let convertionCurrency:String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case price
        case clientType
        case convertedPrice
        case currency
        case convertionCurrency
    }
}

//
//  Host.swift
//  playaround
//
//  Created by Marco Martínez on 16/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//


struct Host: Codable {
    let id: Int
    let status : String
    let name : String
    let picture : Picture?
    let video : Picture?
    let preview : Picture?
    let about : String
    let description : String
    let aicName : String
    let aicLogo : Picture?
    let country : String
    let state : String
    let tourismTypes : String?
    let ecoRating : String
    let ecoRatingCount : Int
    let countryID: Int?
    let stateID : Int?
    //geography
    //"albums": []
    //"acknowledgments": []
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case aicName
        case aicLogo
        case picture
        case video
        case preview
        case about
        case description
        case tourismTypes
        case countryID
        case country
        case stateID
        case state
        case ecoRating
        case ecoRatingCount
        case status
    }
    
}

/*struct AICLogo{
    let id: Int
    let description : String
    let type : String
    let url : String
}*/




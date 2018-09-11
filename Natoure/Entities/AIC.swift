//
//  AIC.swift
//  playaround
//
//  Created by Marco Martínez on 16/07/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//


struct AICData: Codable {
    let AIC:AIC
    private enum CodingKeys: String, CodingKey {
        case AIC
    }
}

struct AIC: Codable {
    let id: Int
    let name : String
    let aicType : String
    let adminName : String
    let acronim : String
    let communities : String?
    let majorEcosystem : String
    let addressIndications : String
    let tempMin : Int?
    let tempMax : Int?
    let altitudeMin : Double?
    let altitudeMax : Double?
    let logo : Picture?
    let video : Picture?
    let preview : Picture?
    let fee : String
    let staffQuantity : String
    let capacity : String
    let rules : String?
    let status : String
    let createdAt : String?
    let updatedAt : String?
    let ecosystemServices : EcosystemServices
    let country : String
    let state : String
    let geography: GeographyResume
    let albums: [Album]
    let species:Species
    let priorityProject:[Project]?
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case aicType
        case adminName
        case acronim
        case communities
        case majorEcosystem
        case addressIndications
        case tempMin
        case tempMax
        case altitudeMin
        case altitudeMax
        case logo
        case video
        case preview
        case fee
        case staffQuantity
        case capacity
        case rules
        case status
        case createdAt
        case updatedAt
        case ecosystemServices
        case country
        case state
        case geography
        case albums
        case species
        case priorityProject
    }
}

struct EcosystemServices: Codable {
    let SUPPORT:Int
    let SUPPLY:Int
    let REGULATION:Int
    let CULTURAL:Int
    private enum CodingKeys: String, CodingKey {
        case SUPPORT
        case SUPPLY
        case REGULATION
        case CULTURAL
    }
}

struct GeographyResume: Codable {
    let latitude:Float
    let longitude:Float
    let shape:String?
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case shape
    }
}



struct Album: Codable {
    let id:Int
    let name:String
    let content:[AlbumItem]
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case content
    }
}

struct AlbumItem: Codable{
    
    let url:String
    let mime:String
    let name:String
    let status:String
    let type:String
    let id:Int
    
    private enum CodingKeys: String, CodingKey {
        case url
        case mime
        case name
        case status
        case type
        case id
    }
}

struct Species: Codable {
    let Flora:[Specie]
    let Fauna:[Specie]
    
    private enum CodingKeys: String, CodingKey {
        case Flora
        case Fauna
    }
}

struct Specie: Codable {
    let id: Int
    let name : String
    let scientificName : String
    let status : String
    let albums: [Album]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case scientificName
        case status
        case albums
    }
}

struct Project: Codable {
    
    let id: Int
    let name : String
    let aicID : Int
    let achievements : String
    let cover : String?
    let status : String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case aicID
        case achievements
        case cover
        case status
    }
}


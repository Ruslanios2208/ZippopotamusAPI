//
//  Zip.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

struct Zip: Decodable {
    let postCode: String
    let country: String
    let countryAbbreviation: String
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
        case postCode = "post code"
        case country = "country"
        case countryAbbreviation = "country abbreviation"
        case places = "places"
    }
}

struct Place: Decodable {
    let placeName: String
    let longitude: String
    let state: String
    let stateAbbreviation: String
    let latitude: String
    
    enum CodingKeys: String, CodingKey {
        case placeName = "place name"
        case longitude = "longitude"
        case state = "state"
        case stateAbbreviation = "state abbreviation"
        case latitude = "latitude"
    }
}

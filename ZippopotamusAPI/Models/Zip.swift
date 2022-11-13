//
//  Zip.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

struct Zip {
    let postCode: String
    let country: String
    let countryAbbreviation: String
    let places: [Place]
    
    init(zipData: [String: Any]) {
        postCode = zipData["post code"] as? String ?? ""
        country = zipData["country"] as? String ?? ""
        countryAbbreviation = zipData["country abbreviation"] as? String ?? ""
        places = Place.getPlaces(from: zipData["places"] as Any)
    }
    
    static func getZip(from value: Any) -> Zip {
        guard let zipData = value as? [String: Any] else { return Zip(zipData: [:]) }
        return Zip(zipData: zipData)
    }
}

struct Place {
    let placeName: String
    let longitude: String
    let state: String
    let stateAbbreviation: String
    let latitude: String
    
    var description: String {
        """
        Longitude: \(longitude)
        Latitude: \(latitude)
        State: \(state)
        State abbreviation: \(stateAbbreviation)
    """
    }
    
    init(placeData: [String: Any]) {
        placeName = placeData["place name"] as? String ?? ""
        longitude = placeData["longitude"] as? String ?? ""
        state = placeData["state"] as? String ?? ""
        stateAbbreviation = placeData["state abbreviation"] as? String ?? ""
        latitude = placeData["latitude"] as? String ?? ""
    }
    
    static func getPlaces(from value: Any) -> [Place] {
        guard let placesData = value as? [[String: Any]] else { return [] }
        return placesData.map { Place(placeData: $0) }
    }
}

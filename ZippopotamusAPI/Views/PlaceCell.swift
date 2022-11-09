//
//  PlaceCell.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

import UIKit

class PlaceCell: UITableViewCell {
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var stateAbbreviationLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    
    func configure(with place: Place) {
        placeNameLabel.text = place.placeName
        longitudeLabel.text = "Longitude: \(place.longitude)"
        stateLabel.text = "State: \(place.state)"
        stateAbbreviationLabel.text = "State abbreviation: \(place.stateAbbreviation)"
        latitudeLabel.text = "Latitude: \(place.latitude)"
    }
}

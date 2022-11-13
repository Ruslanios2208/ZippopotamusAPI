//
//  PlaceCell.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

import UIKit

class PlaceCell: UITableViewCell {
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with place: Place) {
        placeNameLabel.text = place.placeName
        descriptionLabel.text = place.description
    }
}

//
//  MapCell.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCoordinates(lat: Double, lon: Double) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(
            latitude: lat,
            longitude: lon
        )
        annotation.coordinate = centerCoordinate
        mapView.centerCoordinate = centerCoordinate
        let region = MKCoordinateRegion(
            center: centerCoordinate,
            latitudinalMeters: CLLocationDistance(exactly: 500000)!,
            longitudinalMeters: CLLocationDistance(exactly: 500000)!
        )
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        mapView.addAnnotation(annotation)
    }
}

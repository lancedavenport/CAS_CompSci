//
//  ViewController.swift
//  locationData
//
//  Created by Lance Davenport on 3/26/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    var locationManager:CLLocationManager!
    
    var LAT = 34.0240892
    var LONG = -118.4747321
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 15000, height: 15000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
    }
   
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let currentLoc = CLLocationCoordinate2D(latitude: LAT, longitude: LONG)
        let currentPoint = MKMapPoint(currentLoc)
        if rect.contains(currentPoint) {
            label.text = "You are at the Crossroads"
        } else {
            label.text = "You are nowhere"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = mapView.region.span
        print(span)
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}


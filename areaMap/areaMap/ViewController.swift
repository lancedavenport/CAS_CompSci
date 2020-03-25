//
//  ViewController.swift
//  crossroadsFinder
//
//  Created by Lance Davenport on 3/23/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    var LAT = 34.0240892
    var LONG = -118.4747321
    
    var place:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        place = "everything"
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 15000000, height: 15000000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func zoomOut(_ sender: Any) {
        changeZoom(1)
    }
    @IBAction func zoomIn(_ sender: Any) {
        changeZoom(-1)
    }
    
    @IBAction func locationOne(_ sender: Any) {
        place = "Santa Monica Pier"
        LAT = 34.008976
        LONG = -118.4982865
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    @IBAction func locationTwo(_ sender: Any) {
        place = "Hollywood Sign"
        LAT = 34.1339636
        LONG = -118.3228031
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    @IBAction func locationThree(_ sender: Any) {
        place = "Great Wall of China"
        LAT =  40.4318056
        LONG = 116.5691411
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    func changeZoom(_ exp: Double) {
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let currentLoc = CLLocationCoordinate2D(latitude: LAT, longitude: LONG)
        let currentPoint = MKMapPoint(currentLoc)
        if rect.contains(currentPoint) {
            label.text = "You are at the \(place)"
        } else {
            label.text = "You are nowhere"
        }
    }
}


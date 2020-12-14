//
//  RiderViewController.swift
//  UberClone
//
//  Created by Rajvinder Singh on 14/12/20.
//

import UIKit
import MapKit
class RiderViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var callUberButton: UIButton!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordi = manager.location?.coordinate {
           let center =   CLLocationCoordinate2D(latitude: coordi.latitude, longitude: coordi.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            map.setRegion(region, animated: true)
        }
    }
    @IBAction func logOutButtonTapped(_ sender: Any) {
    }
    
    @IBAction func callUberTapped(_ sender: Any) {
    }
}

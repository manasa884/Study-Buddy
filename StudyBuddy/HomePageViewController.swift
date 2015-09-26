//
//  HomePageViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class HomePageViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var locationManager: CLLocationManager!
    var collectionData: [String] = ["CC 303", "CS 429", "M 340L", "PHY 301M", "HIS 316K"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "iconS-2.png"))
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        //let center = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        //let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        let currentLocation = CLLocation()
        
        let locationLat = currentLocation.coordinate.latitude
        let locationLong = currentLocation.coordinate.longitude
        print("locations = \(locationLat) \(locationLong) \(currentLocation.coordinate.latitude) \(currentLocation.coordinate.longitude)")
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ClassCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ClassCollectionViewCell
        cell.classLabel.text = collectionData[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
}

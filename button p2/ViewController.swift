//
//  ViewController.swift
//  button p2
//
//  Created by D7703_14 on 2018. 3. 12..
//  Copyright © 2018년 Personal Team. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let location = CLLocationCoordinate2D(latitude:35.167809,longitude:129.070555)
//        let span = MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta:0.05)
//        let region = MKCoordinateRegion(center:location, span:span )
        let region = MKCoordinateRegionMakeWithDistance(location, 500,500 )
        myMapView.setRegion(region, animated:true)
        let addr = "부산광역시 부산진구 양정1구 418-269"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error : Error?) -> Void in
            if let error = error{
                print(error)
                return
            }
            if placemarks != nil{
                let placemark = placemarks![0]
                print(placemark.location?.coordinate)
                
                let loc01 = placemark.location?.coordinate
                let anno01 = MKPointAnnotation()
                anno01.coordinate = loc01!
                anno01.title = "번개반전"
                anno01.subtitle = addr
                self.myMapView.addAnnotation(anno01)
            }else{
                print("null 발생")
            }
        }
//        let loc01 = CLLocationCoordinate2D(latitude:35.167909, longitude:129.070555)
//        let anno01 = MKPointAnnotation()
//        anno01.coordinate = loc01
//        anno01.title = "번개반전"
//        anno01.subtitle = "부산광역시 부산진구 양정1구 418-269"
//        myMapView.addAnnotation(anno01)
//
//        let loc02 = CLLocationCoordinate2D(latitude:35.167909, longitude:129.070555)
//        let anno02 = MKPointAnnotation()
//        anno02.coordinate = loc02
//        anno02.title = "동의과학대학교"
//
//        myMapView.addAnnotation(anno01)
//
//        let loc03 = CLLocationCoordinate2D(latitude:35.168092, longitude:129.070367)
//        let anno03 = MKPointAnnotation()
//        anno03.coordinate = loc03
//        anno03.title = "토마토도시락"
//        anno03.subtitle = "부산광역시 부산진구 양정1구 418-269"
//        myMapView.addAnnotation(anno01)
        
        
    }

    


}


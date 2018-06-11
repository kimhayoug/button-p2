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
    var annotion = [MKPointAnnotation]()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let location = CLLocationCoordinate2D(latitude:35.167809,longitude:129.070555)
        let span = MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta:0.05)
//        let region = MKCoordinateRegion(center:location, span:span )
        let region = MKCoordinateRegionMakeWithDistance(location, 500,500 )
        myMapView.setRegion(region, animated:true)
        //let addr = "부산광역시 부산진구 양정1구 418-269"
        var foodStoreAddress = ["부산시 부산진구 중앙대로928번길 12",
                                "부산시 부산진구 양지로 34",
                                "부산시 부산진구 양정동 393-21",
                                "부산시 부산진구 양정1동 356-22",
                                "부산시 부산진구 양지로 28",
                                "부산시 부산진구 중앙대로 902"]
        var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
        for addr in foodStoreAddress{
            let getCoder = CLGeocoder()
            getCoder.geocodeAddressString(addr) {
                (Placemarks: [CLPlacemark]?, error: Error?) -> Void in
                    if let myError = error{
                        print(myError)
                        return
                }
                if let myplacemarks = Placemarks{
                    let mylacemarks = myplacemarks[0]
                    let loc = mylacemarks.location?.coordinate
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    
                    self.count = self.count + 1
                    anno.subtitle = addr
                    self.annotion.append(anno)
                    self.myMapView.addAnnotation(self.annotion as! MKAnnotation)
                    }else{
                        print("placemarks nil 발생")
                    }
                }
            }
        }
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(addr) {
//            (placemarks: [CLPlacemark]?, error : Error?) -> Void in
//            if let error = error{
//                print(error)
//                return
//            }
//            if placemarks != nil{
//                let placemark = placemarks![0]
//                print(placemark.location?.coordinate)
//
//                let loc01 = placemark.location?.coordinate
//                let anno01 = MKPointAnnotation()
//                anno01.coordinate = loc01!
//                anno01.title = "번개반전"
//                anno01.subtitle = addr
//                self.myMapView.addAnnotation(anno01)
//            }else{
//                print("null 발생")
//            }
//        }
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

    





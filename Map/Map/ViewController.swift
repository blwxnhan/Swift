//
//  ViewController.swift
//  Map
//
//  Created by 한보원 on 8/8/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double)->CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees , longitudeValue: CLLocationDegrees,delta span: Double, title strTitle: String, subtitle strSubtitle: String){
            
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    //위치가 업데이트 되었을때 지도에 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치 업데이트 될 시에 먼저 마지막 위치의 값을 찾아냄
        let pLocation = locations.last
        
        //마지막 위도 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출 delta값은 지도의 크기 정함 (작을수록 확대되는 효과)
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //reverse Geocode Location 함수에서 내부 파라미터인 핸들러를 익명함수로
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error)-> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
            
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지퍼블리싱 ", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
        else if sender.selectedSegmentIndex == 3{
            setAnnotation(latitudeValue: 37.385156, longitudeValue: 126.641484, delta: 0.01, title: "우리집", subtitle: "인천광역시 인천타워대로 132번길 9")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"
            
        }
    }
    
}


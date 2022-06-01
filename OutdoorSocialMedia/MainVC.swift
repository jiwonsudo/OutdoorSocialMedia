//
//  MainVC.swift
//  OutdoorSocialMedia
//
//  Created by 정지원 on 2022/06/01.
//

import UIKit
import MapKit
import CoreLocation
import PartialSheet

var isLogin = false
var username = ""

class MainVC: UIViewController, MKMapViewDelegate ,CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var lblUsername: UILabel!
    
    let locationManager = CLLocationManager()
    var location: CLLocation!
    
    let mark1 = Marker(
              title: "홍대입구역",
              subtitle: "사람이 너무 많아요ㅜ",
              coordinate: CLLocationCoordinate2D(latitude: 37.55769, longitude: 126.92450))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addAnnotation(mark1)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
        
        if isLogin == true {
            lblUsername.text = username
        } else {
            lblUsername.text = "로그인이 필요합니다."
        }
        
    }
    
    func notLoginedYet(){
        let notLoginedAlert = UIAlertController(title: "로그인 알림", message: "로그인을 먼저 진행해 주세요.", preferredStyle: .alert)
        let actionGoLogin = UIAlertAction(title: "로그인 창으로 이동", style: .default, handler: {(action) in
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        })
        let actionCancle = UIAlertAction(title: "취소", style: .default, handler: {(action) in})
        notLoginedAlert.addAction(actionGoLogin)
        notLoginedAlert.addAction(actionCancle)
        present(notLoginedAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnGoProfile(_ sender: UIBarButtonItem) {
        if isLogin == false {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .popover
            self.present(nextVC, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {return}
            nextVC.modalPresentationStyle = .popover
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    
}


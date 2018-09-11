//
//  MapListVC.swift
//  playaround
//
//  Created by Marco Martínez on 28/06/18.
//  Copyright © 2018 Marco Martínez. All rights reserved.
//

import Alamofire
import GoogleMaps
import SwiftyJSON
import UIKit

class CustomMarker:GMSMarker{
    var id:Int?
}



class MapListVC:UIViewController, GMSMapViewDelegate{
    
    var locations:[LocationResume] = []
    
    var mapView : GMSMapView!
    
    var scroller:SlidingCards!
    
    var destinationVC: DestinationsVC? = nil
    
    override func viewDidLoad() {
        
        let mapFrame = CGRect(x: 0, y: 0 , width: self.view.frame.width, height: self.view.frame.height)
        
        let camera = GMSCameraPosition.camera(withLatitude: 19.4266260, longitude: -99.2226480, zoom: 7.0)
        mapView = GMSMapView.map(withFrame: mapFrame, camera: camera)
        mapView.isMyLocationEnabled = true
        
        self.view.addSubview(mapView)
        mapView.delegate = self
        
        var index = 0
        
        var latitud:Double = 0
        var longitude:Double = 0
        
        for location in locations{
            
            
            var imagename = "NATURE_pin"
            //pt
            if location.activitieCodes != nil{
                print(location.activitieCodes)
                let base = location.activitieCodes!
                imagename =  "\(base)_pin"
            }
            //LOCALAGRONOMY
            let image = UIImage(named: imagename)!//.withRenderingMode(.alwaysTemplate)
            let markerView = UIImageView(image: image)
            markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 40)
            
            latitud += location.latitude
            longitude += location.longitude
            
            let marker = CustomMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            marker.title = location.hostName
            //marker.snippet = ""
            marker.iconView = markerView
            marker.map = mapView
            marker.id = index
            
            index += 1
            print(longitude)
            
            
            
        }
        
        
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: latitud/Double(index) - 1.5, longitude: longitude/Double(index)))
        
        self.view.sendSubview(toBack: mapView)
        
        scroller = SlidingCards()
        
        scroller.pointsInformation = locations
        
        ///scroller.sendAction(button: <#T##UIButton#>)
        
        scroller.frame = CGRect(x: 0, y: self.view.frame.height - 200 - 110, width: self.view.frame.width, height: 180)
        scroller.backgroundColor = UIColor.clear
        
        self.view.addSubview(scroller)
        
    }
    
    
    
    /*func updateLocations(locations:[LocationResume] ){
        print("called")
        self.locations = locations
        var index = 0
        print(locations.count)
        for location in self.locations{
            let house = UIImage(named: "blue_marker")!.withRenderingMode(.alwaysTemplate)
            let markerView = UIImageView(image: house)
            markerView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            markerView.tintColor = .red
            
            let marker = CustomMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.geography.latitude, longitude: location.geography.longitude)
            marker.title = location.hostName
            marker.snippet = "Agency"
            marker.iconView = markerView
            marker.map = mapView
            marker.id = index
            
            index += 1
        }
    }*/
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let m = marker as? CustomMarker
        print("click")
        print(m!.id!)
        scroller.scrollToPosition(m!.id!)
        return true
    }
    
    func reloadMap(){
        var latitud:Double = 0
        var longitude:Double = 0
        var index = 0
        
        mapView.clear()
        
        for location in locations{
            
            var imagename = "NATURE_pin"
            //pt
            if location.activitieCodes != nil{
                let base = location.activitieCodes
                imagename =  "\(base!)_pin"
            }
            //LOCALAGRONOMY
            let image = UIImage(named: imagename)!//.withRenderingMode(.alwaysTemplate)
            let markerView = UIImageView(image: image)
            markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 40)
            
            latitud += location.latitude
            longitude += location.longitude
            
            let marker = CustomMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            marker.title = location.hostName
            //marker.snippet = ""
            marker.iconView = markerView
            marker.map = mapView
            marker.id = index
            
            index += 1
            print(longitude)
            
            
            
        }
        
        
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: latitud/Double(index) - 1.5, longitude: longitude/Double(index)))
        
        self.view.sendSubview(toBack: mapView)
        
        let rect = scroller.frame
        scroller.removeFromSuperview()
        scroller = SlidingCards()
        
        /*scroller.addTarget(self, action: #selector(polaroidClicked(_sender: )), for: .touchUpInside)*/
        //scroller.sendActions(for: .valueChanged)
        
        scroller.addTarget(self, action: #selector(polaroidClicked(_sender: )), for: .valueChanged)
        
        
        scroller.pointsInformation = locations
        scroller.frame = rect
        scroller.backgroundColor = UIColor.clear
        
        self.view.addSubview(scroller)
        
        
    
    }
    
    
    
    @objc func polaroidClicked(_sender : SlidingCards){
        print("clicked")
        print(_sender.current)
        if destinationVC != nil{
            destinationVC?.getDestinationData(id: _sender.current)
        }
    }
}

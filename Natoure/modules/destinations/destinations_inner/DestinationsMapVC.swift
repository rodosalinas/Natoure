//
//  DestinationsMapVC.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import GoogleMaps
import UIKit

class DestinationsMapVC: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var map  :DestinationsMapVC!
    var mainVC : DestinationsMapToParentProtocol!
    
    @IBOutlet weak var carousel: PolaroidCarousel!
    
    override func viewDidLoad() {
        let camera = GMSCameraPosition.camera(withLatitude: 19.4266260, longitude: -99.2226480, zoom: 7.0)
        mapView.camera = camera
        
        mapView.isMyLocationEnabled = true
        
        self.view.addSubview(mapView)
        mapView.delegate = self
    }
}

extension DestinationsMapVC: DestinationsParentToMapProtocol{
    func setMapAICPoints(_ aicList: [AICResume]) {
        
        var latitud:Double = 0
        var longitude:Double = 0
        
        for ( index, aic) in aicList.enumerated(){
            let imagename = "NATURE_pin"
            let image = UIImage(named: imagename)!
            
            let markerView = UIImageView(image: image)
            markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 40)
            
           
            latitud += aic.latitude
            longitude += aic.longitude
            
            let marker = CustomMarker()
            marker.position = CLLocationCoordinate2D(latitude: aic.latitude, longitude: aic.longitude)
            marker.title = aic.name
            //marker.snippet = ""
            marker.iconView = markerView
            marker.map = mapView
            marker.id = index
            
        }
        
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: latitud/Double(aicList.count) + 4.5, longitude: longitude/Double(aicList.count - 1) ))
        
        self.view.sendSubview(toBack: mapView)
        
        carousel.cards = aicList
        carousel.addTarget(self, action: #selector(polaroidClicked(_sender: )), for: .valueChanged)
        carousel.updateView()
        
        //carousel.
    }
    
    
    @objc func polaroidClicked(_sender : SlidingCards){
        print("clicked")
        print(carousel.current)
        mainVC.itemClicked(id:carousel.current)
        /*if destinationVC != nil{
            destinationVC?.getDestinationData(id: _sender.current)
        }*/
    }
    
    
    
}

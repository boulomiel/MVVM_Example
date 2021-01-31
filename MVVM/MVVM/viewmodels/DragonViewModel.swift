//
//  DragonViewModel.swift
//  MVVM
//
//  Created by Ruben Mimoun on 31/01/2021.
//

import Foundation
import UIKit
import MapKit

class DragonViewModel  {
    
    var locationManager:CLLocationManager!
    var dragon : Dragon
    
    init(dragon : Dragon) {
        self.dragon =  dragon
    }
    
    var dragontImage : UIImage{
        return UIImage(named: dragon.imageName)!
    }
    
    var dragonName : String {
        return dragon.name
    }
    
    var dragonSpecies : String {
        return dragon.species
    }
    
    

    

    
    var currentRegion = MKCoordinateRegion()
    
    var dragonRarity : String {
        switch (dragon.rarity){
        case .common :
            return " \(dragonName) is a common dragon "
        case .rare :
            return "\(dragonName) is a rare dragon"
        case .veryRare :
            return "\(dragonName) is a very rare dragon"
        }
    }
    
    func initDragonView(dragonView : DragonView) {
        
        dragonView.image.image = dragontImage
        dragonView.name.text = dragonName
        dragonView.species.text =  dragonSpecies
        dragonView.rarity.text = dragonRarity
        
        let location = CLLocation(latitude: dragon.coodinates.latitude , longitude: dragon.coodinates.longitude)
        var locality : String?
        var locCountry : String?
        
        var zone : (city : String?, country : String? )
        
        location.placemark { placemark, error in
            guard let placemark = placemark else {
                    print("Error:", error ?? "nil")
                    return
                }
            
            locCountry = placemark.country
            locality =  placemark.locality
            
            zone.city = locality
            zone.country = locCountry
            
            if let city = zone.city  ,  let country = zone.country {
                dragonView.currentLocation.text = "This dragon's zone is \(city), \(country)"

            }else{
                dragonView.currentLocation.text = "This dragon's zone is unknown"

            }
            
            
        }
   
  
    
        
        let coordinate2D = CLLocationCoordinate2D(latitude: dragon.coodinates.latitude, longitude: dragon.coodinates.longitude)
        dragonView.mapView.setCenter(coordinate2D, animated: true)
        

        
    }
    
    

   
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
    
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
           CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
       }
}


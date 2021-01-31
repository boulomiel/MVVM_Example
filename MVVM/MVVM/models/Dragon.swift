//
//  Dragon.swift
//  MVVM
//
//  Created by Ruben Mimoun on 31/01/2021.
//

import Foundation


struct Dragon {
    
    enum Rare {
        case common
        case rare
        case veryRare
        
    }
    
    var imageName : String
    var name : String
    var rarity : Rare
    var species : String
    var coodinates : (latitude : Double , longitude : Double)
}

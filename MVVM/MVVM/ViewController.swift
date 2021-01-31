//
//  ViewController.swift
//  MVVM
//
//  Created by Ruben Mimoun on 31/01/2021.
//

import UIKit

class ViewController: UIViewController  {

    
    @IBOutlet weak var dragonView : DragonView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myDragon =  Dragon(imageName: "dragon", name: "Paul" , rarity: .veryRare, species: "RedSpikes", coodinates: (latitude : 48.8566, longitude : 2.3522))
        let dragonViewModel =  DragonViewModel(dragon: myDragon)
        dragonViewModel.initDragonView(dragonView: dragonView)
        
    }


}


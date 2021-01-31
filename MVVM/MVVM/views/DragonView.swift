//
//  DragonView.swift
//  MVVM
//
//  Created by Ruben Mimoun on 31/01/2021.
//

import Foundation
import UIKit
import MapKit

class DragonView : UIView{
    
    let xibName = "Custom"
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var species : UILabel!
    @IBOutlet weak var rarity : UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var currentLocation: UILabel!
    
    override init(frame : CGRect){
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        contentView.fixInView(self)
        
    }
    
    
}

extension UIView{
    
    func fixInView(_ container : UIView) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
}

//
//  ViewController.swift
//  OSM2VectorTiles
//
//  Created by Petr Pridal on 29/02/16.
//  Copyright © 2016 Klokan Technologies GmbH. All rights reserved.
//

// https://www.mapbox.com/help/first-steps-ios-sdk/

import UIKit
import Mapbox

class ViewController: UIViewController {

    @IBOutlet var mapView: MGLMapView!
    
    override func viewDidLoad() {
        
        mapView.logoView.isHidden = true;
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  OSM2VectorTiles
//
//  Created by Petr Pridal on 29/02/16.
//  Copyright © 2016 Klokan Technologies GmbH. All rights reserved.
//  Copyright © 2016 ePi Rational, Inc.  All rights reserved.
//

// https://www.mapbox.com/help/first-steps-ios-sdk/

import UIKit
import Mapbox

class ViewController: UIViewController {

    @IBOutlet var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.logoView.isHidden = true;
    }
}


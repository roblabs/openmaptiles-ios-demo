//
//  ViewController_Preview.swift
//  OSM2VectorTiles
//
//  Created by Rob Labs on 7/5/20.
//  Copyright © 2020 ePi Rational, Inc.. All rights reserved.
//

import SwiftUI

/// - Tag: ViewController_Preview
struct ViewController_Preview: UIViewControllerRepresentable {

    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc =  ViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct ContentView_MapModelControllerPreview: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        ViewController_Preview()
    }
}

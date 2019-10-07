//
//  WatchMapView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/5/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import Foundation
import SwiftUI
import WatchKit

struct WatchMapView: WKInterfaceObjectRepresentable {
    var locationCoordinate: CLLocationCoordinate2D

    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        // Update the interface object.
        let span = MKCoordinateSpan(latitudeDelta: 0.02,
                                    longitudeDelta: 0.02)

        let region = MKCoordinateRegion(
            center: locationCoordinate,
            span: span)

        map.setRegion(region)
    }
}

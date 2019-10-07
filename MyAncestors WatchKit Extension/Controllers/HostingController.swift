//
//  HostingController.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/2/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<AncestorListView> {
    override var body: AncestorListView {
        return AncestorListView()
    }
}

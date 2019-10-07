//
//  AncestorListHostingController.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/4/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI


class AncestorListHostingController: WKHostingController<AncestorListView> {
  override var body: AncestorListView {
    return AncestorListView()
  }
}

final class AncestorData: ObservableObject {
  @Published var ancestors = myAncestors
}

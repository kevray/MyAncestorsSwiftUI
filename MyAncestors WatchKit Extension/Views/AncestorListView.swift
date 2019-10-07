//
//  AncestorListView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/7/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import SwiftUI

struct AncestorListView: View {
  
  var body: some View {
    List(myAncestors) { ancestor in
      NavigationLink(destination: AncestorDetailView(ancestor: ancestor)) {
        Text(ancestor.name)
        .font(.headline)
      }
    }
  }
}

struct AncestorListView_Previews: PreviewProvider {
  static var previews: some View {
    AncestorListView()
  }
}

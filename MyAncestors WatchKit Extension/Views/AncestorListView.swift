//
//  AncestorListView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/2/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import SwiftUI
import Combine

struct AncestorListView: View {
  @State var ancestorData: AncestorData = AncestorData()
  var body: some View {
    List(0..<ancestorData.ancestors.count) { index in
      NavigationLink(destination: AncestorDetailView(ancestor: self.$ancestorData.ancestors[index])) {
          Text(self.ancestorData.ancestors[index].name)
      }
    }
  }
}

struct AncestorListView_Previews: PreviewProvider {
  static var previews: some View {
    AncestorListView()
  }
}


//
//  AncestorDetailView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/7/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import SwiftUI

struct AncestorDetailView: View {
  let ancestor: Ancestor
  var body: some View {
    List {
      HeaderView(ancestor: ancestor)
      
      ForEach(ancestor.events) { event in
        EventCellView(event: event)
      }
    }
  }
}

struct AncestorDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AncestorDetailView(ancestor: myAncestors[0])
      AncestorDetailView(ancestor: myAncestors[2])
      .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 5 - 40mm"))
    }
  }
}

// MARK: - HeaderView
struct HeaderView: View {
  
  @State private var presentImagePicker: Bool = false
  @State var ancestor: Ancestor
  
  var body: some View {
    VStack(alignment: .center) {
      Image(ancestor.imageName)
        .resizable()
        .frame(width: 120, height: 120)
        .clipShape(Circle())
        .overlay(Circle().stroke(lineWidth: 2))
        .onTapGesture {
          self.presentImagePicker.toggle()
      }
      
      Text(ancestor.name + " ")
        .font(.system(size:20))
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
      
      }
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding()
    .listRowBackground(EmptyView())
    .sheet(isPresented: $presentImagePicker) {
      ImagePickerView(selectedImageName: self.$ancestor.imageName)
    }
  }
}

// MARK: - EventCellView
struct EventCellView: View {
  let event: Event
  var body: some View {
    Section(header: Text(event.eventType == .birth ? "Birth" : "Death")) {
      VStack(alignment:.leading) {
        Text(event.placeName)
        Text(event.date)
      }
    }
  }
}

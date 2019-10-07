//
//  AncestorDetailView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/2/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import SwiftUI

struct AncestorDetailView: View {
  @Binding var ancestor: Person
  
  var body: some View {
    List {
      Header(ancestor: $ancestor).listRowBackground(EmptyView())
      ForEach(ancestor.events) { event in
        NavigationLink(destination: WatchMapView(locationCoordinate: event.placeCoordinate)) {
          EventCellView(event: event)
        }
      }
    }
  }
}

struct AncestorDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AncestorDetailView(ancestor: .constant(myAncestors[0]) )
      AncestorDetailView(ancestor: .constant(myAncestors[1]) )
        .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 5 - 40mm"))
    }
  }
}

struct Header: View {
  @Binding var ancestor: Person
  @State var presentImagePicker = false
  
  var body: some View {
    VStack {
    Image(ancestor.imageName)
      .resizable()
      .frame(width: 100.0, height: 100)
      .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      .overlay(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.stroke(lineWidth: 2))
      .onTapGesture {
        self.presentImagePicker = true
      }

      Text(ancestor.name)
        .font(.headline)
    }
    .frame(maxWidth: .infinity, alignment: .center)
    .sheet(isPresented: $presentImagePicker) {
      ImagePickerView(selectedImageName: self.$ancestor.imageName)
    }
  }
}

struct EventCellView: View {
  let event: Event
  var body: some View {
    VStack(alignment: .leading) {
      Text(event.date)
      Text(event.placeName)
    }.padding()
  }
}

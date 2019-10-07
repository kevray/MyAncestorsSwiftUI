//
//  SampleData.swift
//  SwiftUIPresentation WatchKit Extension
//
//  Created by Kevin Ray on 9/4/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import Foundation
import SwiftUI

enum Gender {
  case male, female
}

enum EventType {
  case birth, death
}

let myAncestors: [Ancestor] = [
  Ancestor(name: "Gerald Ray", events: [Event(date: "Nov 23, 1923", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Jun 15, 2016", placeName: "Salt Lake City, Utah", eventType: .death)], gender: .male, imageName: "thumb1"),
  Ancestor(name: "Dorothy Leavitt", events: [Event(date: "Jan 23, 1921", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Apr 15, 2019", placeName: "Moscow, Russia", eventType: .death)], gender: .female, imageName: "thumb2"),
  Ancestor(name: "Sims Flood Ray", events: [Event(date: "Jul 23, 1893", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "May 15, 1965", placeName: "Tennessee, New Hampshire", eventType: .death)], gender: .male, imageName: "thumb3"),
  Ancestor(name: "Nellie Elsworth", events: [Event(date: "Sept 23, 1890", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Aug 15, 1974", placeName: "Turkey, Kursha", eventType: .death)], gender: .female, imageName: "thumb4"),
  Ancestor(name: "George Wilford Leavitt", events: [Event(date: "Mar 23, 1888", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Nov 15, 1949", placeName: "New York, New York", eventType: .death)], gender: .male, imageName: "thumb5"),
  Ancestor(name: "Mary Lillian Earl", events: [Event(date: "Jun 23, 1891", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Dec 15, 1982", placeName: "Provo, Utah", eventType: .death)], gender: .female, imageName: "thumb6"),
  Ancestor(name: "Thomas Ira Allen", events: [Event(date:"Aug 23, 1863", placeName: "Mesa, Arizona", eventType: .birth), Event(date: "Jan 15, 1948", placeName: "Las Vegas, Nevada", eventType: .death)], gender: .male, imageName: "thumb7")
]

struct Ancestor: Identifiable {
  let id = UUID().uuidString
  let name: String
  let events: [Event]
  let gender: Gender
  var imageName: String
}
struct Event: Identifiable {
  let id = UUID().uuidString
  let date: String
  let placeName: String
  let placeCoordinate = CLLocationCoordinate2D(latitude: 40.560533, longitude: -111.873760)
  let eventType: EventType
}

final class AncestorData: ObservableObject {
  @Published var ancestors = myAncestors
}

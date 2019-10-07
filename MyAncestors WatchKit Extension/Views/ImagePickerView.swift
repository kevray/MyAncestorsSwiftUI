//
//  ImagePickerView.swift
//  MyAncestors WatchKit Extension
//
//  Created by Kevin Ray on 10/3/19.
//  Copyright © 2019 Booyabuddy. All rights reserved.
//

import SwiftUI

struct ImagePickerView: View {
  @Binding var selectedImageName: String
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    
    List(0 ..< 3) { i in
      ForEach(1..<4){ j in
        Image(self.imageName(row:j, column: i)).resizable().frame(width: 50, height:50)
          .onTapGesture {
          self.selectedImageName = self.imageName(row:j, column: i)
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }
  }
  
  func imageName(row: Int, column: Int) -> String {
    return "thumb\(column * 3 + row)"
  }
}

struct ImagePickerView_Previews: PreviewProvider {
  static var previews: some View {
    ImagePickerView(selectedImageName: .constant(""))
  }
}

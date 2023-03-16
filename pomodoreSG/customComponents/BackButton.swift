//
//  BackButton.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

struct BackButton: View {
  var action: (() -> Void)
  
  var body: some View {
    Button(action: {
      action()
    }) {
        Image("backArrow")
            .resizable()
            .frame(width: 25, height: 25)
    }
    .frame(width: 15, height: 15)
    .padding(.leading, 10)
  }
}

struct BackButton_Previews: PreviewProvider {
  static var previews: some View {
      BackButton(action: {})
  }
}

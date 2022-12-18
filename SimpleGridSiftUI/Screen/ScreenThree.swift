//
//  ScreenThree.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 18/12/22.
//

import SwiftUI

struct ScreenThree: View {
    
    @State private var value = 0
    
    let colors: [Color] = [.orange, .red, .gray, .blue,                               .green, .purple, .pink]
    
    func incrementStep() {
          value += 1
          if value >= colors.count { value = 0 }
      }

    func decrementStep() {
          value -= 1
          if value < 0 { value = colors.count - 1 }
      }
    
    var body: some View {
        VStack {
            Stepper {
                Text("Value: \(value) Color: \(colors[value].description)")
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            .padding(5)
            .background(colors[value])
            
            Text("Screen Three")
        }.padding(10)
    }
}

struct ScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        ScreenThree()
    }
}

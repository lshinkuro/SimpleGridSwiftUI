//
//  ContentView.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 17/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Grid(alignment: .center, horizontalSpacing: 20, verticalSpacing: 20)  {
                GridRow {
                    RectangleView(fillColor: .red)
                    RectangleView(fillColor: .green)
                    RectangleView(fillColor: .yellow)
                }
                GridRow {
                    Color.clear.gridCellUnsizedAxes([.vertical, .horizontal])
                    RectangleView(fillColor: .red)
                    RectangleView(fillColor: .green)
                }
                GridRow {
                    Color.clear.gridCellUnsizedAxes([.vertical, .horizontal])
                        .gridCellColumns(2)
                    RectangleView(fillColor: .yellow)
                }
                GridRow {
                    Rectangle().fill(.red).frame(width: 20, height: 20).cornerRadius(5)
                        .gridColumnAlignment(.center)
//                        .gridCellAnchor(.center)
                    Rectangle().fill(.cyan).frame(height: 100).cornerRadius(25).gridCellUnsizedAxes(.vertical).gridCellColumns(2)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RectangleView: View {
    
    @State var fillColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(fillColor)
                .frame(width: 100, height: 100)
            Text(randomString(length:1)).font(.title).fontWeight(.bold).foregroundColor(Color.random)
        }
       
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

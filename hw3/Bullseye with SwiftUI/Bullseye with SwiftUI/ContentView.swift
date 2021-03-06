//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var num: Double = 50
    @State var toggle = false
    var body: some View {
        
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20).padding(.top, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }.padding(.trailing, 20).padding(.top, 20)
            }
            
            Spacer()
            
            HStack() {
                VStack() {
                    Text("Move the Slider to:")
                    Text("25")
                    Slider(value: $num, in: 0...100)
                }
            }.padding(.bottom, 200).padding(.leading, 20).padding(.trailing,20).font(.system(size: 30))
            
            Spacer()
            HStack() {
                
                VStack() {
                    Toggle("Exact Mode?", isOn: $toggle)
                }
            }.padding(.trailing, 90).padding(.leading,90 )

        }
    }
}

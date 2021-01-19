//
//  ContentView.swift
//  ninety days
//
//  Created by Caleb Elson on 6/29/20.
//

import SwiftUI

// View for adding a grade
// Uses a slider, with the slider coloer and text changing based on value

struct AddTodayView: View {
    @State private var value: Double = 75
    @Binding var addToday: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Value: \(Int(value))")
                    .padding(.top)

                VStack(){ () -> Text in
                    switch value {
                    case 0:
                        return Text("There's always tomorrow!")
                    case 1...24:
                        return Text("Progress is progress!")
                    case 25...49:
                        return Text("Keep chipping away!")
                    case 50...74:
                        return Text("Nice work!")
                    case 75...89:
                        return Text("Great job!")
                    default:
                        return Text("You're on fire!")
                    }
                }
                .foregroundColor(Color(.sRGB, red: (value/100)*1.5, green: 0.5*(100-value)/100, blue: (100-value)/100, opacity: 1))
            }
            
            Spacer()
            
            Slider(value: $value, in: 0...100, step: 1)
                .rotationEffect(.degrees(-90), anchor: .center)
                .accentColor(Color(.sRGB, red: (value/100)*1.5, green: 0.25*(100-value)/100, blue: (100-value)/100, opacity: 1))
            
            Spacer()
            
            Button(action: {
                addToday = false
            }, label: {
                Text("Save")
            })
            .font(Font.title3)
            .padding(.all)
        }
        .navigationTitle("Grade Today")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddTodayView(addToday: .constant(true))
            }
            
            NavigationView {
                AddTodayView(addToday: .constant(true))
            }
            .preferredColorScheme(.dark)
        }
        
    }
}

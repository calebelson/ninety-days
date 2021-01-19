//
//  TrendView.swift
//  ninety days
//
//  Created by Caleb Elson on 6/30/20.
//

import SwiftUI

// TrendView generates the bar graphs in HomeView
// Shows historical data for every day recorded for every habit
// Color and height vary based on the values from AddTodayView
// Currently generates random values

struct TrendView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                ScrollViewReader { scrollView in
                    HStack {
                        ForEach(1..<31) { i in
                            VStack {
                                Spacer()
                                
                                let random = rand()
                                
                                Rectangle()
                                    .fill(random.0)
                                    .frame(width: 20, height: random.1)
                                
                                
                                Text("6/\(i)")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .frame(height: 18)
                                    .foregroundColor(random.0)
                            }
                        }
                    }
                    .padding(.all)
                    .onAppear {
                        // TODO: - Change to last in the data set
                        scrollView.scrollTo(25)
                    }
                }
            }
        }
    }
}

// TODO: - Delete once data has been setup
func rand() -> (color: Color, number: CGFloat) {
    let rand = CGFloat.random(in: 0...100)
    let randColor = Color(.sRGB, red: Double((rand/100)*1.5), green: Double(0.5*(100-rand)/100), blue: Double((100-rand)/100), opacity: 1)
            
    return (randColor, rand)
}

struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrendView()
        }
    }
}

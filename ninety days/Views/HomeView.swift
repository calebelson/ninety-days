//
//  HomeView.swift
//  ninety days
//
//  Created by Caleb Elson on 6/30/20.
//

import SwiftUI

struct HomeView: View {
    @State var showSettings = false
    @State var showNewHabit = false
    @State var addToday = false
    
    var body: some View {
        NavigationView {
                List {
                    Section(header: Text("TestHabit1")) {
                        VStack {
                            Text("\(Int.random(in: 1...90)) Days Left")
                                .font(.title)
                                .padding(.all)
                            Divider()
                            ProgressView()
                                .padding(.bottom)
                            Divider()
                            TrendView()
                                .padding(.all)
                            
                            // TODO: Calculate whether today is missing from goal's data
                            if (Int.random(in: 1...1) == 1) {
                                Divider()
                                Button(action: {
                                    addToday.toggle()
                                }, label: {
                                    Text("Add Today")
                                        .foregroundColor(.blue)
                                }).sheet(isPresented: $addToday) {
                                    // TODO: Add tracking for individual goals
                                    AddTodayView(addToday: $addToday)
                                }
                            }
                            
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                    
                    Section(header: Text("TestHabit2")) {
                        VStack {
                            Text("\(Int.random(in: 1...90)) Days Left")
                                .font(.title)
                                .padding(.all)
                            Divider()
                            ProgressView()
                                .padding(.bottom)
                            Divider()
                            TrendView()
                                .padding(.all)
                            if (Int.random(in: 1...1) == 1) {
                                Divider()
                                Button(action: {
                                    addToday.toggle()
                                }, label: {
                                    Text("Add Today")
                                        .foregroundColor(.blue)
                                }).sheet(isPresented: $addToday) {
                                    AddTodayView(addToday: $addToday)
                                }
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Habits")
            .navigationBarItems(leading:
                                    Button(action: {
                                        showNewHabit.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                            .imageScale(.large)
                                    }).sheet(isPresented: $showNewHabit) {
                                        NewHabitView(showNewHabit: $showNewHabit)
                                    },
                                trailing:
                                    Button(action: {
                                        showSettings.toggle()
                                    }, label: {
                                        Image(systemName: "gear")
                                            .imageScale(.large)
                                    }).sheet(isPresented: $showSettings) {
                                        SettingsView()
                                    }
            )
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

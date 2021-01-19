//
//  SettingsView.swift
//  ninety days
//
//  Created by Caleb Elson on 7/2/20.
//

import SwiftUI

struct SettingsView: View {
    // TODO: Replace with persistent user generated habits
    @State private var habits = [
        "Test1", "Test2",
        "Test3", "Test4"
    ]
    @State var habitsExpanded = true
    @State var deleteAlert = false
    @State var showAbout = false
    
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    DisclosureGroup("Habits", isExpanded: $habitsExpanded) {
                        ForEach(habits, id: \.self) { user in
                            HStack {
                                Image(systemName: "timelapse")
                                Text(user)
                            }
                        }
                        .onMove(perform: move)
                        .onDelete(perform: delete)
                    }
                }
                
                Section() {
                    Button(action: {
                        showAbout.toggle()
                    }, label: {
                        Text("About")
                    }).sheet(isPresented: $showAbout) {
                        AboutView()
                    }
                }
            }
            .alert(isPresented: $deleteAlert) {
                Alert(title: Text("Are you sure?"), message: Text(
                    "Are you sure you want to delete a habit? This cannot be undone"
                ), primaryButton: .destructive(Text("Yes")), secondaryButton: .cancel())
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .environment(\.editMode, .constant(habitsExpanded ? .active : .inactive))
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        habits.move(fromOffsets: source, toOffset: destination)
    }
    
    // TODO: Remove habits
    func delete(at source: IndexSet) {
        deleteAlert = true
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

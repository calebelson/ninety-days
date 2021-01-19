//
//  NewGoalView.swift
//  ninety days
//
//  Created by Caleb Elson on 7/2/20.
//

import SwiftUI

// View to create new goals
// Requires at least one character to enable "save" button

struct NewHabitView: View {
    @State private var habitName: String = ""
    @Binding var showNewHabit: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter habit name...", text: $habitName, onCommit: {
                    self.hideKeyboard()
                })
                    .multilineTextAlignment(.center)
                Button(action: {
                    if habitName.count > 0 {
                       savePressed(name: habitName)
                        showNewHabit = false
                    }
                }, label: {
                    Text("Save")
                })
                .disabled(habitName.count == 0)
            }
            .navigationBarItems(leading: Button(action: {
                showNewHabit = false
            }, label: {
                Text("Cancel")
            }))
        }
    }
}

// TODO: - Save new habit to persistent data
func savePressed(name: String) {
    
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(showNewHabit: .constant(true))
    }
}

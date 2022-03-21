//
//  EditView.swift
//  HabiTrack
//
//  Created by Joshan Rai on 3/21/22.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var habits: Habits
    
    var id: UUID
    
    @State var completed: Int = 0
    
    var activity: Activity {
        habits.getActivity(id: id)
    }
    
    var body: some View {
        Form {
            Text(activity.title)
            Text(activity.description)
            Stepper(
                label: { Text("Completed \(activity.completed) times")},
                onIncrement: { updateActivity(by: 1) },
                onDecrement: { updateActivity(by: -1) }
            )
        }
        .navigationTitle("Edit Activity")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func updateActivity(by change: Int) {
        var activity = activity
        activity.completed += change
        habits.update(activity: activity)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(habits: Habits(), id: UUID())
    }
}

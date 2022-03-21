//
//  AddView.swift
//  HabiTrack
//
//  Created by Joshan Rai on 3/21/22.
//

import SwiftUI

struct AddView: View {
    @Environment (\.dismiss) var dismiss
    
    @ObservedObject var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("New Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", action: {
                        dismiss()
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add", action: {
                        let activity = Activity(title: title, description: description)
                        habits.activities.append(activity)
                        dismiss()
                    })
                    .font(.body.bold())
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}

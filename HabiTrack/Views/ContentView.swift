//
//  Views/ContentView.swift
//  HabiTrack
//
//  Created by Joshan Rai on 3/19/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State var showAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(habits.activities) { activity in
                        NavigationLink(destination: EditView(habits: habits, id: activity.id)) {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.headline)
                                Text(activity.description)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                                
                                HStack {
                                    Text("Completed")
                                    Text("\(activity.completed)")
                                        .padding(.horizontal, -5)
                                        .foregroundColor(activity.completed > 0 ? Color.green : Color.red)
                                    Text("times")
                                }
                                .font(.subheadline)
                            }
                        }
                    }
                    .onDelete { offsets in
                        habits.activities.remove(atOffsets: offsets)
                    }
                }
                
                Button(action: {
                    showAddView = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("New Activity")
                    }
                }
                .padding()
                //.tint(Color(UIColor.systemRed))
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddView) {
                AddView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

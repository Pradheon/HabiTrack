//
//  Model/Habits.swift
//  HabiTrack
//
//  Created by Joshan Rai on 3/21/22.
//

import Foundation

class Habits: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedHabits) {
                activities = decoded
                return
            }
        }
        
        activities = []
    }
    
    func update(activity: Activity) {
        guard let index = getIndex(activity: activity) else { return }
        activities[index] = activity
    }
    
    func getActivity(id: UUID) -> Activity {
        guard let index = getIndex(id: id) else {
            return Activity(title: "", description: "")
        }
        return activities[index]
    }
    
    func getIndex(activity: Activity) -> Int? {
        return activities.firstIndex(where: { $0.id == activity.id })
    }
    
    func getIndex(id: UUID) -> Int? {
        return activities.firstIndex(where: { $0.id == id })
    }
}

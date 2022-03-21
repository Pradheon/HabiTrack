//
//  Model/Activity.swift
//  HabiTrack
//
//  Created by Joshan Rai on 3/21/22.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var completed: Int = 0 {
        didSet {
            if completed < 0 {
                completed = 0
            }
        }
    }
}

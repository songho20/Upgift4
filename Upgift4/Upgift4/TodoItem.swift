//
//  TodoItem.swift
//  Upgift4
//
//  Created by Soniya Ghorbani on 2024-11-24.
//


import Foundation
import SwiftData

@Model
final class TodoItem {
    // UUID is implicitly treated as the primary key by SwiftData
    @Attribute var id: UUID  // Unique identifier for each TodoItem
    @Attribute var title: String  // The title of the TodoItem
    @Attribute var isCompletedInt: Int  // The completion status (0 or 1)

    // Computed property to convert isCompletedInt (Int) to Bool for use in the UI
    var isCompleted: Bool {
        get {
            return isCompletedInt == 1  // If isCompletedInt is 1, it's completed
        }
        set {
            isCompletedInt = newValue ? 1 : 0  // Convert Bool to Int (1 or 0)
        }
    }

    // Initializer for TodoItem
    init(title: String, isCompleted: Bool) {
        self.id = UUID()  // Generate a unique ID
        self.title = title
        self.isCompletedInt = isCompleted ? 1 : 0  // Convert Bool to Int
    }
}

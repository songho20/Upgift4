//
//  Item.swift
//  Upgift4
//
//  Created by Soniya Ghorbani on 2024-11-24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

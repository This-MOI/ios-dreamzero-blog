//
//  Item.swift
//  DreamzeroBlog
//
//  Created by dreamzero on 2025/10/24.
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

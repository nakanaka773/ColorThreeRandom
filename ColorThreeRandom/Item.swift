//
//  Item.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/04.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var backgroundred: CGFloat
    var backgroundgreen: CGFloat
    var backgroundblue: CGFloat
    
    init(timestamp: Date,backgroundred: CGFloat,backgroundgreen: CGFloat,backgroundblue: CGFloat) {
        self.timestamp = timestamp
        self.backgroundred = backgroundred
        self.backgroundgreen = backgroundgreen
        self.backgroundblue = backgroundblue
    }
}

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

    
    /*
    var accentred: CGFloat
    var accentgreen: CGFloat
    var accentblue: CGFloat
    
    var textred: CGFloat
    var textgreen: CGFloat
    var textblue: CGFloat
    */
    
    init(timestamp: Date,backgroundred: CGFloat,backgroundgreen: CGFloat,backgroundblue: CGFloat) {
        self.timestamp = timestamp
        self.backgroundred = backgroundred
        self.backgroundgreen = backgroundgreen
        self.backgroundblue = backgroundblue
        /*
         
         
        self.accentred = accentred
        self.accentgreen = accentgreen
        self.accentblue = accentblue
        
        self.textred = textred
        self.textgreen = textgreen
        self.textblue = textblue
         */
    }
}

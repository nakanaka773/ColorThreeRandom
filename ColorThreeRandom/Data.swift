import Foundation
import SwiftData

@Model
final class Data {
    var timestamp: Date
    
    var backgroundname: String
    var accentname: String
    var textname: String
    
    /*
    var accentred: CGFloat
    var accentgreen: CGFloat
    var accentblue: CGFloat
    
    var textred: CGFloat
    var textgreen: CGFloat
    var textblue: CGFloat
    */
    
    init(timestamp: Date,backgroundname: String, accentname: String, textname: String) {
        self.timestamp = timestamp
        self.backgroundname = backgroundname
        self.accentname = accentname
        self.textname = textname
    }
}

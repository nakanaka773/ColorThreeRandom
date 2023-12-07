import Foundation
import SwiftData

@Model
final class TodoItem {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.title = title
    }
}

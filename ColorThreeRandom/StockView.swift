import SwiftUI
import SwiftData

struct MyStockView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @Binding var showingModal: Bool
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                    count: 3)
    var body: some View {
        ScrollView {
            Button(action: {
                showingModal = false
            }, label: {
                Text("Button")
            })
                    LazyVGrid(columns: columns) {
                        ForEach(items) { item in
                            VStack {
                                Color(red: item.backgroundred/255, green: item.backgroundgreen/255, blue: item.backgroundblue/255)
                                    .frame(width: 80,height: 80)
                                Text("\(item.backgroundred)")
                                Text("\(item.backgroundgreen)")
                                Text("\(item.backgroundblue)")
                            }
                        }
                    }
                }
    }
}


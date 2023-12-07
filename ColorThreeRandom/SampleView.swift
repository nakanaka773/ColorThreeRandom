//
//  SampleView.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/05.
//

import SwiftUI
import SwiftData

struct SampleView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                    count: 3)
    var body: some View {
        ScrollView {
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

#Preview {
    SampleView()
        .modelContainer(for: Item.self)
}

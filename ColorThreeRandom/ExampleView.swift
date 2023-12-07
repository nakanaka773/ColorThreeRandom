//
//  ExampleView.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/04.
//

import SwiftUI
import SwiftData


struct ExampleView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                    count: 3)
    
    @State private var backGroundRed: CGFloat = 134
    @State private var backGroundGreen: CGFloat = 255
    @State private var backGroundBlue: CGFloat = 255
    
    var body: some View {
        ScrollView {
            
            VStack {
                Color(red: backGroundRed/255, green: backGroundGreen/255, blue: backGroundBlue/255)
                    .frame(width: 250,height: 230)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .onTapGesture {
                        backGroundRed = round(CGFloat.random(in: 1...255))
                        backGroundGreen = round(CGFloat.random(in: 1...255))
                        backGroundBlue = round(CGFloat.random(in: 1...255))
                }
         
                Button(action: {
                    addItem()
                }, label: {
                    Text("Button")
                })
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        Color(red: item.backgroundred/255, green: item.backgroundgreen/255, blue: item.backgroundblue/255)
                            .frame(width: 80,height: 80)
                    }
                }
            }
        }
    }
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(),backgroundred: backGroundRed,backgroundgreen: backGroundGreen,backgroundblue: backGroundBlue)
            modelContext.insert(newItem)
            do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }

        }
    }

    
}

#Preview {
    ExampleView()
        .modelContainer(for: Item.self)
}

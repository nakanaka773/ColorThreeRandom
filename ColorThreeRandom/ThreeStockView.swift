//
//  DataView.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/08.
//

import SwiftUI
import SwiftData


struct ThreeStockView: View {
    @Environment(\.modelContext) private var models
    @Query private var Datas: [Data]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                    count: 3)
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(Datas, id: \.self) { item in
                            ZStack{
                                Color(hex: item.backgroundname)
                                    .frame(width: 250*0.4,height: 230*0.4)
                                    .clipShape(RoundedRectangle(cornerRadius: 40*0.4))
                                Color(hex: item.accentname)
                                    .frame(width: 250*0.4,height: 80*0.4)
                                Text("Random Color")
                                    .foregroundStyle(Color(hex: item.textname))
                                    .font(.caption)
                            }
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {
                                    let indexSet = IndexSet(integer: Datas.firstIndex(of: item)!)
                                    deleteItems(offsets: indexSet)
                                }, label: {
                                    Text("削除する")
                                })
                            }))
                        
                        }
                    }
                }
            }
            .padding(.top, 30)
            .navigationTitle("Three Color Random")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }
       
        
    }
    private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    models.delete(Datas[index])
                }
            }
        }
}

#Preview {
    ThreeStockView()
        .modelContainer(for: Data.self)
}


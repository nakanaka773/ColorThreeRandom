//
//  DataView.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/08.
//

import SwiftUI
import SwiftData

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct DataView: View {
    @Environment(\.modelContext) private var models
    @Query private var Datas: [Data]
    
    @State private var backGroundRed: CGFloat = 124
    @State private var backGroundGreen: CGFloat = 25
    @State private var backGroundBlue: CGFloat = 64
    
    @State private var accentRed: CGFloat = 33
    @State private var accentGreen: CGFloat = 255
    @State private var accentBlue: CGFloat = 255
    
    @State private var textRed: CGFloat = 33
    @State private var textGreen: CGFloat = 255
    @State private var textBlue: CGFloat = 255
    
    
    fileprivate func randomColorFunc() -> Button<Text> {
        return Button(action: {
            backGroundRed = round(CGFloat.random(in: 1...255))
            backGroundGreen = round(CGFloat.random(in: 1...255))
            backGroundBlue = round(CGFloat.random(in: 1...255))
            
            accentRed = round(CGFloat.random(in: 1...255))
            accentGreen = round(CGFloat.random(in: 1...255))
            accentBlue = round(CGFloat.random(in: 1...255))
            
            textRed = round(CGFloat.random(in: 1...255))
            textGreen = round(CGFloat.random(in: 1...255))
            textBlue = round(CGFloat.random(in: 1...255))
        }, label: {
            Text("Button")
        })
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                randomColorFunc()
                ZStack{
                    Color(red: backGroundRed/255, green: backGroundGreen/255, blue: backGroundBlue/255)
                        .frame(width: 250,height: 230)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    Color(red: accentRed/255, green: accentGreen/255, blue: accentBlue/255)
                        .frame(width: 250,height: 80)
                    Text("Random Color")
                        .foregroundStyle(Color(red: textRed/255, green: textGreen/255, blue: textBlue/255))
                        .font(.title)
                }
                ForEach(Datas) { item in
                    VStack {
                        Text(item.accentname)
                            .foregroundColor(Color(hex: item.accentname))
                        ZStack{
                            Color(hex: item.backgroundname)
                                .frame(width: 250,height: 230)
                                .clipShape(RoundedRectangle(cornerRadius: 40))
                            Color(hex: item.accentname)
                                .frame(width: 250,height: 80)
                            Text("Random Color")
                                .foregroundStyle(Color(hex: item.textname))
                                .font(.title)
                        }
                        .scaleEffect(0.5) 
                        
                    }
                }
                Button(action: {
                    addItem()
                }, label: {
                    Text("Button")
                })
            }
            .navigationTitle("Three Color Random")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                   
                    } label: {
                        Image(systemName: "menubar.rectangle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addItem()
                    } label: {
                        Text("保存")
                    }
                }
            }
        }
       
        
    }
    
    
    private func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Data(timestamp: Date(),backgroundname: rgbToHex(red: Int(backGroundRed), green: Int(backGroundGreen), blue: Int(backGroundBlue)),accentname:rgbToHex(red: Int(accentRed), green: Int(accentGreen), blue: Int(accentBlue)),textname: rgbToHex(red: Int(textRed), green: Int(textGreen), blue: Int(textBlue)))
            models.insert(newItem)
            do {
                    try models.save()
                } catch {
                    print(error.localizedDescription)
                }

        }
    }
}

#Preview {
    DataView()
        .modelContainer(for: Data.self)
}


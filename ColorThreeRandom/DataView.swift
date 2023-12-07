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
    
    @State private var backGroundRed: CGFloat = 10
    @State private var backGroundGreen: CGFloat = 147
    @State private var backGroundBlue: CGFloat = 133
    
    @State private var accentRed: CGFloat = 231
    @State private var accentGreen: CGFloat = 229
    @State private var accentBlue: CGFloat = 60
    
    @State private var textRed: CGFloat = 488
    @State private var textGreen: CGFloat = 55
    @State private var textBlue: CGFloat = 166
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                    count: 3)
    
    
    @State private var showingAlert = false
    @State private var copyAlert = false
    
    var body: some View {
        NavigationStack{
            VStack{
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
                .padding(.top,50)
                .onTapGesture {
                    backGroundRed = round(CGFloat.random(in: 0...255))
                    backGroundGreen = round(CGFloat.random(in: 0...255))
                    backGroundBlue = round(CGFloat.random(in: 0...255))
                    
                    accentRed = round(CGFloat.random(in: 0...255))
                    accentGreen = round(CGFloat.random(in: 0...255))
                    accentBlue = round(CGFloat.random(in: 0...255))
                    
                    textRed = round(CGFloat.random(in: 0...255))
                    textGreen = round(CGFloat.random(in: 0...255))
                    textBlue = round(CGFloat.random(in: 0...255))
                }
                TabView{
                    VStack {
                        HStack {
                            Text(rgbToHex(red:Int(backGroundRed),green:Int(backGroundGreen),blue:Int(backGroundBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {
                                UIPasteboard.general.string =  rgbToHex(red:Int(backGroundRed),green:Int(backGroundGreen),blue:Int(backGroundBlue))
                                copyAlert = true
                            }, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            .alert(isPresented: $copyAlert) {
                                        Alert(title: Text("カラーコードをコピーしました"))
                                    }
                            Spacer()
                        }
                        .frame(width: 350,height: 30)
                        SliderView(sliderVal: $backGroundRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $backGroundGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $backGroundBlue,text: "B")
                            .accentColor(.blue)
                    }
                    .frame(height: 350)
                    .background(Color(red: backGroundRed/255, green: backGroundGreen/255, blue: backGroundBlue/255))
                    .tabItem {
                        Image(systemName: "rectangle")
                        Text("background")
                    }
                    VStack {
                        HStack {
                            Text(rgbToHex(red:Int(accentRed),green:Int(accentGreen),blue:Int(accentBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {
                                UIPasteboard.general.string = rgbToHex(red:Int(accentRed),green:Int(accentGreen),blue:Int(accentBlue))
                                copyAlert = true
                            }, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            .alert(isPresented: $copyAlert) {
                                        Alert(title: Text("カラーコードをコピーしました"))
                                    }
                            Spacer()
                        }
                        .frame(width: 350,height: 30)
                        SliderView(sliderVal: $accentRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $accentGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $accentBlue,text: "B")
                            .accentColor(.blue)
                    }
                    .frame(height: 350)
                    .background(Color(red: accentRed/255, green: accentGreen/255, blue: accentBlue/255)
)
                    .tabItem {
                        Image(systemName: "rectangle")
                        Text("accent")
                    }

                    VStack {
                        HStack {
                            Text(rgbToHex(red:Int(textRed),green:Int(textGreen),blue:Int(textBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {
                                UIPasteboard.general.string = rgbToHex(red: Int(textRed), green:Int(textGreen), blue: Int(textBlue))
                                copyAlert = true
                            }, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            .alert(isPresented: $copyAlert) {
                                        Alert(title: Text("カラーコードをコピーしました"))
                                    }
                            Spacer()
                        }
                        .frame(width: 350,height: 30)
                        SliderView(sliderVal: $textRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $textGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $textBlue,text: "B")
                            .accentColor(.blue)
                    }
                    .frame(height: 350)
                    .background((Color(red: textRed/255, green: textGreen/255, blue: textBlue/255)))
                    .tabItem {
                        Image(systemName: "rectangle")
                        Text("text")
                    }
                    

                }
                
            }
            .navigationTitle("Three Color Random")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        ThreeStockView()
                    } label: {
                        Image(systemName: "menubar.rectangle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addItem()
                        self.showingAlert = true
                    } label: {
                        Text("保存")
                    }
                    .alert(isPresented: $showingAlert) {
                                Alert(title: Text("色を保存しました。"))
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


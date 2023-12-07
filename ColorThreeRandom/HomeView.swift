//
//  EditColorView.swift
//  MyColor
//
//  Created by 平山奈々海 on 2023/11/27.
//

import SwiftUI
import SwiftData

struct EditColorView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var showingModal = false
    @State private var backGroundRed: CGFloat = 1
    @State private var backGroundGreen: CGFloat = 255
    @State private var backGroundBlue: CGFloat = 255
    @State private var backGroundOpacity: CGFloat = 1
    
    @State private var accentRed: CGFloat = 33
    @State private var accentGreen: CGFloat = 255
    @State private var accentBlue: CGFloat = 255
    @State private var accentOpacity: CGFloat = 1
    
    @State private var textRed: CGFloat = 33
    @State private var textGreen: CGFloat = 255
    @State private var textBlue: CGFloat = 255
    @State private var textOpacity: CGFloat = 1
    

    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                ZStack{
                    Color(red: backGroundRed/255, green: backGroundGreen/255, blue: backGroundBlue/255, opacity: backGroundOpacity)
                        .frame(width: 250,height: 230)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    Color(red: accentRed/255, green: accentGreen/255, blue: accentBlue/255,opacity: accentOpacity)
                        .frame(width: 250,height: 80)
                    Text("Random Color")
                        .foregroundStyle(Color(red: textRed/255, green: textGreen/255, blue: textBlue/255,opacity:textOpacity))
                        .font(.title)
                }
                .onTapGesture {
                    backGroundRed = round(CGFloat.random(in: 1...255))
                    backGroundGreen = round(CGFloat.random(in: 1...255))
                    backGroundBlue = round(CGFloat.random(in: 1...255))
                  
                    
                    accentRed = round(CGFloat.random(in: 1...255))
                    accentGreen = round(CGFloat.random(in: 1...255))
                    accentBlue = round(CGFloat.random(in: 1...255))
                    
                    
                    textRed = round(CGFloat.random(in: 1...255))
                    textGreen = round(CGFloat.random(in: 1...255))
                    textBlue = round(CGFloat.random(in: 1...255))
                }
                
                TabView{
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text(rgbToHex(red:Int(backGroundRed),green:Int(backGroundGreen),blue:Int(backGroundBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {
                                UIPasteboard.general.string = rgbToHex(red:Int(backGroundRed),green:Int(backGroundGreen),blue:Int(backGroundBlue))
                            }, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            Spacer()
                        }
                        .frame(width: 350,height: 60)
                        SliderView(sliderVal: $backGroundRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $backGroundGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $backGroundBlue,text: "B")
                            .accentColor(.blue)
                            .padding(.bottom, 40)
                    }
                    .frame(height: 350)
                    .background(Color(red: backGroundRed/255, green: backGroundGreen/255, blue: backGroundBlue/255, opacity: backGroundOpacity))
                    
                    .tabItem {
                        Image(systemName: "rectangle")
                        Text("background")
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Text(rgbToHex(red:Int(accentRed),green:Int(accentGreen),blue:Int(accentBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {
                                UIPasteboard.general.string = rgbToHex(red:Int(accentRed),green:Int(accentGreen),blue:Int(accentBlue))
                            }, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            Spacer()
                        }
                        .frame(width: 350,height: 60)
                        SliderView(sliderVal: $accentRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $accentGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $accentBlue,text: "B")
                            .accentColor(.blue)
                            .padding(.bottom, 40)
                    }
                    .frame(height: 350)
                    .background(Color(red: accentRed/255, green: accentGreen/255, blue: accentBlue/255,opacity: accentOpacity)
)
                    .tabItem {
                        Image(systemName: "rectangle")
                        Text("accent")
                    }

                    VStack {
                        Spacer()
                        HStack {
                            Text(rgbToHex(red:Int(textRed),green:Int(textGreen),blue:Int(textBlue)))
                                .font(.title)
                                .padding(.leading,20)
                                .foregroundStyle(.white)
                            Button(action: {}, label: {
                                Image(systemName: "doc.on.doc")
                            })
                            Spacer()
                        }
                        .frame(width: 350,height: 60)
                        SliderView(sliderVal: $textRed,text: "R")
                            .accentColor(.red)
                        SliderView(sliderVal: $textGreen,text: "G")
                            .accentColor(.green)
                        SliderView(sliderVal: $textBlue,text: "B")
                            .accentColor(.blue)
                            .padding(.bottom, 40)
                    }
                    .frame(height: 350)
                    .background((Color(red: textRed/255, green: textGreen/255, blue: textBlue/255,opacity:textOpacity)))
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
                    Button {
                        self.showingModal.toggle()
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
            .fullScreenCover(isPresented: $showingModal) {
                MyStockView(showingModal: $showingModal)
            }
            
        }
    }
    private func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        return String(format: "#%02X%02X%02X", red, green, blue)
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
    EditColorView()
        .modelContainer(for: Item.self)
}

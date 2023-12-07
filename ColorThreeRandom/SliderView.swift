//
//  SliderView.swift
//  MyColor
//
//  Created by 平山奈々海 on 2023/12/02.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderVal : CGFloat
    @State var text : String
    var body: some View {
            Slider(
                value: $sliderVal,
                in: 0...255,
                step: 1,
                minimumValueLabel:
                    Text(text)
                    .fontWeight(.bold)
                    .font(.title)
                ,
                //CGFloatで少数が表示されるため、整数表示へ
                maximumValueLabel:
                    Text("\(Int(sliderVal))")
                    .font(.title2)
                ,
                label: { EmptyView() }
                
            )
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
        
        
    }
}


#if DEBUG
struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderVal: .constant(123), text: "サンプルテキスト")
    }
}
#endif

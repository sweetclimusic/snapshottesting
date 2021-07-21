//
//  CardView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//
//

import SwiftUI
import VisualEffects

// Using ViewModifier for code reuse to style 'cards' within the app
struct CardBackgroundModifier: ViewModifier { //where S: ShapeStyle{
    //let shapeStyle:  S
    let cornerRadius:CGFloat = 30
    var color: Color = .iwDarkGrey
    
    func body(content: Content) -> some View {
        return content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white.opacity(0.2))
                .background(Color.iwDarkGrey).opacity(0.2)
                .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                .shadow(color: .iwCoolGrey.opacity(0.2), radius: cornerRadius * 2,x:0,y:30)
        )
        .cornerRadius(cornerRadius)
        .padding(.horizontal, 40)
    }
}

struct CardUIView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World").modifier(CardBackgroundModifier())
    }
}

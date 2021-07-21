//
//  IconView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 09/06/2021.
//

import SwiftUI
import VisualEffects

struct IconView: View {
    var iconImage: Image = Image(systemName: "envelope.open.fill")
    @Binding var currentlyEditing: Bool
    var body: some View {
        ZStack{
            VisualEffectBlur(blurStyle: .dark) {
                //Mark: Glow effect when editing
                if currentlyEditing {
                    AngularGradient(
                        gradient: Gradient(colors: Color.overlayColors2),
                        center: .center,
                        angle: .degrees(0))
                        .blur(radius: 10.0)
                }
                Color.dark
                    .cornerRadius(.iconCornerRadius)
                    .opacity(0.8)
                    .blur(radius: 3.0)
            }
        }
        .cornerRadius(.iconCornerRadius)
        .overlay(
            ZStack{
                RoundedRectangle(cornerRadius: .iconCornerRadius)
                    .stroke(Color.white,lineWidth: 1.0)
                    .blendMode(.overlay)
                iconImage
                    .modifier(linearGradientModifier(colors: Color.overlayColors1))
                    .font(.system(size: 17, weight: .medium))
            }
        )
        .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding([.vertical], 8)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(currentlyEditing: .constant(true))
    }
}

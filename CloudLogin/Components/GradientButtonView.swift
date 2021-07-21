//
//  GradientButtonView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 09/06/2021.
//
//

import SwiftUI

struct GradientButton: View {
    var labelText: String = ""
    var gradient: [Color] = Color.overlayColors1
    var frameHeight: CGFloat = 50.0
    var body: some View {
        Button(action: {
            print("time to sign up")
            hideKeyboard()
        }, label: {
            ZStack {
                AngularGradient(
                    gradient: Gradient(colors: gradient),
                    center: .center, angle: .degrees(0))
                    
                    .blendMode(.overlay)
                    .blur(radius: 8.0)
                    .mask(
                        RoundedRectangle(cornerRadius: .buttonCornerRadius)
                            .frame(height: frameHeight)
                            
                            .blur(radius: 8.0)
                    )
                //Gradient Text does not expand to fill the entire Angular Gradient space when declared on it's own. specify maxWidth as infinity to avoid making a geometry reader
                GradientText(labelText)
                    .font(.title3)
                    .frame( height: frameHeight)
                    .frame(maxWidth: .infinity)
                    .background(Color.dark)
                    .overlay(
                        RoundedRectangle(cornerRadius: .buttonCornerRadius)
                            .stroke(Color.white, lineWidth: 1)
                            .blendMode(.normal)
                            .opacity(0.7)
                    ).cornerRadius(.buttonCornerRadius).aspectRatio(contentMode: .fill)
            }
            .frame(height: frameHeight)
            
            
        })
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(labelText: "test")
    }
}

//
//  AppStyle.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//
//

import SwiftUI

extension Color {
    static let iwOrange = Color("iw-orange")
    static let iwCoolGrey = Color("iw-coolgrey")
    static let iwGrey = Color("iw-grey")
    static let iwDarkGrey = Color("iw-darkgrey")
    static let iwCoolGrey70 = Color("iw-coolgrey").opacity(0.7)
    static let bgBlue = Color("bg-blue")
    static let bgLightBlue = Color("bg-light-blue")
    static let bgPink = Color("bg-pink")
    static let bgLightPink = Color("bg-light-pink")
    static let dark = Color("dark")
    static let overlayColors1: [Color] = [.bgBlue, .bgLightBlue, .bgPink, .bgLightPink]
    static let overlayColors2: [Color] = [.bgBlue, .purple, .pink, iwOrange]
    static let overlayColors3: [Color] = [.purple, .pink, iwOrange]
}

extension CGFloat {
    static let buttonCornerRadius: CGFloat = 16.0
    static let minEdgePadding: CGFloat = 16.0
    static let iconCornerRadius: CGFloat = 12.0
}

struct subHeadingModifier: ViewModifier {
    func body(content: Content) -> some View {
            content.font(.subheadline)
                    .foregroundColor(.iwCoolGrey70)
    }
}

struct footNoteModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.footnote)
                .foregroundColor(.iwCoolGrey70)
    }
}

struct linearGradientModifier: ViewModifier {
    var colors: [Color]

    init(colors gradientColors: [Color]){
        colors = gradientColors
    }

    func body(content: Content) -> some View {
        content
        .overlay(
                LinearGradient(
                        gradient: Gradient(colors: colors),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
        .mask(content)
    }
}

struct GradientText: View {
    var text: String = ""

    init(_ text: String){
        self.text = text
    }

    var body: some View {
        Text(text).modifier(linearGradientModifier(colors: Color.overlayColors2))
    }
}

//
//  PauseView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 08/06/2021.
//
//

import SwiftUI

struct PauseUIView: View {
    var body: some View {
        ZStack {
            Image("tealtextile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, alignment:  .center)
                .scaleEffect()
                .opacity(0.7)
                .padding(.horizontal, .minEdgePadding)
        }
    }
}

struct PauseUIView_Previews: PreviewProvider {
    static var previews: some View {
        PauseUIView()
    }
}

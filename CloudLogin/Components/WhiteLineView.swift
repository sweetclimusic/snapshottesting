//
//  WhiteLineView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 15/06/2021.
//

import SwiftUI

struct WhiteLineView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .buttonCornerRadius)
            .frame(height: 1)
            .foregroundColor(Color.init(white: 0.8))
    }
}

struct WhiteLineView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteLineView()
    }
}

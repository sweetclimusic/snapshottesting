//
//  AccountContextSwitchView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 19/07/2021.
//

import SwiftUI

struct AccountContextSwitchView: View {
    @EnvironmentObject var store: SignUpStateStore
    var body: some View {
        HStack(spacing: 4) {
            Text(store.signupScreen ?
                    "Do you have an existing cloud account?" :
                    "Sign up for a new cloud account."
            )
            .modifier(footNoteModifier())
            GradientText(store.signupScreen ? "Sign In" : "Sign Up")
                .font(.footnote.bold())
        }.frame(alignment: .topLeading)
    }
}

struct AccountContextSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        AccountContextSwitchView().environmentObject(SignUpStateStore())
    }
}

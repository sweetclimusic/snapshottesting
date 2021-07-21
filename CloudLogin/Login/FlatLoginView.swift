//
//  FlatLoginView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//
//

import SwiftUI

struct FlatLoginView: View {
    @ObservedObject var viewModel: FlatLoginViewModel
    
    init(viewModel: FlatLoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12.0) {
                IconView(iconImage: Image(systemName: "envelope.open.fill"), currentlyEditing: $viewModel.editingEmailTextfield)
                TextField("Email", text: $viewModel.email, onEditingChanged: { isEditing in
                    //Toggle field states of IconView
                    viewModel.editingEmailTextfield = isEditing
                    viewModel.editingPasswordTextfield = false
                })
                .colorScheme(.dark)
                .foregroundColor(Color.white.opacity(0.7))
                .autocapitalization(.none)
                .textContentType(.emailAddress)
                
            }.frame(height: 50)
            .padding(8)
            WhiteLineView()
            HStack(spacing: 12.0) {
                IconView(iconImage: Image(systemName: "key.fill"), currentlyEditing: $viewModel.editingPasswordTextfield)
                SecureField("Password", text: $viewModel.password)
                    .colorScheme(.dark)
                    .foregroundColor(Color.white.opacity(0.7))
                    .autocapitalization(.none)
                    .textContentType(.password)
                    .onTapGesture {
                        //Toggle field states of IconView
                        viewModel.editingEmailTextfield = false
                        viewModel.editingPasswordTextfield = true
                    }
            }.frame(height: 50)
            .padding(8)
            
        }.overlay(RoundedRectangle(cornerRadius: .buttonCornerRadius)
                    .stroke(Color.init(white: 0.8),lineWidth: 1.0)
                    .blendMode(.overlay))
        .background(Color.iwGrey)
        .cornerRadius(.buttonCornerRadius)
        .opacity(0.8)
    }
}

class FlatUIView_Previews: PreviewProvider {
    static var previews: some View {
        FlatLoginView(viewModel: FlatLoginViewModel())
    }
}

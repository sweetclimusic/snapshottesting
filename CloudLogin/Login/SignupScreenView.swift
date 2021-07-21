//
//  SignupScreenView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//

import AuthenticationServices
import SwiftUI

struct AppleSignInView: View {
    var body: some View {
        SignInWithAppleButton(.signUp,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                print(result)
            }
        ).signInWithAppleButtonStyle(.black)
        .cornerRadius(.buttonCornerRadius)
        .frame(height: 50)
    }
}

struct AppleSignUpView: View {
    var body: some View {
        SignInWithAppleButton(.signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                print(result)
            }
        ).signInWithAppleButtonStyle(.black)
        .cornerRadius(.buttonCornerRadius)
        .frame(height: 50)
    }
}

struct SignupScreenView: View {
    //@Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: SignUpStateStore
    var appActive: Bool = true
    var signupScreen: Bool = true
    let pauseView = PauseUIView()
    let appleSignUp = AppleSignInView()
    let appleSignIn = AppleSignUpView()
    
    var body: some View {
        ZStack {
            if store.appActiveState == false {
                pauseView
            } else {
                Image(store.signupScreen ? "tealtextile" : "purpletextile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        hideKeyboard()
                    }
                    .accessibility(identifier: "backgroundImage")
                VStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(store.signupScreen ? "Sign Up" : "Sign In")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            Text("Access to your AWS cloud date")
                                .modifier(subHeadingModifier())
                            FlatLoginView(viewModel: FlatLoginViewModel())
                            GradientButton(labelText: store.signupScreen ? "Sign Up" : "Sign In")
                            
                            
                            // MARK: Switch login context
                            let prefix: String = store.signupScreen ?
                                "By signing up you are Agreeing" :
                                "By signing in you are Adhering"
                            Text("\(prefix)  to our Privacy Policy and T&Cs")
                                .modifier(footNoteModifier())
                            //Switch context
                            Button(action: {
                                print("Switching the action")
                                store.signupScreen.toggle()
                            }) {
                                AccountContextSwitchView()
                            }.accessibility(identifier:     "signUpScreenContextSwitcher")
                            
                            RoundedRectangle(cornerRadius: .buttonCornerRadius)
                                .frame(height: 1)
                                .foregroundColor(Color.init(white: 0.8))
                            if store.signupScreen {
                                appleSignUp
                            } else {
                                appleSignIn
                            }
                        }.padding(.minEdgePadding)
                    }.modifier(CardBackgroundModifier())
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 52, alignment: .bottom)
                        .opacity(0.7)
                        .padding(.horizontal)
                        .padding(.top, 16) //change to percentage if we have a @EnviornmentObject window
                }
            }
        }
    }
}

class LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreenView().environmentObject(SignUpStateStore())
    }
}

//
//  CloudLoginApp.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//

import SwiftUI

@main
struct CloudLoginApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var signUpStateStore =  SignUpStateStore()
    var body: some Scene {
        WindowGroup {
            SignupScreenView().environmentObject(signUpStateStore)
        }.onChange(of: scenePhase){ phase in
            if phase == .active {
                self.signUpStateStore.appActiveState = true
            } else {
                self.signUpStateStore.appActiveState = false
            }
        }
    }
}

class SignUpStateStore: ObservableObject {
    @Published var appActiveState: Bool = true
    @Published var signupScreen: Bool = true
}

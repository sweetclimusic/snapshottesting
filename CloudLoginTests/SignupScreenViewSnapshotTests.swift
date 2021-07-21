//
//  SignupScreenViewSnapshotTests.swift
//  CloudLoginTests
//
//  Created by Ashlee Muscroft on 15/07/2021.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import CloudLogin

class SignupScreenViewSnapshotTests: XCTestCase {
    var sut: UIViewController!
    var stateStorage: SignUpStateStore!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stateStorage = SignUpStateStore()
        UIView.setAnimationsEnabled(false)
        // record new test images by setting to true
        isRecording = false
    }

    func testSignUpView() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //MARK: uncomment to generate new UI images for assertion.isRecording = false
        let signupScreenView =  SignupScreenView().environmentObject(stateStorage)
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneSe))
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneXsMax))
    }
    
    func testSignInView() throws {
        //simulate user click to sign in view
        stateStorage.signupScreen = false
        let signupScreenView = SignupScreenView().environmentObject(stateStorage)
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneSe))
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneXsMax))
        /// At the time of writing iPhone is XS max is the latest built in device support for the library. to test the latest device, run the Unit test against that device in the simulator. The generated default images will be to the dimentions of that device.
        // MARK: However problematic if ran on another developers machine and there defualt simulator isn't iPhone12
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image,named: "iPhone12")
    }
    
    func testPauseView() throws {
        //app is inactive ensure privacy view is initialized
        stateStorage.appActiveState = false
        let signupScreenView = SignupScreenView().environmentObject(stateStorage)
        // Here we are writing to the defiened @Evironment scenePhase with WritableKey<Type, value> a SwiftUI internal type
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneSe))
        assertSnapshot(matching: signupScreenView.toViewController(), as: .image(on: .iPhoneXsMax))
    }
}

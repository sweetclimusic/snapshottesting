//
//  SignUpScreeniOSSnapshotTests.swift
//  CloudLoginUITests
//
//  Created by Ashlee Muscroft on 20/07/2021.
//

import SwiftUI
import XCTest
import FBSnapshotTestCase // fails to import FBSnapshotTestCaseCore whici has been defined in the librarys Support/SwiftSupport.swift

@testable import CloudLogin

class SignUpScreeniOSSnapshotTests: FBSnapshotTestCase {
    var sut: UIViewController!
    var stateStorage: SignUpStateStore!
    
    override func setUp() {
        super.setUp()
        // recordMode is the global attribute for iOSSnapshotTest to capture source images for assertions. On inital run of iOSSnapshotTest UI Test, set recordMode to true to create the reference images for all further assertions.
        // MARK: set to true to generate new UI images for assertion.
        self.recordMode = false
        stateStorage = SignUpStateStore()
        let view = SignupScreenView().environmentObject(stateStorage)
        sut = view.toViewController()
    }
    
    override func tearDownWithError() throws {
        stateStorage = SignUpStateStore()
    }

    func testSignUpView() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Since this is a SWIFTUI project, we have to get the view from the UIWindw so that SnapshotVerifyView has a rendered view
        FBSnapshotVerifyView(sut.view)
    }
    
    func testSignInView() throws {
        stateStorage.signupScreen = false
        FBSnapshotVerifyView(sut.view)
    }
    
    func testPauseView() throws {
        stateStorage.appActiveState = false
        FBSnapshotVerifyView(sut.view)
    }

}


//
//  AccountContextSwitchViewSnapshotTests.swift
//  CloudLoginTests
//
//  Created by Ashlee Muscroft on 19/07/2021.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import CloudLogin

class AccountContextSwitchViewSnapshotTests: XCTestCase {
    var sut: UIViewController!
    var stateStorage: SignUpStateStore!
    let viewSize = CGSize(width: 340, height: 150)
    //capture the dev's current simulator device manually
    var deviceName: String = "iPhone12"
    
    override func setUpWithError() throws {
        UIView.setAnimationsEnabled(false)
        isRecording = false
        stateStorage = SignUpStateStore()
        let view = AccountContextSwitchView().environmentObject(stateStorage)
        sut = view.referenceFrame(size: viewSize).toViewController(size: viewSize)
        
    }
    
    override func tearDownWithError() throws {
        stateStorage = SignUpStateStore()
    }


    //MARK: test a region of a view by specifiying the size of the image.
    func testAccountContextSwitchSignupView() throws {
        // Render at a certain size.
        assertSnapshot(matching: sut, as: .image(on: .iPhoneSe, size: viewSize))
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax,size: viewSize))
        assertSnapshot(matching: sut, as: .image(size: viewSize))
    }
    
    //MARK: test a region of a view by specifiying the size of the image.
    func testAccountContextSwitchSignInView() throws {
        // Render at a certain size.
        stateStorage.signupScreen = false
        assertSnapshot(matching: sut, as: .image(on: .iPhoneSe, size: viewSize))
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax,size: viewSize))
        assertSnapshot(matching: sut, as: .image(size: viewSize))
    }
    
    //MARK: test text scalability as a suspected 30% of iOS users adjust their device text size.
    func testAccountContextSwitchAccessibilitySizes() throws {
        // Render at a certain size.
        for contentSize in ContentSizeCategory.allCases {
            // redifine sut, adjusting text size by built in accessibility text sizes
            sut = AccountContextSwitchView()
                .environmentObject(stateStorage)
                .environment(\.sizeCategory, contentSize)
                .referenceFrame(size: viewSize)
                .toViewController()
            assertSnapshot(matching: sut,
                           as: .image(on: .iPhoneSe,
                                      size: viewSize),
                           named: "\(contentSize)-iPhoneSe",
                           record: true)
            assertSnapshot(matching: sut,
                           as: .image(on: .iPhoneXsMax,
                                      size: viewSize),
                           named: "\(contentSize)-iPhoneXsMax",
                           record: true)
            assertSnapshot(matching: sut,
                           as: .image(size: viewSize),
                           named: "\(contentSize)-\(String(describing: deviceName))",
                           record: true)
        }
    }

}

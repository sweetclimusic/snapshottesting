//
//  SwiftUIView.swift
//  CloudLoginTests
//
//  Created by Ashlee Muscroft on 15/07/2021.
//

import SwiftUI

// MARK: adding an extenstion to SwiftUI view to allow testing in Snapshoptesting due to only supporting
// CALayer, UIImage and UIView re: https://www.pointfree.co/episodes/ep86-swiftui-snapshot-testing
extension SwiftUI.View {
    func toViewController(size referenceSize: CGSize? = nil) -> UIViewController {
        let vc = UIHostingController(rootView: self)
        if let size = referenceSize {
            vc.view.frame = CGRect(origin: .zero, size: size)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                                            vc.view.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                            vc.view.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 0)
            ])
        } else {
            vc.view.frame = UIScreen.main.bounds
        }
        
        return vc
    }
    
    func referenceFrame( size referenceSize: CGSize) -> some View {
            self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}

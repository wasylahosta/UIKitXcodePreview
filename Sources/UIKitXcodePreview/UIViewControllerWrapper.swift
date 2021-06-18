//
//  UIViewControllerWrapper.swift
//
//  Created by Vasyl Ahosta on 16.06.2021.
//

import UIKit
import SwiftUI

struct UIViewControllerWrapper: UIViewControllerRepresentable, UIViewLayoutCompatible {
    
    var uiView: UIView {
        viewController.view
    }
    let layout: UIViewLayout?
    private let viewController: UIViewController
    
    init(_ viewController: UIViewController, _ layout: UIViewLayout?) {
        self.viewController = viewController
        self.layout = layout
    }
    
    // MARK: UIViewControllerRepresentable
    
    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

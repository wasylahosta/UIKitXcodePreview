//
//  UIViewWrapper.swift
//  
//  Created by Vasyl Ahosta on 16.06.2021.
//

import UIKit
import SwiftUI

struct UIViewWrapper: UIViewRepresentable, UIViewLayoutCompatible {
    
    let uiView: UIView
    let layout: UIViewLayout?
    
    init(_ uiView: UIView, _ layout: UIViewLayout?) {
        self.uiView = uiView
        self.layout = layout
    }
    
    // MARK: UIViewRepresentable
    
    func makeUIView(context: Context) -> UIView {
        uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

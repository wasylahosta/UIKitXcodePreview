//
//  UIViewLayout.swift
//
//  Created by Vasyl Ahosta on 16.06.2021.
//

import UIKit
import SwiftUI

/// Frame calculation strategy for UIView
public enum UIViewLayout: Equatable {
 
    /// Center the view in a frame fitting its content.
    case sizeThatFits
    
    /// Center the view in a frame with fixed width or height or both.
    case fixed(width: CGFloat = 0, height: CGFloat = 0)
    
    func systemLayoutSize(for view: UIView) -> CGSize? {
        view.layoutIfNeeded()
        let size: CGSize
        switch self {
        case .sizeThatFits:
            size = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        case .fixed(let width, let height):
            size = view.systemLayoutSizeFitting(CGSize(width: width, height: height),
                                                withHorizontalFittingPriority: width == 0 ? .defaultLow : .required,
                                                verticalFittingPriority: height == 0 ? .defaultLow : .required)
            
        }
        return size != .zero ? size : view.intrinsicContentSize
    }
}

protocol UIViewLayoutCompatible {
    
    var layout: UIViewLayout? { get }
    var uiView: UIView { get }
}

extension UIViewLayoutCompatible where Self: View {
    
    func setLayoutBasedSize() -> some View {
        if let size = layout?.systemLayoutSize(for: uiView) {
            return frame(width: size.width, height: size.height, alignment: .center)
        } else {
            return frame(alignment: .center)
        }
    }
}

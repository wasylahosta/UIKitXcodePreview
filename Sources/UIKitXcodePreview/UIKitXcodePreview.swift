//
//  UIKitXcodePreview.swift
//
//  Created by Vasyl Ahosta on 16.06.2021.
//

import UIKit
import SwiftUI

extension UIView {
    
    /// Converts  a `UIView` to a SwiftUI ` View`
    /// - Parameters:
    ///   - layout: Defines size of the resulting view. The default value is ``UIViewLayout/sizeThatFits``.
    /// - Returns: `UIView` wrapped in a SwiftUI `View`
    public func swiftUIView(layout: UIViewLayout? = .sizeThatFits) -> some View {
        UIViewWrapper(self, layout)
            .setLayoutBasedSize()
    }
    
    /// Converts a `UIView` to a SwiftUI `View` and adds `.previewLayout(.sizeThatFits)` modifier
    /// - Parameters:
    ///   - layout: Defines size of the resulting view. The default value is ``UIViewLayout/sizeThatFits``.
    /// - Returns: `UIView` wrapped in a SwiftUI `View` with `.previewLayout(.sizeThatFits)` modifier
    public func swiftUIPreview(layout: UIViewLayout? = .sizeThatFits) -> some View {
        swiftUIView(layout: layout)
            .previewLayout(.sizeThatFits)
    }
}

extension UIViewController {
    
    /// Converts  a `UIViewController` to a SwiftUI ` View`
    /// - Parameters:
    ///   - layout: Defines size of the resulting view. The default value is `nil`.
    /// - Returns: `UIViewController` wrapped in a SwiftUI `View`
    public func swiftUIView(layout: UIViewLayout? = nil) -> some View {
        UIViewControllerWrapper(self, layout)
            .setLayoutBasedSize()
    }
    
    /// Converts  a `UIViewController` to a SwiftUI ` View` and
    /// adds `.previewLayout(.sizeThatFits)` modifier if `layout != nil`
    /// - Parameters:
    ///   - layout: Defines size of the resulting view. The default value is `nil`.
    /// - Returns: `UIViewController` wrapped in a SwiftUI `View` with `.previewLayout(.sizeThatFits)` modifier if needed
    public func swiftUIPreview(layout: UIViewLayout? = nil) -> some View {
        swiftUIView(layout: layout)
            .if(layout != nil) { view in
                view.previewLayout(.sizeThatFits)
            }
    }
}

extension View {
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

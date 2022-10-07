//
//  UIView.swift
//  Edusoft
//
//  Created by congnguyen on 11/28/19.
//  Copyright © 2019 congnguyen. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Properties
public extension UIView {

    /// SwifterSwift: Border color of view; also inspectable from Storyboard.
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            // Fix React-Native conflict issue
            guard String(describing: type(of: color)) != "__NSCFType" else { return }
            layer.borderColor = color.cgColor
        }
    }

    /// SwifterSwift: Border width of view; also inspectable from Storyboard.
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// SwifterSwift: Corner radius of view; also inspectable from Storyboard.
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
//            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }

    /// SwifterSwift: Height of view.
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }

    /// SwifterSwift: Check if view is in RTL format.
    var isRightToLeft: Bool {
        if #available(iOS 10.0, *, tvOS 10.0, *) {
            return effectiveUserInterfaceLayoutDirection == .rightToLeft
        } else {
            return false
        }
    }

    /// SwifterSwift: Shadow color of view; also inspectable from Storyboard.
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    /// SwifterSwift: Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    /// SwifterSwift: Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    /// SwifterSwift: Shadow radius of view; also inspectable from Storyboard.
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    /// SwifterSwift: Size of view.
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }

    /// SwifterSwift: Get view's parent view controller
    var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    /// SwifterSwift: Width of view.
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }

    /// SwifterSwift: x origin of view.
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }

    /// SwifterSwift: y origin of view.
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

}

extension UIView {

    @discardableResult
    func addHeightConstraint(_ constant: CGFloat,
                             relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: relation,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: constant
        )
        addConstraint(constraint)

        return constraint

    }

    @discardableResult
    func addWidthConstraint(_ constant: CGFloat,
                            relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: relation,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: constant
        )
        addConstraint(constraint)

        return constraint

    }

    @discardableResult
    func addSizeRatioConstraint( _ ratio: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: ratio, constant: 0
        )
        addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func centerXAxisToSuperView(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: superview,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        superview.addConstraint(constraint)

        return constraint

    }

    @discardableResult
    func centerYAxisToSuperView(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: superview,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        superview.addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func centerToSuperView(_ horizontalConstant: CGFloat = 0, _ verticalConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        guard
            let a = centerXAxisToSuperView(horizontalConstant),
            let b = centerYAxisToSuperView(verticalConstant) else { return [] }
        return [a, b]
    }

    @discardableResult
    func stickEdgesToSuperView(edges: [NSLayoutConstraint.Attribute] = [.leading, .trailing, .top, .bottom],
                               spaces: [CGFloat] = [0.0, 0.0, 0.0, 0.0]) -> [NSLayoutConstraint] {
        guard let superview = superview, edges.count <= spaces.count else { return [] }

        var constraints: [NSLayoutConstraint] = []
        for (index, edge) in edges.enumerated() {
            switch edge {
            case .top, .topMargin, .leading, .leadingMargin:
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: edge,
                    relatedBy: .equal,
                    toItem: superview,
                    attribute: edge,
                    multiplier: 1.0,
                    constant: spaces[index]
                )
                superview.addConstraint(constraint)
                constraints.append(constraint)
            case .bottom, .bottomMargin, .trailing, .trailingMargin:
                let constraint = NSLayoutConstraint(
                    item: superview,
                    attribute: edge,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: edge,
                    multiplier: 1.0,
                    constant: spaces[index]
                )
                superview.addConstraint(constraint)
                constraints.append(constraint)
            default:
                break
            }
        }

        return constraints
    }

    @discardableResult
    func stickToTopView(topView: UIView,
                        relation: NSLayoutConstraint.Relation = .equal,
                        space: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: relation,
            toItem: topView,
            attribute: topView == superview ? .top : .bottom,
            multiplier: 1.0,
            constant: space)
        superview.addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func stickToBottomView(bottomView: UIView,
                           relation: NSLayoutConstraint.Relation = .equal,
                           space: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: bottomView,
            attribute: bottomView == superview ? .bottom : .top,
            relatedBy: relation,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: space)
        superview.addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func stickToLeftView(leftView: UIView,
                         relation: NSLayoutConstraint.Relation = .equal,
                         space: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: relation,
            toItem: leftView,
            attribute: leftView == superview ? .leading : .trailing,
            multiplier: 1.0,
            constant: space)
        superview.addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func stickToRightView(rightView: UIView,
                          relation: NSLayoutConstraint.Relation = .equal,
                          space: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = NSLayoutConstraint(
            item: rightView,
            attribute: rightView == superview ? .trailing : .leading,
            relatedBy: relation,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: space)
        superview.addConstraint(constraint)

        return constraint
    }

    @discardableResult
    func stickToSafeLayoutGuide(edges: [NSLayoutConstraint.Attribute], useMargins: Bool = false) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }

        var guide = superview.layoutMarginsGuide

        if #available(iOS 11.0, *), !useMargins {
            guide = superview.safeAreaLayoutGuide
        }

        var constraints: [NSLayoutConstraint] = []
        for edge in edges {
            var anchor: NSObject?
            var guideAnchor: NSObject?

            switch edge {
            case .top:
                anchor = topAnchor
                guideAnchor = guide.topAnchor
            case .bottom:
                anchor = bottomAnchor
                guideAnchor = guide.bottomAnchor
            case .leading:
                anchor = leadingAnchor
                guideAnchor = guide.leadingAnchor
            case .trailing:
                anchor = trailingAnchor
                guideAnchor = guide.trailingAnchor
            default:
                break
            }

            guard case .some = anchor, case .some = guideAnchor else { return [] }

            if let vanchor = (anchor as? NSLayoutYAxisAnchor), let vguideAnchor = (guideAnchor as? NSLayoutYAxisAnchor) {
                let constraint = vanchor.constraint(equalTo: vguideAnchor)
                constraints.append(constraint)
                superview.addConstraint(constraint)
            } else if let hanchor = (anchor as? NSLayoutXAxisAnchor), let hguideAnchor = (guideAnchor as? NSLayoutXAxisAnchor) {
                let constraint = hanchor.constraint(equalTo: hguideAnchor)
                constraints.append(constraint)
                superview.addConstraint(constraint)
            }
        }

        return constraints
    }
}

extension UIView {

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIView {

    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        var image: UIImage?
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }

    func takeSnapShotWithoutScreenUpdate() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        var image: UIImage?
        if self.drawHierarchy(in: bounds, afterScreenUpdates: false) {
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    func createDottedLine(width: CGFloat, color: CGColor) {
       let caShapeLayer = CAShapeLayer()
       caShapeLayer.strokeColor = color
       caShapeLayer.lineWidth = width
       caShapeLayer.lineDashPattern = [2,3]
       let cgPath = CGMutablePath()
       let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
       cgPath.addLines(between: cgPoint)
       caShapeLayer.path = cgPath
       layer.addSublayer(caShapeLayer)
    }
}


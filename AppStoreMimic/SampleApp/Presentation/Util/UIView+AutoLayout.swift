//
//  UIView+AutoLayout.swift
//  AppStoreMimic
//
//  Created by hyonsoo on 2023/09/18.
//

import UIKit

struct AutoLayoutEdges: OptionSet {
    
    let rawValue: Int
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static let leading  = AutoLayoutEdges(rawValue: 1 << 0)
    static let trailing = AutoLayoutEdges(rawValue: 1 << 1)
    static let top      = AutoLayoutEdges(rawValue: 1 << 2)
    static let bottom   = AutoLayoutEdges(rawValue: 1 << 3)
    
    static let all: AutoLayoutEdges = [.leading, .trailing, .top, .bottom]
    static let horizontal: AutoLayoutEdges = [.leading, .trailing]
    static let vertical: AutoLayoutEdges = [.top, .bottom]
    
}

extension UIView {
    @discardableResult
    func makeConstraints(_ receiver: (UIView) -> Void) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        receiver(self)
        return self
    }
    
}

extension UIView {
    
    
    @discardableResult
    func topAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func topAnchorConstraintTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.topAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func bottomAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func bottomAnchorConstraintTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    
    @discardableResult
    func leadingAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func leadingAnchorConstraintTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    
    
    @discardableResult
    func trailingAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func trailingAnchorConstraintTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.trailingAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    
    //MARK: To width, height
    
    @discardableResult
    func widthAnchorConstraintTo(_ constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let layout = self.widthAnchor.constraint(equalToConstant: constant)
        layout.priority = priority
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func heightAnchorConstraintTo(_ constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let layout = self.heightAnchor.constraint(equalToConstant: constant)
        layout.priority = priority
        layout.isActive = true
        return layout
    }
    
    func sizeAnchorConstraintTo(_ constant: CGFloat, priority: UILayoutPriority = .required)  {
        let const = self.heightAnchor.constraint(equalToConstant: constant)
        const.priority = priority
        const.isActive = true
        
        let const2 = self.widthAnchor.constraint(equalToConstant: constant)
        const2.priority = priority
        const2.isActive = true
    }
    
    func sizeAnchorConstraintTo(_ size: CGSize, priority: UILayoutPriority = .required)  {
        let const = self.heightAnchor.constraint(equalToConstant: size.height)
        const.priority = priority
        const.isActive = true
        let const2 = self.widthAnchor.constraint(equalToConstant: size.width)
        const2.priority = priority
        const2.isActive = true
    }
    
    //MARK:  to centerX, centerY
    
    @discardableResult
    func centerXAnchorConstraintToSuperview(_ anchor: NSLayoutXAxisAnchor? = nil, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.centerXAnchor.constraint(equalTo: anchor ?? parent.centerXAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func centerYAnchorConstraintToSuperview(_ anchor: NSLayoutYAxisAnchor? = nil, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.centerYAnchor.constraint(equalTo: anchor ?? parent.centerYAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func centerXAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func centerXAnchorConstraintTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.centerXAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func centerYAnchorConstraintTo(_ view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func centerYAnchorConstraintTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard self.superview != nil else {
            return nil
        }
        let layout = self.centerYAnchor.constraint(equalTo: anchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    
    // MARK: To SafeLayoutGuide
    
    func edgesConstraintTo(_ guide: UILayoutGuide, edges: AutoLayoutEdges, withInset inset: CGFloat = 0) {
        if edges.contains(.leading) {
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: inset).isActive = true
        }
        if edges.contains(.trailing) {
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -inset).isActive = true
        }
        
        if edges.contains(.top) {
            self.topAnchor.constraint(equalTo: guide.topAnchor, constant: inset).isActive = true
        }
        if edges.contains(.bottom) {
            self.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -inset).isActive = true
        }
    }
    
    
    // MARK: TO superview
    
    
    func edgesConstraintToSuperview(edges: AutoLayoutEdges, withInset inset: CGFloat = 0, priority: UILayoutPriority = .required) {
        guard let parent = self.superview else {
            debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!  this view has no parent !!!!!!!!!!!!!!!!!!!!!!!!!")
            return
        }
        if edges.contains(.leading) {
            let constraint = self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: inset)
            constraint.priority = priority
            constraint.isActive = true
        }
        if edges.contains(.trailing) {
            let constraint = self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -inset)
            constraint.priority = priority
            constraint.isActive = true
        }
        
        if edges.contains(.top) {
            let constraint = self.topAnchor.constraint(equalTo: parent.topAnchor, constant: inset)
            constraint.priority = priority
            constraint.isActive = true
        }
        if edges.contains(.bottom) {
            let constraint = self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -inset)
            constraint.priority = priority
            constraint.isActive = true
        }
        
    }
    
    
    @discardableResult
    func topAnchorConstraintToSuperview(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func bottomAnchorConstraintToSuperview(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func leadingAnchorConstraintToSuperview(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func trailingAnchorConstraintToSuperview(_ constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let parent = self.superview else {
            return nil
        }
        let layout = self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: constant)
        layout.isActive = true
        return layout
    }
    
}


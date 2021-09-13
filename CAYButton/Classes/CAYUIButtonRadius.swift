//
//  CAYUIButtonRadius.swift
//  CAYButton
//
//  Created by Alexander Ynoñan H. on 11/09/21.
//

import UIKit

@IBDesignable open class CAYUIButtonRadius: UIButton {

    @IBInspectable public var cornerRadius : CGFloat {
        get{ return self.radius }
        set{ self.radius = newValue }
    }
    
    @IBInspectable public var topRight : Bool {
        get { return self.rightTop }
        set { self.rightTop = newValue }
    }
    
    @IBInspectable public var topLeft : Bool {
        get { return self.leftTop }
        set { self.leftTop = newValue }
    }

    @IBInspectable public var downRight : Bool {
        get { return self.rightDown }
        set { self.rightDown = newValue }
    }
    
    @IBInspectable public var downLeft : Bool {
        get { return self.leftDown }
        set { self.leftDown = newValue }
    }
    
    private var radius : CGFloat = 0
    private var rightTop        = false
    private var leftTop         = false
    private var rightDown       = false
    private var leftDown        = false
    
    private func updateCornerAppearance() {
        self.layer.maskedCorners    = self.getMaskedCorners()
        self.layer.cornerRadius     = self.radius
        self.layer.masksToBounds    = false
    }
    
    public func getMaskedCorners() -> CACornerMask {
        
        var arrayCornerMask = [CACornerMask]()
        
        self.leftTop   ? arrayCornerMask.append(.layerMinXMinYCorner) : nil
        self.rightTop  ? arrayCornerMask.append(.layerMaxXMinYCorner) : nil
        self.leftDown  ? arrayCornerMask.append(.layerMinXMaxYCorner) : nil
        self.rightDown ? arrayCornerMask.append(.layerMaxXMaxYCorner) : nil
        
        return arrayCornerMask.count != 0 ? CACornerMask(arrayCornerMask) : [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.updateCornerAppearance()
    }
    
    open override func setNeedsLayout() {
        super.setNeedsLayout()
        self.updateCornerAppearance()
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.updateCornerAppearance()
    }
}

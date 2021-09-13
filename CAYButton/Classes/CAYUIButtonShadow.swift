//
//  CAYUIButtonShadow.swift
//  CAYButton
//
//  Created by Alexander Ynoñan H. on 11/09/21.
//

import UIKit

@IBDesignable open class CAYUIButtonShadow: CAYUIButtonRadius {

    @IBInspectable public var shadowColor : UIColor {
        get{ return self.color_shadow }
        set{ self.color_shadow = newValue}
    }
    
    @IBInspectable public var shadowOpacity : Float {
        get { return self.shadow_opacity }
        set { self.shadow_opacity = newValue }
    }
    
    @IBInspectable public var shadowRadius : CGFloat {
        get { return self.shadow_radius }
        set { self.shadow_radius = newValue }
    }
    
    @IBInspectable public var shadowOffSet : CGSize {
        get { return self.shadow_offSet }
        set { self.shadow_offSet = newValue }
    }

    private var color_shadow                = UIColor.clear
    private var shadow_radius    : CGFloat  = 0
    private var shadow_offSet    : CGSize   = .zero
    private var shadow_opacity   : Float    = 0
    
    private func updateCornerAppearance() {
        self.layer.shadowColor      = self.color_shadow.cgColor
        self.layer.shadowRadius     = self.shadowRadius
        self.layer.shadowOffset     = self.shadow_offSet
        self.layer.shadowOpacity    = self.shadow_opacity
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

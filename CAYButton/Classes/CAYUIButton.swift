//
//  CAYUIButton.swift
//  CAYButton
//
//  Created by Alexander Ynoñan H. on 11/09/21.
//

import UIKit

@IBDesignable open class CAYUIButton: CAYUIButtonGradiendColor {

    @IBInspectable public var borderColor: UIColor {
        get { return self.border_color }
        set { self.border_color = newValue }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get { return self.border_width }
        set { self.border_width = newValue }
    }

    @IBInspectable public var underLineText : Bool{
        get{ return self.under_LineText }
        set{ self.under_LineText = newValue }
    }
    
    @IBInspectable public var underLinecolor : UIColor{
        get{ return self.under_LineColor }
        set{ self.under_LineColor = newValue }
    }
    
    @IBInspectable public var middleLineText : Bool{
        get{ return self.middle_LineText }
        set{ self.middle_LineText = newValue }
    }
    
    @IBInspectable public var middleLineColor : UIColor{
        get{ return self.middle_LineColor }
        set{ self.middle_LineColor = newValue }
    }
    
    private var under_LineColor             = UIColor.white
    private var middle_LineColor            = UIColor.white
    private var under_LineText              = false
    private var middle_LineText             = false
    private var border_color                = UIColor.white
    private var border_width     : CGFloat  = 0
    
    private func updateAppearanceDefault() {
        self.layer.borderColor      = self.border_color.cgColor
        self.layer.borderWidth      = self.border_width
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.updateAppearanceDefault()
        self.updateAttributeTextAppearance()
    }

    open override func setNeedsLayout() {
        super.setNeedsLayout()
        self.updateAppearanceDefault()
        self.updateAttributeTextAppearance()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.updateAppearanceDefault()
        self.updateAttributeTextAppearance()
    }
    
    private func updateAttributeTextAppearance() {
        
        guard let oldAttributes = self.titleLabel?.attributedText else { return }
        
        let newAttributes = NSMutableAttributedString(attributedString: oldAttributes)
        newAttributes.addUnder(show :self.under_LineText, color: self.under_LineColor)
        newAttributes.addMiddle(show:self.middle_LineText, color: self.middle_LineColor)
        
        self.titleLabel?.attributedText = newAttributes
    }

}

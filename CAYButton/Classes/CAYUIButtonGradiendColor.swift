//
//  CAYUIButtonGradiendColor.swift
//  CAYButton
//
//  Created by Alexander Ynoñan H. on 11/09/21.
//

import UIKit

@IBDesignable open class CAYUIButtonGradiendColor: CAYUIButtonShadow {

    @IBInspectable public var topColor: UIColor {
        get { return self.top_color }
        set { self.top_color = newValue }
    }
    
    @IBInspectable public var dowColor: UIColor {
        get { return self.down_color }
        set { self.down_color = newValue }
    }
        
    @IBInspectable public var topGradient: CGPoint {
        get { return self.top_gradient }
        set { self.top_gradient = newValue }
    }

    @IBInspectable public var downGradient: CGPoint {
        get { return self.down_gradient }
        set { self.down_gradient = newValue }
    }
    
    private var top_color       : UIColor = UIColor.clear
    private var down_color      : UIColor = UIColor.clear
    private var top_gradient    : CGPoint = CGPoint(x: 0, y: -1)
    private var down_gradient   : CGPoint = CGPoint(x: 0, y: 1)
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.updateLinearGradientAppearance()
    }
    
    open override func setNeedsLayout() {
        super.setNeedsLayout()
        self.updateLinearGradientAppearance()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.updateLinearGradientAppearance()
    }
    
    private func updateLinearGradientAppearance() {
        self.addLinearGradientLayer(self.createGradientLayer())
    }

    func createGradientLayer() -> CAGradientLayer {
        
        let gradientLayer :CAGradientLayer = CAGradientLayer()
        
        gradientLayer.type            = .axial
        gradientLayer.frame           = self.bounds
        gradientLayer.cornerRadius    = self.cornerRadius
        gradientLayer.maskedCorners   = self.getMaskedCorners()
        gradientLayer.startPoint      = self.topGradient
        gradientLayer.endPoint        = self.downGradient
        gradientLayer.colors          = [self.top_color.cgColor , self.down_color.cgColor]
        gradientLayer.locations       = [0.0, 1.0]
        
        return gradientLayer
    }
    
    func addLinearGradientLayer(_ gradientLayer: CAGradientLayer) {
        
        if let borderLayer = self.layer.sublayers?.filter({ $0 is CAShapeLayer }).first {
            self.layer.insertSublayer(gradientLayer, below: borderLayer)
        }else{
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

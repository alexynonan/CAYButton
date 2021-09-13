//
//  CAYUIButton.swift
//  CAYButton
//
//  Created by Alexander Ynoñan H. on 11/09/21.
//

extension NSMutableAttributedString {
    
    public func addMiddle(show: Bool, color: UIColor? = nil) {
    
        let keyStyle = NSAttributedString.Key.strikethroughStyle
        let value = NSUnderlineStyle.single.rawValue
        show ? self.addAttribute(keyStyle, value: value) : self.removeAttribute(keyStyle)
        
        guard let color = color else { return }
        let keyColor = NSAttributedString.Key.strikethroughColor
        show ? self.addAttribute(keyColor, value: color) : self.removeAttribute(keyColor)
    }
    
    public func addUnder(show: Bool, color: UIColor? = nil){
        
        let key = NSAttributedString.Key.underlineStyle
        let value = NSUnderlineStyle.single.rawValue
        show ? self.addAttribute(key, value: value) : self.removeAttribute(key)
        
        guard let color = color else { return }
        let keyColor = NSAttributedString.Key.underlineColor
        show ? self.addAttribute(keyColor, value: color) : self.removeAttribute(keyColor)
    }
    
    private func addAttribute(_ key: NSAttributedString.Key, value: Any) {
        let range = NSRange(location: 0, length: self.string.count)
        self.addAttribute(key, value: value, range: range)
    }
    
    private func removeAttribute(_ key: NSAttributedString.Key) {
        let range = NSRange(location: 0, length: self.string.count)
        self.removeAttribute(key, range: range)
    }
}

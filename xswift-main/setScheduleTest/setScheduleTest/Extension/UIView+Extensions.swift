//
//  UIView+Extension.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/26/21.
//

import UIKit


extension UIView {
 
    @IBInspectable var cornerRadius: CGFloat {
       set(newValue) {
           layer.cornerRadius = newValue
           layer.masksToBounds = newValue > 0
       }
        
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set(newValue) {
            layer.borderWidth = newValue
        }
         
         get{
             return layer.borderWidth
         }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set(newValue) {
            layer.borderColor = newValue?.cgColor
        }
         
         get{
            return UIColor(cgColor: layer.borderColor!)
         }
    }
    
 func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
     var topInset = CGFloat(0)
     var bottomInset = CGFloat(0)
     
     if #available(iOS 11, *), enableInsets {
         let insets = self.safeAreaInsets
         topInset = insets.top
         bottomInset = insets.bottom
     }
     
     translatesAutoresizingMaskIntoConstraints = false
     
     if let top = top {
        self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
     }
     if let left = left {
        self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
     }
     if let right = right {
        rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
     }
     if let bottom = bottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
     }
     if height != 0 {
        heightAnchor.constraint(equalToConstant: height).isActive = true
     }
     if width != 0 {
        widthAnchor.constraint(equalToConstant: width).isActive = true
     }
 }
 
}


//For dark mode and theme change 
extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}

//
//  ShazamLikeButton.swift
//  ShazamLikeButton
//
//  Created by Admin on 10.02.17.
//  Copyright © 2017 da-manifest. All rights reserved.
//

import UIKit

@IBDesignable class ShazamLikeButton: UIButton
{
    @IBInspectable var fillColor: UIColor = UIColor.init(red: 200/255, green: 56/255, blue: 56/255, alpha: 1)
    var lineAlpha: CGFloat = 0.5
    
    override func draw(_ rect: CGRect)
    {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let radius: CGFloat = 30
        let lineWidth: CGFloat = 10
        let path2 = UIBezierPath(ovalIn: CGRect(x: bounds.width / 2 - radius / 2, y: bounds.height / 2 - radius / 2, width: radius, height: radius))
        UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: lineAlpha).setFill()
        path2.fill()
        
        let path3 = UIBezierPath(ovalIn: CGRect(x: lineWidth / 2, y: lineWidth / 2, width: bounds.width - lineWidth, height: bounds.height - lineWidth))
        UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: lineAlpha).setStroke()
        path3.lineWidth = lineWidth
        path3.stroke()
    }
    
    func addSimplePulse()
    {
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.5, options: [.repeat, .autoreverse, .allowUserInteraction],
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 1)
                        {
                            self.layer.shadowRadius = 0
                            self.transform = CGAffineTransform.identity
                        }
        })
    }
    
    func addPulse(_ view: UIView)
    {
        let pulse = Pulsing(numberOfPulses: Float.infinity, radius: 95, position: self.center)
        pulse.animationDuration = 2.5
        pulse.backgroundColor = UIColor.white.cgColor
        
        superview?.layer.insertSublayer(pulse, below: self.layer)
    }
    
    func addGlow(_ color: UIColor = UIColor.white)
    {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize.zero
        self.layer.masksToBounds = false
    }
    
    func removeGlow()
    {
        self.layer.shadowOpacity = 0.0
    }
}

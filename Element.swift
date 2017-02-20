//
//  Element.swift
//  ShazamLikeButton
//
//  Created by Admin on 13.02.17.
//  Copyright © 2017 da-manifest. All rights reserved.
//

import UIKit

class Element: UIView
{
    var start: CGFloat = 0.0
    var end: CGFloat = 90.0
    
    override func draw(_ rect: CGRect)
    {
        let ovalRect = CGRect(x: -frame.size.width / 2, y: -frame.size.height / 2, width: frame.size.width, height: frame.size.height)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY),
                        radius: ovalRect.width,
                        startAngle: start * CGFloat.pi/180.0,
                        endAngle: end * CGFloat.pi/180.0, clockwise: true)
        ovalPath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY))
        ovalPath.close()
        UIColor.init(red: 106/255, green: 164/255, blue: 255/255, alpha: 0.5).setFill()
        ovalPath.fill()
        UIColor.white.setStroke()
        ovalPath.lineWidth = 0.5
        ovalPath.lineCapStyle = .round
        ovalPath.lineJoinStyle = .bevel
        ovalPath.stroke()
    }
    
    func rotateElement(duration: CFTimeInterval = 10.0, rotateLeft: Bool = true, from: Double = 0, to: Double = 2, completionDelegate: AnyObject? = nil)
    {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        if rotateLeft == true
        {
            rotateAnimation.fromValue = CGFloat(M_PI * from)
            rotateAnimation.toValue = CGFloat(M_PI * to)
        }
        else
        {
            rotateAnimation.fromValue = CGFloat(M_PI * to)
            rotateAnimation.toValue = CGFloat(M_PI * from)
        }
        
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    //MARK: - Anchor function
    func setAnchorPoint(anchorPoint: CGPoint)
    {
        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x, y: self.bounds.size.height * self.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)
        
        var position : CGPoint = self.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        self.layer.position = position;
        self.layer.anchorPoint = anchorPoint;
    }
}

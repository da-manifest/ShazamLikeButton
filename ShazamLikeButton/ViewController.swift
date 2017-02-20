//
//  ViewController.swift
//  ShazamLikeButton
//
//  Created by Admin on 20.02.17.
//  Copyright © 2017 da-manifest. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var btnElements = [Element]()
    var btnIsPressed: Bool = false


    @IBOutlet weak var button: ShazamLikeButton!
    
    @IBAction func btnAction(_ sender: Any)
    {
        if btnIsPressed
        {
            stopBtnAnimation()
        }
        else
        {
            startBtnAnimation()
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createBtnElements()
        button.addSimplePulse()

    }
    
    //MARK: - Button elements
    func createBtnElements()
    {
        for _ in 0 ... 6
        {
            btnElements.append(Element())
        }
        
        btnElements[1].start = 0.0
        btnElements[1].end = 30
        btnElements[2].start = 0.0
        btnElements[2].end = 35
        btnElements[3].start = 0.0
        btnElements[3].end = 40
        
        for i in 0 ... btnElements.count - 1
        {
            btnElements[i].setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0))
            btnElements[i].isHidden = true
            btnElements[i].backgroundColor = UIColor.clear
            self.view.insertSubview(btnElements[i], belowSubview: button)
            addXConstraint(btnElements[i], toView: button)
            addYConstraint(btnElements[i], toView: button)
        }
        
        addWidthConstraint(btnElements[0], width: 65)
        addHeightConstraint(btnElements[0], height: 65)
        for i in 1 ... 3
        {
            addWidthConstraint(btnElements[i], width: 85)
            addHeightConstraint(btnElements[i], height: 85)
        }
        addWidthConstraint(btnElements[4], width: 65)
        addHeightConstraint(btnElements[4], height: 65)
        addWidthConstraint(btnElements[5], width: 70)
        addHeightConstraint(btnElements[5], height: 70)
        addWidthConstraint(btnElements[6], width: 60)
        addHeightConstraint(btnElements[6], height: 60)
    }
    
    // MARK: - Button & element animations
    func startBtnAnimation()
    {
        btnElements[0].rotateElement(duration: 4, rotateLeft: true, from: 0.5, to: 2.5)
        btnElements[1].rotateElement(duration: 5, rotateLeft: false, from: 1.5, to: 3.5)
        btnElements[2].rotateElement(duration: 6, rotateLeft: true, from: 1, to: 3)
        btnElements[3].rotateElement(duration: 7, rotateLeft: false, from: 0.75, to: 2.75)
        btnElements[4].rotateElement(duration: 8, rotateLeft: false, from: 1.75, to: 3.75)
        btnElements[5].rotateElement(duration: 9, rotateLeft: true, from: 0.5, to: 2.5)
        btnElements[6].rotateElement(duration: 10, rotateLeft: false, from: 1, to: 3)
        
        for i in 0 ... btnElements.count - 1
        {
            btnElements[i].isHidden = false
        }
        
        button.isEnabled = false
        button.addPulse(self.button)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute:
            {
                self.button.addPulse(self.button)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute:
            {
                self.button.addPulse(self.button)
                self.button.isEnabled = true
        })
        
        self.button.fillColor = UIColor.init(red: 56/255, green: 135/255, blue: 255/255, alpha: 1)
        self.button.lineAlpha = 0.5
        self.button.setNeedsDisplay()
        
        button.addGlow()
        button.addSimplePulse()
        
        btnIsPressed = true
    }
    
    func stopBtnAnimation()
    {
        for i in 0 ... view.layer.sublayers!.count - 1
        {
            view.layer.sublayers?[i].removeAllAnimations()
        }
        
        for i in 0 ... btnElements.count - 1
        {
            btnElements[i].isHidden = true
        }
        
        self.button.fillColor = UIColor.init(red: 200/255, green: 56/255, blue: 56/255, alpha: 1)
        self.button.lineAlpha = 0.7
        self.button.setNeedsDisplay()
        
        button.removeGlow()
        button.addSimplePulse()
        
        btnIsPressed = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }


}


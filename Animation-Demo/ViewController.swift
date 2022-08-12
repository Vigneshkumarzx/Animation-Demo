//
//  ViewController.swift
//  Animation-Demo
//
//  Created by vignesh kumar c on 02/07/22.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {

    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layer.backgroundColor = UIColor.systemBlue.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.animateMovement()
            self.animateRotation()
            self.animateOpacity()
        }
    }
    
    func animateMovement() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2),
                                      y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    
    func animateOpacity() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    func animateRotation() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = .pi * 12
        animation.toValue = 0
        animation.duration = 3
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
}


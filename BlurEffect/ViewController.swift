//
//  ViewController.swift
//  BlurEffect
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
   
    
    // A function to layout a view behind another view
    // assume both views exist in teh superview
    func layout(background:UIView, behind view:UIView, padding:CGFloat){
        var constraints = [NSLayoutConstraint]()
        view.translatesAutoresizingMaskIntoConstraints = false
        background.translatesAutoresizingMaskIntoConstraints = false
        // view.centerX = background.centerX
        constraints += [NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: background, attribute: .centerX, multiplier: 1.0, constant: 0)]
        // view.centerY = Background.centerY
        constraints += [NSLayoutConstraint.init(item: view, attribute: .centerY, relatedBy: .equal, toItem: background, attribute: .centerY, multiplier: 1.0, constant: 0)]
        // background.width = view.width + (padding * 2.0)
        constraints += [NSLayoutConstraint.init(item: background, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: padding * 2.0)]
        // background.height = view.height + (padding * 2.0)
        constraints += [NSLayoutConstraint.init(item: background, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: padding * 2.0)]
        NSLayoutConstraint.activate(constraints)
    }

    func dropShadow(view:UIView){
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurEffectView)
        layout(background: blurEffectView, behind: stackView, padding: 10)
        dropShadow(view: blurEffectView)
        view.bringSubviewToFront(stackView)
    }


}


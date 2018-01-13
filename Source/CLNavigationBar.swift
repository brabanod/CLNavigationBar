//
//  CLNavigationBar.swift
//  Napper
//
//  Created by Pascal Braband on 16.11.16.
//  Copyright © 2016 Pascal Braband. All rights reserved.
//

import UIKit

class CLNavigationBar: UIView {
    
    // MARK: - Properties
    
    var delegate:CLNavigationBarDelegate?

    private let leftButton = UIButton(type: UIButtonType.system)
    private let rightButton = UIButton(type: UIButtonType.system)
    private let imageView = UIImageView()
    
    
    @IBInspectable var displayLeftButton:Bool {
        get { return !leftButton.isHidden }
        set { leftButton.isHidden = !newValue }
    }
    @IBInspectable var displayRightButton:Bool {
        get { return !rightButton.isHidden }
        set { rightButton.isHidden = !newValue }
    }
    @IBInspectable var leftButtonTitle:String {
        get { return (leftButton.titleLabel?.text)! }
        set { leftButton.setTitle(newValue, for: .normal) }
    }
    @IBInspectable var rightButtonTitle:String {
        get { return (rightButton.titleLabel?.text)! }
        set { rightButton.setTitle(newValue, for: .normal) }
    }
    
    
    // Customizable Properties
    let navbarColor = UIColor.clear
    let buttonFont = UIFont(name: "AvenirNext-Medium", size: 15.0)
    let buttonTitleColor:UIColor = UIColor.white
    let imageName = "Logo"
    let imageSize:CGFloat = 25.0
    
    
    
    
    
    
    // MARK: - Setup
    
    init() {
        super.init(frame:CGRect.zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    
    func setup() {
        
        self.isUserInteractionEnabled = true
        
        // Default Values
        displayLeftButton = true
        displayRightButton = true
        
        // Setup Container View
        let containerView = UIView()
        containerView.isUserInteractionEnabled = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = navbarColor
        let containerLeftC = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        let containerRightC = NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        let containerTopC = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20.0)
        let containerBottomC = NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        self.addSubview(containerView)
        self.addConstraints([containerLeftC,containerRightC,containerTopC,containerBottomC])
        
        // Setup Left Button
        leftButton.addTarget(self, action: #selector(leftButtonAction(button:)), for: .touchUpInside)
        leftButton.titleLabel?.font = buttonFont
        leftButton.tintColor = buttonTitleColor
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        let leftButtonLeftC = NSLayoutConstraint(item: leftButton, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1.0, constant: 30.0)
        let leftButtonYCenterC = NSLayoutConstraint(item: leftButton, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        containerView.addSubview(leftButton)
        containerView.addConstraints([leftButtonLeftC,leftButtonYCenterC])
        
        // Setup Right Button
        rightButton.addTarget(self, action: #selector(rightButtonAction(button:)), for: .touchUpInside)
        rightButton.titleLabel?.font = buttonFont
        rightButton.tintColor = buttonTitleColor
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        let rightButtonRightC = NSLayoutConstraint(item: rightButton, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1.0, constant: -30.0)
        let rightButtonYCenterC = NSLayoutConstraint(item: rightButton, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        containerView.addSubview(rightButton)
        containerView.addConstraints([rightButtonRightC,rightButtonYCenterC])
        
        // Setup center Logo View
        imageView.image = UIImage(named: imageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageXCenterC = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let imageYCenterC = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let imageHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSize)
        let imageWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSize)
        imageView.addConstraints([imageHeight,imageWidth])
        containerView.addSubview(imageView)
        containerView.addConstraints([imageXCenterC,imageYCenterC])
    }
    
    
    func leftButtonAction(button:UIButton) {
        // Call delegate method which specifies the left button action
        delegate?.navbarLeftItemAction(button: button)
    }
    
    
    func rightButtonAction(button:UIButton) {
        // Call delegate method which specifies the right button action
        delegate?.navbarRightItemAction(button: button)
    }

}






// MARK: - Button Actions

protocol CLNavigationBarDelegate {
    
    func navbarLeftItemAction(button:UIButton)
    func navbarRightItemAction(button:UIButton)
}



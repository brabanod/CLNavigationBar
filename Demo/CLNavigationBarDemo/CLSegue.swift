//
//  CLSegue.swift
//  Napper
//
//  Created by Pascal Braband on 17.11.16.
//  Copyright © 2016 Pascal Braband. All rights reserved.
//

import UIKit

enum CLSegueType {
    case forward
    case unwind
}

class CLSegue: UIStoryboardSegue {
    
    var style:CLSegueType = .forward
    var destinationConstOffset:CGFloat = 0.0
    var sourceConstOffset:CGFloat = 0.0
    
    func setup() {
        
        switch style {
        case .forward:
            destinationConstOffset = destination.view.frame.width
            sourceConstOffset = source.view.frame.width
        
        case .unwind:
            destinationConstOffset = -destination.view.frame.width
            sourceConstOffset = -source.view.frame.width
        }
    }
    
    override func perform() {
        
        if !UIView.areAnimationsEnabled {
            print("ERROR: Enable animations for segue in Interface Builder. Check \"Animates\" in Attributes Inspector")
        }
        
        if let sourceVC = self.source as? CLViewController {
            if let destinationVC = self.destination as? CLViewController {
                
                setup()
                
                // Add DestinationViewController's view to screen/window
                let window = UIApplication.shared.keyWindow
                window?.insertSubview(destinationVC.view, aboveSubview: sourceVC.view)
                
                // Settings before animation
                // Change order of setting constraint constant, so that contentView width is never 0
                if style == .forward {
                    destinationVC.contentViewRightConst.constant = -destinationConstOffset
                    destinationVC.contentViewLeftConst.constant = destinationConstOffset
                }
                else {
                    destinationVC.contentViewLeftConst.constant = destinationConstOffset
                    destinationVC.contentViewRightConst.constant = -destinationConstOffset
                }
                
                destinationVC.view.layoutIfNeeded()
                destinationVC.navigationBar.layer.opacity = 0.0
                destinationVC.view.backgroundColor = UIColor.clear                
                
                // Animation
                // Move view from left to right or vice versa
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    
                    if self.style == .forward {
                        sourceVC.contentViewLeftConst.constant = -self.sourceConstOffset
                        sourceVC.contentViewRightConst.constant = self.sourceConstOffset
                    } else {
                        sourceVC.contentViewRightConst.constant = self.sourceConstOffset
                        sourceVC.contentViewLeftConst.constant = -self.sourceConstOffset
                    }
                    sourceVC.view.layoutIfNeeded()
                    
                    if self.style == .forward {
                        destinationVC.contentViewLeftConst.constant = 0
                        destinationVC.contentViewRightConst.constant = 0
                    } else {
                        destinationVC.contentViewRightConst.constant = 0
                        destinationVC.contentViewLeftConst.constant = 0
                    }
                    destinationVC.view.layoutIfNeeded()
                    
                    destinationVC.navigationBar.layer.opacity = 1.0
                    
                }) { (Finished) -> Void in
                    destinationVC.view.backgroundColor = UIColor(red: 18.0/255.0, green: 42.0/255.0, blue: 73.0/255.0, alpha: 1.0)
                    
                    if self.style == .forward {
                        sourceVC.present(destinationVC, animated: false, completion: nil)
                    } else if self.style == .unwind {
                        sourceVC.dismiss(animated: false, completion: nil)
                    } else {
                        print("ERROR: No segue style defined")
                        
                    }
                }
            }
        }
    }
    
}


//                let sourceNavBar = sourceVC.view.viewWithTag(1)!
//                let sourceContentView = sourceVC.view.viewWithTag(2)!
//                let destNavBar = destinationVC.view.viewWithTag(1)!
//                let destContentView = destinationVC.view.viewWithTag(2)!

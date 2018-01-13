//
//  CLViewController.swift
//  Napper
//
//  Created by Pascal Braband on 13.11.16.
//  Copyright © 2016 Pascal Braband. All rights reserved.
//
//
//  MARK: Setup
//  Drag new ViewController in Storyboard
//  Create 2 UIView objects for navbar and contentView
//  Connect view to "contentView" Outlet
//  Set Custom Class for navigationBar in IB to CLNavigationBar
//  Connect view to "navigationBar" Outlet
//  Set constraints für "contentView" and "navigationBar"
//  Connect constraint to "navigationBarHeightConst" Outlet
//  Connect constraint to "contentViewLeftConst" Outlet
//  Connect constraint to "contentViewRightConst" Outlet
//
//  -NavigationBar:
//  Override "navbarLeftItemAction" and "navbarRightItemAction"
//  to specify a custom action.
//  Set "displayRightButton"/"-LeftButton" if you want to.
//  Specify a title for left and right Button in IB.
//  Or set them with the properties "left-", "rightButtonText"
//
//  -Segue:
//  Set Segue class to CLSegue and specify an identifier.
//  Use this to "performSegue:withIdentifier".
//  -Undiwnd:
//  Connect ViewController to Exit and specify an Identifier
//  in your VC class. Also save the exact same String in
//  "unwindingSegueID". Call "performUnwindSegue" to unwind.
//

import UIKit

class CLViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navigationBar: CLNavigationBar!
    @IBOutlet weak var contentViewLeftConst: NSLayoutConstraint!
    @IBOutlet weak var contentViewRightConst: NSLayoutConstraint!
    
    // MARK: Properties
    var unwindingSegueID:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if Properties and Outlets are set
        if contentView == nil {print("ERROR: Connect \"contentView\" Outlet to View in Interface Builder")}
        if navigationBar == nil {print("ERROR: Connect \"navigationBar\" Outlet to View in Interface Builder")}
        if contentViewLeftConst == nil {print("ERROR: Connect \"contentViewLeftConst\" Outlet to NSLayoutContraint in Interface Builder")}
        if contentViewRightConst == nil {print("ERROR: Connect \"contentViewRightConst\" Outlet to NSLayoutContraint in Interface Builder")}
        
        // Set navigationBar Delegate and height
        navigationBar.delegate = self
        self.view.layoutIfNeeded()
        
        // Set contentView clipsToBounds
        contentView.clipsToBounds = true
        
        // Set Swipe Gesture to unwind
        let unwindGesture = UISwipeGestureRecognizer(target: self, action: #selector(performUnwindSegue))
        self.view.addGestureRecognizer(unwindGesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    // MARK: - Segue Methods
    
    func performUnwindSegue() {
        if unwindingSegueID != nil {
            self.performSegue(withIdentifier: unwindingSegueID!, sender: self)
        } else {
            print("WARNING: Specify \"unwindingSegueID\" to perform unwind segue. If you don't need an unwind segue for this CLViewController you can ignore this message.")
        }
    }
    
    
    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let unwindingSegue = CLSegueUnwind(identifier: identifier, source: fromViewController, destination: toViewController)
        return unwindingSegue
    }
    
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
    }
}






// MARK: - Navbar Methods

extension CLViewController: CLNavigationBarDelegate {
    
    func navbarLeftItemAction(button: UIButton) {
        print("WARNING: Override navbarLeftItemAction")
    }
    
    
    func navbarRightItemAction(button: UIButton) {
        print("WARNING: Override navbarRightItemAction")
    }
}

//
//  SecondViewController.swift
//  CLNavigationBarDemo
//
//  Created by Pascal Braband on 04.04.17.
//  Copyright © 2017 Pascal Braband. All rights reserved.
//

import UIKit

class SecondViewController: CLViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Specify unwindingSegueID
        unwindingSegueID = "SecondToFirst"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    // MARK: - Navigation Bar Methods
    
    override func navbarLeftItemAction(button: UIButton) {
        performUnwindSegue()
    }
    
    
    override func navbarRightItemAction(button: UIButton) {
        performSegue(withIdentifier: "SecondToThird", sender: self)
    }
    
}

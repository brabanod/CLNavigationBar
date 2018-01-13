//
//  FirstViewController.swift
//  CLNavigationBarDemo
//
//  Created by Pascal Braband on 30.03.17.
//  Copyright © 2017 Pascal Braband. All rights reserved.
//

import UIKit

class FirstViewController: CLViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    // MARK: - Navigation Bar Methods
    
    override func navbarRightItemAction(button: UIButton) {
        performSegue(withIdentifier: "FirstToSecond", sender: self)
    }


}


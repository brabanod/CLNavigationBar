//
//  NPSegueUnwind.swift
//  Napper
//
//  Created by Pascal Braband on 20.11.16.
//  Copyright © 2016 Pascal Braband. All rights reserved.
//

import UIKit

class CLSegueUnwind: CLSegue {
    
    override func perform() {
        style = .unwind
        super.perform()
    }

}

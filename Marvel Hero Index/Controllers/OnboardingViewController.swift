//
//  OnboardingViewController.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation
import UIKit
import Sparrow

class OnboardingViewController: UIViewController{
    
    var permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.create(with: [.Notification])
    
    override func viewDidLoad() {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        permissionAssistant.present(on: self)
    }
    
}

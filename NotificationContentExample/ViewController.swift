//
//  ViewController.swift
//  NotificationContentExample
//
//  Created by Ahmet Keskin on 17/12/2017.
//  Copyright © 2017 AhmetKeskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendPushButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.sendPushButton.layer.cornerRadius = 4.0
        self.sendPushButton.setTitleColor(UIColor.white, for: .normal)
        self.sendPushButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendPushButtonTapped(_ sender: UIButton) {
        NotificationHelper.prepareLocalPushAndSend(timeInterval: 3.0)
    }
    
}


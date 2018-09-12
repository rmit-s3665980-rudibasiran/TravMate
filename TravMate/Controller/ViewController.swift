//
//  ViewController.swift
//  TravMate
//
//  Created by Rudi Basiran on 12/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgStart: UIImageView!
    
    override func viewDidLoad() {
        imgStart.image = UIImage(named: "palmtree.jpeg")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


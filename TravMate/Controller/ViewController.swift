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
    @IBOutlet weak var placeHolder: UIView!
    @IBOutlet weak var faded: UILabel!
    @IBOutlet weak var aboutUs: UILabel!
    
    var showAbout: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgStart.image = UIImage(named: "palmtree.jpeg")
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }


}


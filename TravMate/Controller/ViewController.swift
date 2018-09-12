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
    
    var model:Model = Model()
    
    var showingBack = false
    var front:UIImageView!
    var back:UIImageView!
    var cardView: UIView!
    var direction: UIViewAnimationOptions = UIViewAnimationOptions.transitionFlipFromLeft
    var gesturesRegistered: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgStart.image = UIImage(named: "palmtree.jpeg")
        registerGestures()
     }

    fileprivate func registerGestures() {

        if(!gesturesRegistered)
        {
            gesturesRegistered = true
            front = UIImageView(image: UIImage(named: "palmtree.jpeg"))
            back = UIImageView(image: UIImage(named: "palmtree.jpeg"))
            placeHolder.addSubview(back)
            back.isHidden = true
            front.isHidden = true
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right

            placeHolder.addGestureRecognizer(swipeLeft)
            placeHolder.addGestureRecognizer(swipeRight)
        }
    }
    
    // Determine direction of swipe
    @objc func handleSwipes (_ sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .left) {
            direction = UIViewAnimationOptions.transitionFlipFromRight
        }
        if (sender.direction == .right) {
            direction = UIViewAnimationOptions.transitionFlipFromLeft
        }
        showCard(direction)
    }
    
    fileprivate func showCard(_ direction: UIViewAnimationOptions)
    {
        if (!showingBack) {
            UIView.transition(from: front, to: back, duration: 1, options: direction, completion: nil)
            showingBack = true
            imgStart.image = UIImage(named:"palmtree.jpeg")
            aboutUs.text = model.getAbout()
            aboutUs.isHidden = false
            faded.isHidden = false
            
            // formatText()
        }
        else {
            UIView.transition(from: back, to: front, duration: 1, options: direction, completion: nil)
            aboutUs.text = ""
            showingBack = false
            faded.isHidden = true
            aboutUs.isHidden = true
     
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }


}


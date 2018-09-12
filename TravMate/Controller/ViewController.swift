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
    var attributedString:NSMutableAttributedString?
    var gesturesRegistered: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgStart.image = UIImage(named: "palmtree.jpeg")
        faded.isHidden = true
        aboutUs.isHidden = true
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
            aboutUs.isHidden = false
            faded.isHidden = false
            aboutUs.text = model.getAbout()
            
            formatText()
        }
        else {
            UIView.transition(from: back, to: front, duration: 1, options: direction, completion: nil)
            aboutUs.text = ""
            showingBack = false
            faded.isHidden = true
            aboutUs.isHidden = true
        }
    }
    
    fileprivate func formatText() {
        applyFormattingToText()
        applyHighlightsToText()
        aboutUs.attributedText = attributedString
    }
    
    
    func applyFormattingToText() {
        let font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        let textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        
        let attributes = [NSAttributedStringKey.foregroundColor : textColor, NSAttributedStringKey.font : font]
        
        attributedString = NSMutableAttributedString(string: model.getAbout(), attributes: attributes)
    }
    
    func applyHighlightsToText()
    {
        guard attributedString == nil else
        {
            // 1. Create a range that equals the length of the string that contains the text to be highlighted
            let range = NSMakeRange(0, (self.attributedString?.length)!)
            
            // 2. Match items surrounded by single quotation marks
            let regexStr = "(\\'\\w+(.\\s\\w+)*\\')"
            let regex = try! NSRegularExpression(pattern: regexStr, options: [])
            
            // 3. Create attributes to apply to the text
            let colourAttributes = [NSAttributedStringKey.foregroundColor : UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1)]
            
            // 4. iterate over each match, making the text red
            regex.enumerateMatches(in: (attributedString?.string)!, options: [], range: range) {
                match, flags, stop in let matchRange = match!.range(at: 1)
                self.attributedString?.addAttributes(colourAttributes, range: matchRange)
            }
            return
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }


}


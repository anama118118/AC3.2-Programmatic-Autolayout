//
//  Exercise2ViewController.swift
//  AC3.2-Programmatic-Autolayout
//
//  Created by Ana Ma on 12/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class Exercise2ViewController: UIViewController {

    
    @IBOutlet weak var tealView1: UIView!
    @IBOutlet weak var tealView2: UIView!
    @IBOutlet weak var tealView3: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //constraintsWithVisualFormatLanguage()
        //centerViewWithNSLayoutConstraint()
        NSLayoutDimensionWithAnchorConstraints()
        

    }
    
    internal func centerViewWithNSLayoutConstraint() { //to item nill needs to be attribute: .notAnAttribute (just like working with nil values)
        let tealView1WidthContraint = NSLayoutConstraint(item: tealView1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width / 2)
        let tealView1HeightContraint = NSLayoutConstraint(item: tealView1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height / 4)
        let tealView1TopConstraint = NSLayoutConstraint(item: tealView1, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1.0, constant: 20.0)
        
        let tealView2WidthContraint = NSLayoutConstraint(item: tealView2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width / 2)
        let tealView2HeightContraint = NSLayoutConstraint(item: tealView2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height / 4)
        let tealView2TopConstraint = NSLayoutConstraint(item: tealView2, attribute: .topMargin, relatedBy: .equal, toItem: self.tealView1, attribute: .bottom, multiplier: 1.0, constant: 16.0)
        
        let tealView3WidthContraint = NSLayoutConstraint(item: tealView3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width / 2)
        let tealView3HeightContraint = NSLayoutConstraint(item: tealView3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height / 4)
        let tealView3TopConstraint = NSLayoutConstraint(item: tealView3, attribute: .topMargin, relatedBy: .equal, toItem: self.tealView2, attribute: .bottom, multiplier: 1.0, constant: 16.0)
        
        
        let purpleViewWidthContraint = NSLayoutConstraint(item: purpleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width / 2)
        let purpleViewHeightContraint = NSLayoutConstraint(item: purpleView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height)
        let purpleViewTrailingContraint = NSLayoutConstraint(item: purpleView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let purpleViewTopConstraint = NSLayoutConstraint(item: purpleView, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1.0, constant: 20.0)
        
        tealView1.translatesAutoresizingMaskIntoConstraints = false
        tealView2.translatesAutoresizingMaskIntoConstraints = false
        tealView3.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([tealView1TopConstraint, purpleViewTrailingContraint, purpleViewTopConstraint, tealView2TopConstraint, tealView3TopConstraint])
        self.tealView1.addConstraints([tealView1WidthContraint, tealView1HeightContraint])
        self.tealView2.addConstraints([tealView2WidthContraint, tealView2HeightContraint])
        self.tealView3.addConstraints([tealView3WidthContraint, tealView3HeightContraint])
        self.purpleView.addConstraints([purpleViewHeightContraint, purpleViewWidthContraint])
    }
    
    internal func constraintsWithVisualFormatLanguage() {
        let dict: [String: UIView] = [
            "teal1" : tealView1!,
            "teal2" : tealView2!,
            "teal3" : tealView3!,
            "purple" : purpleView!
        ]
        
        let metric: [String: Any] = [
            "width" : self.view.frame.size.width / 2,
            "tealHeight": self.view.frame.size.height / 4,
            "purpleHeight" : self.view.frame.size.height
        ]
        
        let teal1HConstraint = "H:|[teal1(width)]"
        let teal2HConstraint = "H:|[teal2(width)]"
        let teal3HConstraint = "H:|[teal3(width)]"
        let purpleHConstraint = "H:|-(width)-[purple(width)]"
        
        let verticalConstraintsTeal = "V:|-(20.0)-[teal1(tealHeight)]-(8.0)-[teal2(tealHeight)]-(8.0)-[teal3(tealHeight)]"
        let verticalConstraintsPurple = "V:|-(20.0)-[purple(purpleHeight)]"
        
        
        let vertsPurple = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsPurple, options: [], metrics: metric, views: dict)
        let purpleHorz = NSLayoutConstraint.constraints(withVisualFormat: purpleHConstraint, options: [], metrics: metric, views: dict)
        
        let vertsTeal = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsTeal, options: [], metrics: metric, views: dict)
        let teal1Horz = NSLayoutConstraint.constraints(withVisualFormat: teal1HConstraint, options: [], metrics: metric, views: dict)
        let teal2Horz = NSLayoutConstraint.constraints(withVisualFormat: teal2HConstraint, options: [], metrics: metric, views: dict)
        let teal3Horz = NSLayoutConstraint.constraints(withVisualFormat: teal3HConstraint, options: [], metrics: metric, views: dict)
        
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        tealView1.translatesAutoresizingMaskIntoConstraints = false
        tealView2.translatesAutoresizingMaskIntoConstraints = false
        tealView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(vertsPurple)
        NSLayoutConstraint.activate(purpleHorz)
        NSLayoutConstraint.activate(vertsTeal)
        NSLayoutConstraint.activate(teal1Horz)
        NSLayoutConstraint.activate(teal2Horz)
        NSLayoutConstraint.activate(teal3Horz)
    }
    
    internal func NSLayoutDimensionWithAnchorConstraints() {
        
        tealView1.translatesAutoresizingMaskIntoConstraints = false
        tealView2.translatesAutoresizingMaskIntoConstraints = false
        tealView3.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tealView1.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2).isActive = true
        self.tealView1.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 4).isActive = true
        
        self.tealView1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.tealView1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tealView1.rightAnchor.constraint(equalTo: self.purpleView.leftAnchor).isActive = true
//        self.tealView1.bottomAnchor.constraint(equalTo: self.tealView2.topAnchor, constant: -8).isActive = true
        
        self.tealView2.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2).isActive = true
        self.tealView1.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 4).isActive = true
        
        self.tealView2.topAnchor.constraint(equalTo: self.tealView1.bottomAnchor, constant: 8).isActive = true
        self.tealView2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tealView2.rightAnchor.constraint(equalTo: self.purpleView.leftAnchor).isActive = true
//        self.tealView2.bottomAnchor.constraint(equalTo: self.tealView3.topAnchor, constant: 8).isActive = true
        
        self.tealView3.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2).isActive = true
        self.tealView1.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 4).isActive = true
        
        self.tealView3.topAnchor.constraint(equalTo: self.tealView2.bottomAnchor, constant: 8).isActive = true
        self.tealView3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tealView3.rightAnchor.constraint(equalTo: self.purpleView.leftAnchor).isActive = true
        self.tealView3.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.purpleView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2).isActive = true
        self.purpleView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height).isActive = true
        self.purpleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.purpleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.purpleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        self.purpleView.leadingAnchor.constraint(equalTo: self.tealView1.rightAnchor).isActive = true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

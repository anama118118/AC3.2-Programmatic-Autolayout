//
//  Exercise1ViewController.swift
//  AC3.2-Programmatic-Autolayout
//
//  Created by Ana Ma on 12/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class Exercise1ViewController: UIViewController {

    
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerViewWithNSLayoutConstraint()


    }
    
    internal func centerViewWithNSLayoutConstraint() { //to item nill needs to be attribute: .notAnAttribute (just like working with nil values)
        let tealViewWidthContraint = NSLayoutConstraint(item: tealView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width)
        let tealViewHeightContraint = NSLayoutConstraint(item: tealView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height / 2 - 4)
        let tealViewCenterXContraint = NSLayoutConstraint(item: tealView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let tealViewTopConstraint = NSLayoutConstraint(item: tealView, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1.0, constant: 0.0)
        
        let purpleViewWidthContraint = NSLayoutConstraint(item: purpleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width)
        let purpleViewHeightContraint = NSLayoutConstraint(item: purpleView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.height / 2 - 4)
        let purpleViewCenterXContraint = NSLayoutConstraint(item: purpleView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let purpleViewBottomConstraint = NSLayoutConstraint(item: purpleView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        tealView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([tealViewCenterXContraint,tealViewTopConstraint, purpleViewCenterXContraint, purpleViewBottomConstraint])
        self.tealView.addConstraints([tealViewWidthContraint, tealViewHeightContraint])
        self.purpleView.addConstraints([purpleViewHeightContraint, purpleViewWidthContraint])
    }
    

    
    internal func constraintsWithVisualFormatLanguage() {
        let dict: [String: UIView] = [
            "teal" : tealView!,
            "purple" : purpleView!
        ]
        
        let metric: [String: Any] = [
            "viewWidth" : self.view.frame.size.width,
            "viewHeight" : (self.view.frame.size.height / 2 - 4)
        ]
        
        let tealHConstraint = "H:|[teal(viewWidth)]"
        let purpleHConstraint = "H:|[purple(viewWidth)]"
        
        let verticalConstraints = "V:|-(20.0)-[teal(viewHeight)]-(8.0)-[purple(viewHeight)]"
        
        let verts = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraints, options: [], metrics: metric, views: dict)
        let tealHorz = NSLayoutConstraint.constraints(withVisualFormat: tealHConstraint, options: [], metrics: metric, views: dict)
        let purpleHorz = NSLayoutConstraint.constraints(withVisualFormat: purpleHConstraint, options: [], metrics: metric, views: dict)
        
        tealView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(verts)
        NSLayoutConstraint.activate(tealHorz)
        NSLayoutConstraint.activate(purpleHorz)
    }
    
    internal func jaysWayOfSettingUpConstraint() {
        
        tealView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tealView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.tealView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.tealView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.tealView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tealView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
        self.tealView.bottomAnchor.constraint(equalTo: self.purpleView.topAnchor, constant: -8).isActive = true
        
        self.purpleView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.purpleView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
        self.purpleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.purpleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.purpleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.purpleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

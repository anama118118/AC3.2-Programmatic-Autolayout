//
//  ViewController.swift
//  AC3.2-Programmatic-Autolayout
//
//  Created by Louis Tur on 12/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //centerViewWithNSLayoutConstraint()
        //centerViewWithVisualFormatLanguage()
        //moreConstraintsWithVisualConstraintLanguage()
        //threeViewsConstraintWithVisualConstraintLanguage()
        //jaysWayOfSettingUpConstraint()
        
        
    }
    
    internal func jaysWayOfSettingUpConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        redView.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -8.0).isActive = true
        redView.widthAnchor.constraint(equalTo: imageView.widthAnchor, constant: 8.0).isActive = true
        redView.heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        greenView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0).isActive = true
        greenView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }
    
    internal func threeViewsConstraintWithVisualConstraintLanguage() {
        let dict: [String: UIView] = [
            "image" : imageView!,
            "red" : redView!,
            "green" : greenView!
        ]
        
        let metric: [String: Any] = [
            "viewWidth" : 50.0,
            "viewHeight" : 100.0
        ]
        
        let imageHConstraint = "H:|-(8.0)-[image(viewWidth)]"
        let redHConstraint = "H:|-[red(viewWidth)]"
        let greenHConstraint = "H:|-[green(viewWidth)]"
        
        let verticalConstraints = "V:|-(8.0)-[image(viewHeight)]-[red(viewHeight)]-[green(viewHeight)]"
        
        let verts = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraints, options: [], metrics: metric, views: dict)
        let imageHorz = NSLayoutConstraint.constraints(withVisualFormat: imageHConstraint, options: [], metrics: metric, views: dict)
        let redHorz = NSLayoutConstraint.constraints(withVisualFormat: redHConstraint, options: [], metrics: metric, views: dict)
        let greenHorz = NSLayoutConstraint.constraints(withVisualFormat: greenHConstraint, options: [], metrics: metric, views: dict)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(verts)
        NSLayoutConstraint.activate(imageHorz)
        NSLayoutConstraint.activate(redHorz)
        NSLayoutConstraint.activate(greenHorz)
    }
    
    internal func moreConstraintsWithVisualConstraintLanguage() {
        let viewDictionary = ["superView" : self.view!, "view1" : imageView!]
        // V = vertical axis
        // H = horizaontal axis
        // (value) tells you the "constant" of the constraints
        let constraint = "V:[superView]-[view1(50.0)]"
        let constraint2 = "H:[superView]-[view1(100.0)]"
        
        // | is shorthand for superView
        // these will break because the super view is > 50.0 pts
        // but the view1 is defined as only having 50pt height
        // so it cannot be both pinned to the top and bottom edge of
        // a view that is >50.0 i height AND also be 50pts
        let constraint3 = "V:|[view1(50.0)]|"
        let constraint4 = "H:|[view1(100.0)]|"
        
        // - is a connectio of 8pt
        // V -> Top-to-bottom
        // H -> Left-To-Right
        // pins to top left corner
        let constraint5 = "V:|[view1(50.0)]"
        let constraint6 = "H:|[view1(100.0)]"
        
        //pins to bottom right corner
        let constraint7 = "V:[view1(50.0)]|"
        let constraint8 = "H:[view1(100.0)]|"
        
        //pins to the top right corner
        let constraint9 = "V:|[view1(50.0)]"
        let constraint10 = "H:[view1(100.0)]|"
        
        //pins to the bottom left corner
        let constraint11 = "V:[view1(50.0)]|"
        let constraint12 = "H:|[view1(100.0)]"
        
        let constraintsVertical = NSLayoutConstraint.constraints(withVisualFormat: constraint11, options: [], metrics: nil, views: viewDictionary)
        let constraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: constraint12, options: [], metrics: nil, views: viewDictionary)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(constraintsVertical)
        NSLayoutConstraint.activate(constraintsHorizontal)
    }
    
    internal func centerViewWithVisualFormatLanguage() {
        let imageWidth = "H:[view]-(<=1.0)-[tobias(200.0)]"
        let imageHight = "V:[view]-(<=1.0)-[tobias(200.0)]"
        let views = ["tobias" : imageView!,
                     "view" : self.view!]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: imageWidth, options: .alignAllCenterY, metrics: nil, views: views)
        
        let imageHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: imageHight, options: .alignAllCenterX, metrics: nil, views: views)
        
        NSLayoutConstraint.activate(imageWidthConstraints)
        NSLayoutConstraint.activate(imageHeightConstraints)
        
        
        //let imageWidth = "H:[view]-(<=1.0)-[tobias(200.0)]"
        //let imageHeight = "V:[view]-(<=1.0)-[tobias(200.0)]"
        //let views = ["tobias" : self.imageView!,
        //             "view" : self.view!]
        //self.imageView.translatesAutoresizingMaskIntoConstraints = false
        //let imageWidthContraints = NSLayoutConstraint.constraints(withVisualFormat: imageWidth, options: .alignAllCenterY, metrics: nil, views: views)
        //let imageHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: imageHeight, options: .alignAllCenterX, metrics: nil, views: views)
        
        //NSLayoutConstraint.activate( imageWidthContraints)
        //NSLayoutConstraint.activate(imageHeightConstraints)
        
        
        //        let blueWidth = "H:[tobias(200.0)]"
        //        let blueHight = "V:[tobias(200.0)]"
        //        let views = ["tobias" : blueView,
        //                     "view" : self.view]
        //        blueView.translatesAutoresizingMaskIntoConstraints = false
        //        let blueWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueWidth, options: .alignAllCenterX, metrics: nil, views: views)
        //
        //        let blueHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueHight, options: .alignAllCenterY, metrics: nil, views: views)
        //
        //        NSLayoutConstraint.activate( blueHeightConstraints)
        //        NSLayoutConstraint.activate(blueWidthConstraints)
    }
    
    internal func centerViewWithNSLayoutConstraint() {
        let imageViewWidthContraint = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
        let imageViewHeightContraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
        let imageViewCenterXContraint = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        let imageViewCenterYContraint = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([imageViewCenterXContraint, imageViewCenterYContraint])
        self.imageView.addConstraints([imageViewWidthContraint, imageViewHeightContraint])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


//
//  ViewController.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 1/10/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import UIKit

private extension Selector {
    static let popSelfFromNavigationStack = #selector(ViewController.popSelfFromNavigationStack)
}

class ViewController: UIViewController {

    var imageIdentifer: String!
    var location: String!
    var locationDescription: String!
   
    // MARK: - UI Elements
    var descriptionLabel: UILabel!
    var descriptionLabelAttributedText: NSMutableAttributedString! {
        didSet {
            descriptionLabelAttributedText = NSMutableAttributedString(string: descriptionLabelAttributedText.string, attributes: [
                NSFontAttributeName: UIFont(name: Text.Font.Regular, size: 15.0)!,
                NSForegroundColorAttributeName: Color.Gray.Dark
                ])
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        self.navigationItem.hidesBackButton = false
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.title = location
        
        // image
        let imageView = UIImageView(image: UIImage(named: self.imageIdentifer))
        imageView.contentMode = .ScaleAspectFit
        imageView.layer.cornerRadius = 5.0
        imageView.layer.shadowColor = Color.Gray.Medium.CGColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSizeZero
        imageView.layer.shadowRadius = 3.0
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.7).active = true
        imageView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        imageView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -Device.screenHeight * 0.1).active = true
        imageView.widthAnchor.constraintLessThanOrEqualToAnchor(self.view.widthAnchor, multiplier: 0.8).active = true
        
        // description
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabelAttributedText = NSMutableAttributedString(string: locationDescription, attributes: nil)
        descriptionLabel.attributedText = descriptionLabelAttributedText
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraintEqualToAnchor(imageView.bottomAnchor, constant: Device.screenHeight * 0.1).active = true
        descriptionLabel.centerXAnchor.constraintEqualToAnchor(imageView.centerXAnchor).active = true
        descriptionLabel.widthAnchor.constraintEqualToAnchor(imageView.widthAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    // MARK: Navigation
    
    func popSelfFromNavigationStack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}


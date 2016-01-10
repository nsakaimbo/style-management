//
//  TableViewCell.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 1/10/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifer: String = "tableViewCell"
  
    let kLayoutMargin: CGFloat = 5.0
    
    var dateTaken: NSDate!
    var location: String!
   
    let dateFormatter = StyleKit.TableViewController.TableViewCell.dateFormatter
   
    // MARK: - UI Elements
    var dateTakenLabel: UILabel!
    var dateTakenLabelAttributedString: NSMutableAttributedString! {
        didSet {
            dateTakenLabelAttributedString = NSMutableAttributedString(string: dateTakenLabelAttributedString.string, attributes: StyleKit.TableViewController.TableViewCell.dateLabelTextAttributes())
        }
    }
    
    var locationLabel: UILabel! {
        didSet {
            locationLabel.textColor = StyleKit.TableViewController.TableViewCell.locationLabelTextColor()
            locationLabel.font = StyleKit.TableViewController.TableViewCell.locationLabelFont()
        }
    }
    
    var locationImageView: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        let containerView = UIView()
        let superview = self.contentView
       
        // containerView
        superview.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraintEqualToAnchor(superview.leadingAnchor, constant: kLayoutMargin).active = true
        containerView.trailingAnchor.constraintEqualToAnchor(superview.trailingAnchor, constant: -kLayoutMargin).active = true
        containerView.topAnchor.constraintEqualToAnchor(superview.topAnchor, constant: kLayoutMargin).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(superview.bottomAnchor, constant: -kLayoutMargin).active = true
        
        // date taken label
        dateTakenLabel = UILabel()
        dateTakenLabel.minimumScaleFactor = 0.7
        dateTakenLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateTakenLabel)
        dateTakenLabel.topAnchor.constraintEqualToAnchor(containerView.topAnchor, constant: kLayoutMargin).active = true
        dateTakenLabel.leadingAnchor.constraintEqualToAnchor(containerView.leadingAnchor, constant: kLayoutMargin).active = true
        
        // location label
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.minimumScaleFactor = 0.7
        containerView.addSubview(locationLabel)
        locationLabel.topAnchor.constraintEqualToAnchor(dateTakenLabel.bottomAnchor, constant: kLayoutMargin).active = true
        locationLabel.leadingAnchor.constraintEqualToAnchor(containerView.leadingAnchor, constant: kLayoutMargin).active = true
        
        // image view
        locationImageView = UIImageView()
        locationImageView.contentMode = .ScaleAspectFill
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.insertSubview(locationImageView, atIndex: 0)
        locationImageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        locationImageView.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
        locationImageView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        locationImageView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
    }
    
    func updateCellLabels(withDate date:NSDate, andLocation location:String) {
        dateTakenLabelAttributedString = NSMutableAttributedString(string: self.dateFormatter.stringFromDate(date), attributes: nil)
        dateTakenLabel.attributedText = dateTakenLabelAttributedString
        locationLabel.text = location
        self.locationImageView.image = UIImage(named: location + "-Landscape.jpg")
    }
}

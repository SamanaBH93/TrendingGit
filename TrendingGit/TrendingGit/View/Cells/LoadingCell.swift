//
//  LoadingCell.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import Foundation
import UIKit

class LoadingCell: UITableViewCell {
    @IBOutlet private var circleImageView: UIView!
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var descriptionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleImageView.layer.cornerRadius = 19
        titleView.layer.cornerRadius = 5
        descriptionView.layer.cornerRadius = 5
        self.startShimmeringAnimation()
    }
    
}

extension UIView {
  
  // ->1
  enum Direction: Int {
    case topToBottom = 0
    case bottomToTop
    case leftToRight
    case rightToLeft
  }
  
  func startShimmeringAnimation() {
    
    // Create color  ->2
    let lightColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1).cgColor
    let blackColor = UIColor.black.cgColor
    
    // Create a CAGradientLayer  ->3
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [blackColor, lightColor, blackColor]
    gradientLayer.frame = CGRect(x: -self.bounds.size.width, y: -self.bounds.size.height, width: 3 * self.bounds.size.width, height: 3 * self.bounds.size.height)
    
    
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.locations =  [0.35, 0.50, 0.65] //[0.4, 0.6]
    self.layer.mask = gradientLayer
    
    // Add animation over gradient Layer  ->4
    CATransaction.begin()
    let animation = CABasicAnimation(keyPath: "locations")
    animation.fromValue = [0.0, 0.1, 0.2]
    animation.toValue = [0.8, 0.9, 1.0]
    animation.duration = CFTimeInterval(1.4)
    animation.repeatCount = .greatestFiniteMagnitude
    gradientLayer.add(animation, forKey: "shimmerAnimation")
    CATransaction.commit()
  }
}

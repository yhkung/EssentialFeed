//
//  FeedImageCell.swift
//  Prototype
//
//  Created by YH Kung on 2021/7/13.
//

import UIKit

final class FeedImageCell: UITableViewCell {
    @IBOutlet weak var locationContainer: UIStackView!
    @IBOutlet weak var feedImageContainer: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        feedImageContainer.startShimmering()
        feedImageView.alpha = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        feedImageContainer.startShimmering()
        feedImageView.alpha = 0
    }
    
    func fadeIn(_ image: UIImage?) {
        feedImageView.image = image
        
        UIView.animate(
            withDuration: 0.25,
            delay: 1.25,
            options: [],
            animations: {
                self.feedImageView.alpha = 1
            }, completion: { completed in
                if completed {
                    self.feedImageContainer.stopShimmering()
                }
            })
    }
}

private extension UIView {
     private var shimmerAnimationKey: String {
         return "shimmer"
     }

     func startShimmering() {
         let white = UIColor.white.cgColor
         let alpha = UIColor.white.withAlphaComponent(0.7).cgColor
         let width = bounds.width
         let height = bounds.height

         let gradient = CAGradientLayer()
         gradient.colors = [alpha, white, alpha]
         gradient.startPoint = CGPoint(x: 0.0, y: 0.4)
         gradient.endPoint = CGPoint(x: 1.0, y: 0.6)
         gradient.locations = [0.4, 0.5, 0.6]
         gradient.frame = CGRect(x: -width, y: 0, width: width*3, height: height)
         layer.mask = gradient

         let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
         animation.fromValue = [0.0, 0.1, 0.2]
         animation.toValue = [0.8, 0.9, 1.0]
         animation.duration = 1
         animation.repeatCount = .infinity
         gradient.add(animation, forKey: shimmerAnimationKey)
     }

     func stopShimmering() {
         layer.mask = nil
     }
 }

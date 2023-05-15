//
//  OnboardingCollectionViewCell.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 15/05/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    func configure(slide: String) {
        image.image = UIImage(named: slide)
        myLabel.text = slide
    }
}

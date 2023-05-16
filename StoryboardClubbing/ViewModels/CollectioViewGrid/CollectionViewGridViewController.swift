//
//  CollectionViewGridViewController.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 16/05/23.
//

import UIKit

class CollectionViewGridViewController: UIViewController {
    
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var slides: [String] = ["card2","card3","card4", "card5","card6", "card2","card3","card4", "card5","card6", "card2","card3","card4", "card5","card6","card2","card3","card4", "card5","card6"]
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.collectionViewLayout.invalidateLayout()
    }
}
extension CollectionViewGridViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellGrid
        cell.myImage.image = UIImage(named: slides[indexPath.row])
        return cell
    }
}

extension CollectionViewGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let columns: CGFloat = 3.0
            let spacing: CGFloat = 5.0
            let totalHorizontalSpacing = (columns - 1.0) * spacing
            let itemWidth = (myCollectionView.bounds.width - totalHorizontalSpacing) / columns
            let itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
            return itemSize
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}


//
//  TableViewCell.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 15/05/23.
//

import UIKit

class TableViewCell: UITableViewCell,  UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionViewCell.dataSource = self
        myCollectionViewCell.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[myCollectionViewCell.tag].image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        cell.myImage.image = UIImage(named: data[myCollectionViewCell.tag].image[indexPath.row])
        return cell
        
    }

}

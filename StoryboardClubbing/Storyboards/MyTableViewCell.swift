//
//  MyTableViewCell.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 12/05/23.
//

import UIKit

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

class MyTableViewCell: UITableViewCell {
    weak var delegate: MyTableViewCellDelegate?
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    var title: String = ""
    @IBOutlet var Button: UIButton!
    @IBAction func didButtonTapped() {
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String) {
        self.title = title
        Button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Button.setTitleColor(.link, for: .normal)
        // Initialization code
    }

    
    
}

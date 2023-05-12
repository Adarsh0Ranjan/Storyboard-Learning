//
//  MyTableViewCell.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 12/05/23.
//

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
    
    private var title: String = ""
    
    @IBOutlet var button: UIButton!
    @IBAction func didTapButton() {
        delegate?.didTapButton(with: title)
    }
    func configure(with title: String) {
        self.title = title
        button.setTitle(title, for: .normal)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.label, for: .normal)
        // Initialization code
    }

}

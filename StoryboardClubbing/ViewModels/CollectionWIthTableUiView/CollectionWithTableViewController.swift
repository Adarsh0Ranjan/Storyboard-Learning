//
//  CollectinWithTableViewController.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 15/05/23.
//

import UIKit


var data = [
    CollectionOfCards(title: "Card 2 to 6", image: ["card2","card3","card4", "card5","card6"]),
    CollectionOfCards(title: "Card 7 to ll", image: ["card7","card8","card9", "card10","card11"]),
    CollectionOfCards(title: "Card 11 to 14", image: ["card11","card12","card13", "card14"])
]

class CollectionWithTableViewController: UIViewController {
    
    @IBOutlet  weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension CollectionWithTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        cell.myCollectionViewCell.tag = indexPath.section
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .yellow
    }
    
    
}

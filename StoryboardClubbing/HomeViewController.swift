//
//  HomeViewController.swift
//  StoryboardClubbing
//
//  Created by Roro Solutions on 12/05/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
   
    let data = ["DatePicker", "CollectionVIewWithTableView","Onboarding", "CollectionViewGrid"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        
        if indexPath.row != data.count - 1 {
            let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
            spacerView.backgroundColor = .clear
            cell.contentView.addSubview(spacerView)
        }
        return cell
    }
}

extension HomeViewController: MyTableViewCellDelegate {
    func didTapButton(with title: String) {
            let storyboard = UIStoryboard(name: title, bundle: nil)
        print(storyboard)
            guard let newViewController = storyboard.instantiateViewController(withIdentifier: title) as? UIViewController else {
                return
            }
            print(newViewController)
            let navigation = UINavigationController(rootViewController: newViewController)
            navigation.modalPresentationStyle = .fullScreen
            
            let backButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(backButtonTapped))
            newViewController.navigationItem.leftBarButtonItem = backButton
            
            present(navigation, animated: true, completion: nil)
        }
        
        @objc func backButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
}

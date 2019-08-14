//
//  FriendsListViewController.swift
//  HobbyTracker
//
//  Created by Joshua Franklin on 8/13/19.
//  Copyright © 2019 AMSU. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        friends.append(Friend(name: "Jeff", hometown: "London", hobbies: ["Basketball with the neighborhood kids"]))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
            }
        }
    }
}

extension FriendsListViewController: addFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

// Confirm to UITableViewDataSource
extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     guard let cell =  tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as?
        FriendTableViewCell else {return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        
        return cell
    }
}

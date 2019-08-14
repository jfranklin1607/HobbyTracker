//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Joshua Franklin on 8/14/19.
//  Copyright © 2019 AMSU. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    
    var friend: Friend? {
        
        // Property observer, it will be called everytime friend is set
        didSet {
            
            updateViews()
        }
    }

    private func updateViews() {
        
        guard let friend = friend else {return}
        
        nameLabel.text = friend.name
        homeTownLabel.text = friend.hometown
        homeTownLabel.text = "\(friend.hobbies.count) hobbies"
    }

}

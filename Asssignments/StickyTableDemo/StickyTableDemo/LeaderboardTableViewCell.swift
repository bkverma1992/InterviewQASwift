//
//  LeaderboardTableViewCell.swift
//  StickyTableDemo
//
//  Created by APPLE on 03/08/25.
//


import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        userImageView.makeCircular(borderColor: .clear)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureData(with player: Player) {
        rankLabel.text = numberSubstring(from: player.rank)
        nameLabel.text = player.name
        scoreLabel.text = "\(player.score) pts"
        prizeLabel.text = "₹\(player.prize)"
        bgView.backgroundColor = player.isCurrentUser ? .red : .clear
//        bgView.roundAllCorners(radius: 10)
    }
    
    func numberSubstring(from number: Int) -> String {
        let suffix: String
        
        let ones = number % 10
        let tens = (number / 10) % 10
        
        if tens == 1 {
            suffix = "th" // 11th, 12th, 13th
        } else {
            switch ones {
            case 1: suffix = "st"
            case 2: suffix = "nd"
            case 3: suffix = "rd"
            default: suffix = "th"
            }
        }
        
        return "\(number)\(suffix)"
    }
}

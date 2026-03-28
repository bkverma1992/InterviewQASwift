//
//  LeaderboardTableViewCell.swift
//  LeaderbordDemo
//
//  Created by APPLE on 01/08/25.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
  
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.makeCircular(borderColor: .clear)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Configuration
    func configureData(with player: Player) {
        rankLabel.attributedText = NSAttributedString.makeSuperscriptedRank(player.rank)
        nameLabel.text = player.name
        scoreLabel.text = "\(player.score.commaSeparated) pts"
        prizeLabel.text = "₹\(player.prize.commaSeparated)"
        bgView.backgroundColor = player.isCurrentUser ? .fromRGB(3, 136, 205) : .clear
        bgView.roundAllCorners(radius: 10)
    }
}

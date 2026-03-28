//
//  LeaderboardViewController.swift
//  LeaderbordDemo
//
//  Created by APPLE on 01/08/25.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var headerRightView: UIView!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var firstRankLabel: UILabel!
    @IBOutlet weak var secondRankLabel: UILabel!
    @IBOutlet weak var thirdRankLabel: UILabel!
    
    @IBOutlet weak var firstRankImageView: UIImageView!
    @IBOutlet weak var firstWinnerNameLabel: UILabel!
    @IBOutlet weak var firstRankPointLabel: UILabel!
    @IBOutlet weak var firstRankPrizeLabel: UILabel!
    
    @IBOutlet weak var secondRankImageView: UIImageView!
    @IBOutlet weak var secondWinnerNameLabel: UILabel!
    @IBOutlet weak var secondRankPointLabel: UILabel!
    @IBOutlet weak var secondRankPrizeLabel: UILabel!
    
    @IBOutlet weak var thirdRankImageView: UIImageView!
    @IBOutlet weak var thirdWinnerNameLabel: UILabel!
    @IBOutlet weak var thirdRankPointLabel: UILabel!
    @IBOutlet weak var thirdRankPrizeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var topStickyUserView: LeaderboardTableViewCell?
    private var bottomStickyUserView: LeaderboardTableViewCell?
    private let viewModel = LeaderboardViewModel(service: MockLeaderboardService())
    var currentUserPlayer: Player? {
        return viewModel.players.first(where: { $0.isCurrentUser })
    }
    
    
    //    MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStickyUserViews()
    }
    
    // MARK: - UI Setup
    func setupUI() {
        backgroundView.roundTopCorners(radius: 20)
        headerRightView.roundAllCorners(radius: 18)
        setRankLabels([
            (firstRankLabel, "1", "st"),
            (secondRankLabel, "2", "nd"),
            (thirdRankLabel, "3", "rd")
        ])
        
        makeImagesCircular([(firstRankImageView, rgbColor(251, 232, 130)), (secondRankImageView, .white), (thirdRankImageView, rgbColor(234, 169, 97))])
        
        setupTableView()
        viewModel.delegate = self
        viewModel.loadInitialPlayers()
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LeaderboardTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaderboardTableViewCell")
    }
    
    func loadWinnersData() {
        let winners: [(Player?, UILabel, UILabel, UILabel)] = [
            (viewModel.firstWinnerPlayer, firstWinnerNameLabel, firstRankPointLabel, firstRankPrizeLabel),
            (viewModel.secondWinnerPlayer, secondWinnerNameLabel, secondRankPointLabel, secondRankPrizeLabel),
            (viewModel.thirdWinnerPlayer, thirdWinnerNameLabel, thirdRankPointLabel, thirdRankPrizeLabel)
        ]
        
        for (winner, nameLabel, pointLabel, prizeLabel) in winners {
            if let winner = winner {
                nameLabel.text = winner.name
                pointLabel.text = "\(winner.score.commaSeparated) pts"
                prizeLabel.text = "₹\(winner.prize.commaSeparated)"
            } else {
                nameLabel.text = "-"
                pointLabel.text = "-"
                prizeLabel.text = "-"
            }
        }
    }
    
    // MARK: - Sticky Views
    private func setupStickyUserViews() {
        if let topView = Bundle.main.loadNibNamed("LeaderboardTableViewCell", owner: nil)?.first as? LeaderboardTableViewCell {
            topView.frame = CGRect(x: 0, y: tableView.frame.minY, width: tableView.frame.width, height: 70)
            topView.isHidden = true
            topStickyUserView = topView
            backgroundView.addSubview(topView)
        }
        
        if let bottomView = Bundle.main.loadNibNamed("LeaderboardTableViewCell", owner: nil)?.first as? LeaderboardTableViewCell {
            let height = 70
            bottomView.frame = CGRect(x: 0, y: tableView.frame.maxY - CGFloat(height), width: tableView.frame.width, height: CGFloat(height))
            bottomView.isHidden = true
            bottomStickyUserView = bottomView
            backgroundView.addSubview(bottomView)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height: CGFloat = 70
        bottomStickyUserView?.frame = CGRect(x: 0, y: tableView.frame.maxY - height, width: tableView.frame.width, height: height)
    }
}


extension LeaderboardViewController: LeaderboardViewModelDelegate {
    func didUpdatePlayers() {
        tableView.reloadData()
        loadWinnersData()
    }
}

// MARK: - TableView Delegate & DataSource
extension LeaderboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell", for: indexPath) as? LeaderboardTableViewCell else {
            return UITableViewCell()
        }
        let player = viewModel.player(at: indexPath.row)
        cell.configureData(with: player)
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
        if position > (tableView.contentSize.height - scrollView.frame.size.height - 100) {
            viewModel.loadMorePlayers()
        }
        
        guard let indexPaths = tableView.indexPathsForVisibleRows,
              let currentUser = currentUserPlayer,
              let currentUserIndex = viewModel.players.firstIndex(where: { $0.id == currentUser.id }) else {
            topStickyUserView?.isHidden = true
            bottomStickyUserView?.isHidden = true
            return
        }
        
        let currentUserIndexPath = IndexPath(row: currentUserIndex, section: 0)
        
        if indexPaths.contains(currentUserIndexPath) {
            // Current user is visible, hide sticky views
            topStickyUserView?.isHidden = true
            bottomStickyUserView?.isHidden = true
        } else if currentUserIndexPath.row < indexPaths.first?.row ?? 0 {
            // User is above the screen – show at top
            topStickyUserView?.isHidden = false
            topStickyUserView?.configureData(with: currentUser)
            bottomStickyUserView?.isHidden = true
        } else if currentUserIndexPath.row > indexPaths.last?.row ?? 0 {
            // User is below the screen – show at bottom
            bottomStickyUserView?.isHidden = false
            bottomStickyUserView?.configureData(with: currentUser)
            topStickyUserView?.isHidden = true
        }
    }
}

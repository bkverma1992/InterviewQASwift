//
//  ViewController.swift
//  StickyTableDemo
//
//  Created by APPLE on 03/08/25.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel = LeaderboardViewModel(service: MockLeaderboardService())
    @IBOutlet weak var tableView: UITableView!
    var currentUserPlayer: Player? {
        return viewModel.players.first(where: { $0.isCurrentUser })
    }

    private var topStickyUserView: LeaderboardTableViewCell?
    private var bottomStickyUserView: LeaderboardTableViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        viewModel.delegate = self
        viewModel.loadInitialPlayers()
        setupStickyUserViews()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LeaderboardTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaderboardTableViewCell")
    }
    
    private func setupStickyUserViews() {
        if let topView = Bundle.main.loadNibNamed("LeaderboardTableViewCell", owner: nil)?.first as? LeaderboardTableViewCell {
            topView.frame = CGRect(x: 0, y: tableView.frame.minY, width: tableView.frame.width, height: 60)
            topView.isHidden = true
            topStickyUserView = topView
            view.addSubview(topView)
        }

        if let bottomView = Bundle.main.loadNibNamed("LeaderboardTableViewCell", owner: nil)?.first as? LeaderboardTableViewCell {
            let height = 60
            bottomView.frame = CGRect(x: 0, y: tableView.frame.maxY - CGFloat(height), width: tableView.frame.width, height: CGFloat(height))
            bottomView.isHidden = true
            bottomStickyUserView = bottomView
            view.addSubview(bottomView)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height: CGFloat = 60
        bottomStickyUserView?.frame = CGRect(x: 0, y: tableView.frame.maxY - height, width: tableView.frame.width, height: height)
    }
}



extension ViewController: LeaderboardViewModelDelegate {
    func didUpdatePlayers() {
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate and DataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
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

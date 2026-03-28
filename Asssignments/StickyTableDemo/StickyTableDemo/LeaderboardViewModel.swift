//
//  LeaderboardViewModel.swift
//  LeaderbordDemo
//
//  Created by APPLE on 01/08/25.
//

import Foundation

protocol LeaderboardViewModelDelegate: AnyObject {
    func didUpdatePlayers()
}

class LeaderboardViewModel {
    private let service: LeaderboardServiceProtocol
    private(set) var players: [Player] = []
    private let pageSize = 50
    private var isLoading = false
    weak var delegate: LeaderboardViewModelDelegate?
    var firstWinnerPlayer: Player?
    var secondWinnerPlayer: Player?
    var thirdWinnerPlayer: Player?
    
    var currentUserPlayer: Player? {
        return players.first(where: { $0.isCurrentUser })
    }

    var otherPlayers: [Player] {
        return players.filter { !$0.isCurrentUser }
    }

    var isCurrentUserInTop: Bool {
        guard let current = currentUserPlayer else { return false }
        return current.rank <= 3
    }
    
    init(service: LeaderboardServiceProtocol) {
        self.service = service
    }
    
    func loadInitialPlayers() {
        players.removeAll()
        loadMorePlayers()
    }
    
    func loadMorePlayers() {
        guard !isLoading else { return }
        isLoading = true
        service.fetchPlayers(offset: players.count, limit: pageSize) { [weak self] newPlayers in
            guard let self = self else { return }
            self.players += newPlayers
            self.players.sort { $0.score > $1.score }
          
            let top3PrizeValues = [15000, 12000, 10000]
            let currentUserId = 32
            self.players = self.players.enumerated().map { index, player in
                var updatedPlayer = Player(id: player.id, name: player.name, score: player.score)
                updatedPlayer.rank = index + 1
                updatedPlayer.isCurrentUser = player.id == currentUserId

                if index < 3 {
                    updatedPlayer.prize = top3PrizeValues[index]
                } else {
                    updatedPlayer.prize = (player.score / 10) * 2
                }
                

                return updatedPlayer
            }
//            MARK: - Winners Data
            self.firstWinnerPlayer = self.player(at: 0)
            self.secondWinnerPlayer = self.player(at: 1)
            self.thirdWinnerPlayer = self.player(at: 2)
            
            self.isLoading = false
            self.delegate?.didUpdatePlayers()
        }
    }
    
    func player(at index: Int) -> Player {
        return players[index]
    }
    
    var count: Int {
        return players.count
    }
}

// MARK: - LeaderboardServiceProtocol
//
protocol LeaderboardServiceProtocol {
    func fetchPlayers(offset: Int, limit: Int, completion: @escaping ([Player]) -> Void)
}

// MARK: - MockLeaderboardService with Fixed Scores

class MockLeaderboardService: LeaderboardServiceProtocol {

    private var cachedPlayers: [Player] = []

    init() {
        generateMockPlayers() // Initialize once
    }

    private func generateMockPlayers() {
        guard cachedPlayers.isEmpty else { return }

        let totalPlayers = 10000

        for id in 1...totalPlayers {
            // 🔢 Fixed, repeatable score (not random)
            let score = ((id * 11 + 7) % 61) + 10  // Scores between 10 - 70

            let player = Player(
                id: id,
                name: "Player \(id)",
                score: score
            )
            cachedPlayers.append(player)
        }
    }

    func fetchPlayers(offset: Int, limit: Int, completion: @escaping ([Player]) -> Void) {
        let end = min(offset + limit, cachedPlayers.count)
        let playersSlice = Array(cachedPlayers[offset..<end])

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            completion(playersSlice)
        }
    }
}

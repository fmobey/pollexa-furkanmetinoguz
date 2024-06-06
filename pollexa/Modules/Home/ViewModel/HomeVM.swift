//
//  HomeVM.swift
//  pollexa
//
//  Created by Furkan OGUZ on 5.06.2024.
//

import Foundation

class HomeVM: HomeVMProtocol {
    weak var delegate: HomeVMDelegate?
    
    private let mockService = MockService()
    var polls: [Poll] = []
    var user: User?
    var activePollsViewModel: ActivePollsViewModel?
    
    func fetchData() {
        mockService.fetchPolls { [weak self] polls in
            self?.polls = polls
            self?.delegate?.handleVMOutput(.pollsFetched(polls))
        }
        
        mockService.fetchUser { [weak self] user in
            self?.user = user
            self?.delegate?.handleVMOutput(.userFetched(user))
        }
        
        self.activePollsViewModel = ActivePollsViewModel(
            activePollsText: "\(polls.count) Active Polls",
            detailText: "See details",
            detailButtonTapped: {
                print("Detail button tapped")
            }
        )
        self.delegate?.handleVMOutput(.activePollsFetched(activePollsViewModel!))
    }
    
    func updateActivePolls() {
        self.activePollsViewModel = ActivePollsViewModel(
            activePollsText: "\(polls.count) Active Polls",
            detailText: "See details",
            detailButtonTapped: {
                print("Detail button tapped")
            }
        )
        self.delegate?.handleVMOutput(.activePollsFetched(activePollsViewModel!))
    }
}

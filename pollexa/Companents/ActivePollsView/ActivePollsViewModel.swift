//
//  ActivePollsViewModel.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import Foundation

class ActivePollsViewModel {
    var activePollsText: String?
    var detailText: String?
    var detailButtonTapped: (() -> Void)?
    
    init(activePollsText: String, detailText: String, detailButtonTapped: (() -> Void)? = nil) {
        self.activePollsText = activePollsText
        self.detailText = detailText
        self.detailButtonTapped = detailButtonTapped
    }
}

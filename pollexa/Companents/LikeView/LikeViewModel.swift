//
//  LikeViewModel.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import Foundation

class LikeViewModel {
    var likedImageView: String?
    var likeButtonTapped: (() -> Void)?
    
    init(likedImageView: String, likeButtonTapped: (() -> Void)?) {
        guard let likeButtonTapped else { return }
        self.likedImageView = likedImageView
        self.likeButtonTapped = likeButtonTapped
    }
}

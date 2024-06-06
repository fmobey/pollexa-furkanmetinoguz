//
//  PollsCollectionViewCell.swift
//  pollexa
//
//  Created by Furkan OGUZ on 5.06.2024.
//

import UIKit

protocol PollsCollectionViewCellDelegate: AnyObject {
    func didTapFirstLikeButton(in cell: PollsCollectionViewCell)
    func didTapSecondLikeButton(in cell: PollsCollectionViewCell)
    func didVote(in cell: PollsCollectionViewCell)
}

final class PollsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var lastTimeLabel: UILabel!
    @IBOutlet private weak var lastVotedTimeLabel: UILabel!
    @IBOutlet private weak var contentMessageLabel: UILabel!
    @IBOutlet private weak var likedStackView: UIStackView!
    @IBOutlet private weak var firstLikeView: LikeView!
    @IBOutlet private weak var secondLikeView: LikeView!
    @IBOutlet private weak var totalVotesLabel: UILabel!
    
    // MARK: - Properties
    
    weak var delegate: PollsCollectionViewCellDelegate?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configure(with poll: PollCollectionViewModel) {
        avatarImageView.image = UIImage(named: poll.avatarImageName ?? "")
        avatarImageView.layer.cornerRadius = 16
        userNameLabel.text = poll.userName
        lastTimeLabel.text = poll.lastTime
        lastVotedTimeLabel.text = "Last voted \(poll.lastVotedTime ?? "")".uppercased()
        contentMessageLabel.text = poll.contentMessage
        totalVotesLabel.text = "\(poll.totalVotes ?? 0) Total Votes"
        
        let firstLikeViewModel = LikeViewModel(likedImageView: poll.firstLikeImageName ?? "") { [weak self] in
            guard let self = self else { return }
            self.delegate?.didTapFirstLikeButton(in: self)
            self.delegate?.didVote(in: self)
        }
        firstLikeView.setData(viewModel: firstLikeViewModel)
        
        let secondLikeViewModel = LikeViewModel(likedImageView: poll.secondLikeImageName ?? "") { [weak self] in
            guard let self = self else { return }
            self.delegate?.didTapSecondLikeButton(in: self)
            self.delegate?.didVote(in: self)

        }
        secondLikeView.setData(viewModel: secondLikeViewModel)
    }
    
    private func setupUI() {
        firstLikeView.layer.cornerRadius = 10
        firstLikeView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        firstLikeView.clipsToBounds = true
        
        secondLikeView.layer.cornerRadius = 10
        secondLikeView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        secondLikeView.clipsToBounds = true
    }
}

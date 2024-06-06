//
//  HomeVC.swift
//  pollexa
//
//  Created by Furkan OGUZ on 5.06.2024.
//

import UIKit

final class HomeVC: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var currentUserAvatarImageView: UIImageView!
    @IBOutlet private weak var addIconButton: UIButton!
    @IBOutlet private weak var discoverLabel: UILabel!
    @IBOutlet private weak var activeView: ActivePollsView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var viewModel: HomeVMProtocol = HomeVM()
    private var isCollectionViewTopConstraintZero = false
    private let scrollToTopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.up.square.fill"), for: .normal)
        button.tintColor = .color1
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.isHidden = true
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupUI()
        setupScrollToTopButton()
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    @objc private func scrollToTopButtonTapped() {
        collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

// MARK: - Private Methods

private extension HomeVC {
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PollsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PollsCollectionViewCell")
    }
    
    func setupUI() {
        currentUserAvatarImageView.layer.cornerRadius = 16
    }
    
    func setupScrollToTopButton() {
        scrollToTopButton.addTarget(self, action: #selector(scrollToTopButtonTapped), for: .touchUpInside)
        view.addSubview(scrollToTopButton)
        
        scrollToTopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollToTopButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollToTopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scrollToTopButton.widthAnchor.constraint(equalToConstant: 50),
            scrollToTopButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - HomeViewModelDelegate

extension HomeVC: HomeVMDelegate {
    
    func handleVMOutput(_ output: HomeVMOutput) {
        switch output {
        case let .userFetched(user):
            currentUserAvatarImageView.image = UIImage(named: user.avatarImage)
            discoverLabel.text = "\(user.userName)"
            
        case let .pollsFetched(polls):
            self.viewModel.polls = polls
            collectionView.reloadData()
            
        case let .activePollsFetched(activePollsViewModel):
            activeView.setData(viewModel: activePollsViewModel)
        }
    }
}

// MARK: - UICollectionView

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.polls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PollsCollectionViewCell", for: indexPath) as? PollsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let poll = viewModel.polls[indexPath.row]
        let pollViewModel = PollCollectionViewModel(
            avatarImageName: poll.avatarImageName,
            userName: poll.userName,
            lastTime: poll.lastTime,
            lastVotedTime: poll.lastVotedTime,
            contentMessage: poll.contentMessage,
            firstLikeImageName: poll.firstLikeImageName,
            secondLikeImageName: poll.secondLikeImageName,
            totalVotes: poll.totalVotes
        )
        cell.configure(with: pollViewModel)
        cell.layer.cornerRadius = 10
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 338)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        if offset > 100 && !isCollectionViewTopConstraintZero {
            UIView.animate(withDuration: 0.3) {
                self.headerView.isHidden = true
                self.scrollToTopButton.isHidden = false
                self.view.layoutIfNeeded()
            }
            isCollectionViewTopConstraintZero = true
        } else if offset <= 100 && isCollectionViewTopConstraintZero {
            UIView.animate(withDuration: 0.3) {
                self.headerView.isHidden = false
                self.scrollToTopButton.isHidden = true
                self.view.layoutIfNeeded()
            }
            isCollectionViewTopConstraintZero = false
        }
    }
}

// MARK: - PollsCollectionViewCellDelegate

extension HomeVC: PollsCollectionViewCellDelegate {
    
    func didVote(in cell: PollsCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            viewModel.polls.remove(at: indexPath.row)
            collectionView.deleteItems(at: [indexPath])
            viewModel.updateActivePolls()
        }
    }
    
    func didTapFirstLikeButton(in cell: PollsCollectionViewCell) {
        print("First like button tapped in cell: \(cell)")
    }
    
    func didTapSecondLikeButton(in cell: PollsCollectionViewCell) {
        print("Second like button tapped in cell: \(cell)")
    }
}

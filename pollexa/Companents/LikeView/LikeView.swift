//
//  LikeView.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import UIKit

final class LikeView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet private weak var likedImageView: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    
    private var viewModel: LikeViewModel?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Public Methods
    
    func setData(viewModel: LikeViewModel) {
        self.viewModel = viewModel
        updateView()
    }
    
}

// MARK: - Actions

private extension LikeView {
    
    @IBAction func likedButtonTapped(_ sender: Any) {
        viewModel?.likeButtonTapped?()
    }
}

// MARK: - Private Methods

private extension LikeView {
    
    func commonInit() {
        loadFromNib()
        likeButton.layer.cornerRadius = 15
    }
    
    func loadFromNib() {
        Bundle.main.loadNibNamed(LikeView.className, owner: self)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        likedImageView.image = UIImage(named: viewModel.likedImageView ?? "")
    }
}

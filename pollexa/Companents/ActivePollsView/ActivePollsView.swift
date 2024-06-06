//
//  ActivePollsView.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import UIKit

final class ActivePollsView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var activePollsLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    // MARK: - Properties
    
    private var viewModel: ActivePollsViewModel?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        loadFromNib()
    }
    
    // MARK: - Public Methods
    
    func setData(viewModel: ActivePollsViewModel) {
        self.viewModel = viewModel
        updateView()
    }
    
    // MARK: - Actions
    
    @IBAction func detailButtonTapped(_ sender: Any) {
        viewModel?.detailButtonTapped?()
    }
}

// MARK: - Private Methods

private extension ActivePollsView {
    
    func loadFromNib() {
        Bundle.main.loadNibNamed(ActivePollsView.className, owner: self)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.layer.cornerRadius = 10
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        activePollsLabel.text = viewModel.activePollsText
        detailLabel.text = viewModel.detailText
    }
}

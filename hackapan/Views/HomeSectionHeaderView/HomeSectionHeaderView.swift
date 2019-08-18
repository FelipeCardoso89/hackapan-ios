//
//  HomeSectionHeaderView.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class HomeSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var viewModel: HomeSectionHeaderViewDTO? {
        didSet { self.update() }
    }
    
    private func update() {
        self.titleLabel.text = self.viewModel?.title
        self.subtitleLabel.text = self.viewModel?.subtitle
    }
    
}

extension HomeSectionHeaderView: ViewConfigurable {
    
    typealias ViewModel = HomeSectionHeaderViewDTO
    
    func configure(with viewModel: HomeSectionHeaderViewDTO) {
        self.viewModel = viewModel
    }
}

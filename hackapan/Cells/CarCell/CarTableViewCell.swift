//
//  CarTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var viewModel: CarTableViewCellDTO? {
        didSet { self.update() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupCellLayout()
    }
    
    private func update() {
        titleLabel.text = self.viewModel?.title
        subtitleLabel.text = self.viewModel?.subtitle
        
        if let image = self.viewModel?.image {
            iconImageView.image = UIImage(named: image)
        } else {
            iconImageView.image = nil
        }
    }
    
    private func setupCellLayout() {
        clipsToBounds = true
        
        iconImageView.layer.cornerRadius = 40.0
        iconImageView?.clipsToBounds = true
    }
}

extension CarTableViewCell: ViewConfigurable {
    
    typealias ViewModel = CarTableViewCellDTO
    
    func configure(with viewModel: CarTableViewCellDTO) {
        self.viewModel = viewModel
    }
}

//
//  ProfileTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    private var viewModel: ProfileTableViewCellDTO? {
        didSet { self.update() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupCellLayout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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

extension ProfileTableViewCell: ViewConfigurable {
    
    typealias ViewModel = ProfileTableViewCellDTO
    
    func configure(with viewModel: ProfileTableViewCellDTO) {
        self.viewModel = viewModel
    }
    
}

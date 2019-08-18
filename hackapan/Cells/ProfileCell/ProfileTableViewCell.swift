//
//  ProfileTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    private var viewModel: ProfileTableViewCellDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ProfileTableViewCell: ViewConfigurable {
    
    typealias ViewModel = ProfileTableViewCellDTO
    
    func configure(with viewModel: ProfileTableViewCellDTO) {
        self.viewModel = viewModel
    }
    
}

//
//  CarTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    private var viewModel: CarTableViewCellDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CarTableViewCell: ViewConfigurable {
    
    typealias ViewModel = CarTableViewCellDTO
    
    func configure(with viewModel: CarTableViewCellDTO) {
        self.viewModel = viewModel
    }
}

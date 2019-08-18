//
//  CallToActionTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CallToActionTableViewCell: UITableViewCell {

    private var viewModel: CallToActionTableViewCellDTO? {
        didSet {
            self.update()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func update() {
        self.titleLabel.text = self.viewModel?.title
    }
    
}

extension CallToActionTableViewCell: ViewConfigurable {
    
    typealias ViewModel = CallToActionTableViewCellDTO
    
    func configure(with viewModel: CallToActionTableViewCellDTO) {
        self.viewModel = viewModel
    }
}


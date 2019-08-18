//
//  CarCatalogCollectionViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CarCatalogCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var viewModel: CarCatalogCollectionViewCellDTO? {
        didSet { self.update() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupCellLayout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update() {
        
        if let image = self.viewModel?.icon {
            self.iconImageView.image = UIImage(named: image)
        } else {
            self.iconImageView.image = nil
        }
        
        self.titleLabel.text = self.viewModel?.title
        self.subtitleLabel.text = self.viewModel?.subtitle
    }

    private func setupCellLayout() {
        clipsToBounds = true
        
        layer.cornerRadius = 8.0
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8.0
        contentView.layer.masksToBounds = true
    }
}

extension CarCatalogCollectionViewCell: ViewConfigurable {
    
    typealias ViewModel = CarCatalogCollectionViewCellDTO
    
    func configure(with viewModel: CarCatalogCollectionViewCellDTO) {
        self.viewModel = viewModel
    }
}

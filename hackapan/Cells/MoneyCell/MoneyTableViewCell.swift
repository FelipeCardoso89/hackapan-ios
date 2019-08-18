//
//  MoneyTableViewCell.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit
import CurrencyText

class MoneyTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    private var viewModel: MoneyTableViewCellDTO? {
        didSet { self.update() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.keyboardType = .decimalPad
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func update() {
        
    }

}

extension MoneyTableViewCell: UITextFieldDelegate {
    
    
    
}

extension MoneyTableViewCell: ViewConfigurable {
    
    typealias ViewModel = MoneyTableViewCellDTO
    
    func configure(with viewModel: MoneyTableViewCellDTO) {
        self.viewModel = viewModel
    }
}

//
//  UITextField.swift
//  CurrencyText
//
//  Created by Felipe Lefèvre Marino on 12/26/18.
//

import UIKit

public extension UITextField {
    
    func updateSelectedTextRange(offsetFromEnd: Int) {
        if let updatedCursorPosition = position(from: endOfDocument, offset: offsetFromEnd) {
            selectedTextRange = textRange(from: updatedCursorPosition, to: updatedCursorPosition)
        }
    }
    
    var selectedTextRangeOffsetFromEnd: Int {
        return offset(from: endOfDocument, to: selectedTextRange?.end ?? endOfDocument)
    }
}

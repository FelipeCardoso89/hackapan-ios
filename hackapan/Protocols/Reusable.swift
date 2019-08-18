//
//  Reusable.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

protocol Reusable {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    static var reusableIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UIView: Reusable {}
extension Reusable where Self: UIView {
    
    static func nib(bundle: Bundle? = Bundle.main) -> UINib {
        return UINib(nibName: Self.reusableIdentifier, bundle: bundle)
    }
    
    static func loadFromNib(bundle: Bundle? = Bundle.main) -> Self? {
        return nib(bundle: bundle).instantiate(withOwner: Self.self, options: nil).first as? Self
    }
}

extension Reusable where Self: UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(of type: T.Type, bundle: Bundle? = Bundle.main) {
        register(T.nib(bundle: bundle), forCellWithReuseIdentifier: type.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withReuseIdentifier: type.reusableIdentifier, for: indexPath) as? T {
            return cell
        } else {
            return T()
        }
    }
}

extension Reusable where Self: UITableView {
    
    func registerCell<T: UITableViewCell>(of type: T.Type, bundle: Bundle? = Bundle.main) {
        register(T.nib(bundle: bundle), forCellReuseIdentifier: type.reusableIdentifier)
    }
    
    func registerHeaderFooterView<T: UIView>(of type: T.Type, bundle: Bundle? = Bundle.main) {
        register(T.nib(bundle: bundle), forHeaderFooterViewReuseIdentifier: type.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: type.reusableIdentifier, for: indexPath) as? T {
            return cell
        } else {
            return T(style: .default, reuseIdentifier: T.reusableIdentifier)
        }
    }
    
    func dequeueHeaderFooterView<T: UIView>(_ type: T.Type) -> T? {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: type.reusableIdentifier) as? T {
            return view
        } else {
            return T.loadFromNib()
        }
    }
}

extension UIViewController: Reusable {}
extension Reusable where Self: UIViewController {
    
    static func loadXib(from bundle: Bundle? = Bundle.main) -> Self {
        return Self(nibName: Self.reusableIdentifier, bundle: bundle)
    }
}

//
//  ProfileDelegate.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileDelegate {
    func viewController(viewController: UIViewController, didPick profile: Profile)
    func dismissViewController(viewController: UIViewController)
}


//
//  VehicleBrand.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct VehicleBrand: Hashable{
    let icon: String
    let title: String
    
    static func == (lhs: VehicleBrand, rhs: VehicleBrand) -> Bool {
        return lhs.title == rhs.title
    }
}

extension VehicleBrand {
    
    static func allBrands() -> [VehicleBrand] {
        return [
            VehicleBrand(icon: "chevrolet", title: "Chevrolet"),
            VehicleBrand(icon: "volkswagen", title: "Wolksvagen"),
            VehicleBrand(icon: "fiat", title: "Fiat"),
            VehicleBrand(icon: "toyota", title: "Toyota")
        ]
    }
    
    static func image(for brand: VehicleBrand) -> String? {
        return brand.icon
    }
}

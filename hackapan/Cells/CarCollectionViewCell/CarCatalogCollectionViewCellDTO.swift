//
//  CarCatalogCollectionViewCellDTO.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct CarCatalogCollectionViewCellDTO {
    let icon: String?
    let title: String
    let subtitle: String?
}

extension CarCatalogCollectionViewCellDTO {
    
    init(vehicle: Vehicle) {
        
        var subtitle = vehicle.brand
        
        if let yaerModel = vehicle.yaerModel {
            subtitle += " - "
            subtitle += String(yaerModel)
        }
        
        if let plate = vehicle.plate {
            subtitle += " - "
            subtitle += plate
        }
        
        self.init(
            icon: Vehicle.imageForVehicle(id: vehicle.id),
            title: vehicle.model,
            subtitle: subtitle
        )
    }

    init(brand: VehicleBrand) {
        self.init(
            icon: VehicleBrand.image(for: brand),
            title: brand.title,
            subtitle: nil
        )
    }
}

//
//  Vehicle.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Vehicle {
    let id: Int
    let situationId: Int
    let situtation: String
    let model: String
    let brand: String
    let color: String
    let year: Int
    let yaerModel: Int
    let plate: String
    let uf: String
    let city: String
}

extension Vehicle: Decodable {
    
    enum CodingKeys: String, CodingKey { // declaring our keys
        case id
        case situationId = "codSituation"
        case situation
        case model
        case brand = "factory"
        case color
        case year
        case yearModel
        case plate
        case uf
        case city
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let situationId = try container.decode(Int.self, forKey: .situationId)
        let situtation = try container.decode(String.self, forKey: .situation)
        let model = try container.decode(String.self, forKey: .model)
        let brand = try container.decode(String.self, forKey: .brand)
        let color = try container.decode(String.self, forKey: .color)
        let year = try container.decode(Int.self, forKey: .year)
        let yearModel = try container.decode(Int.self, forKey: .yearModel)
        let plate = try container.decode(String.self, forKey: .plate)
        let uf = try container.decode(String.self, forKey: .uf)
        let city = try container.decode(String.self, forKey: .city)
        
        self.init(
            id: id,
            situationId: situationId,
            situtation: situtation,
            model: model,
            brand: brand,
            color: color,
            year: year,
            yaerModel: yearModel,
            plate: plate,
            uf: uf,
            city: city
        )
    }
}

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
    let situationId: Int?
    let situtation: String?
    let model: String
    let brand: String
    let color: String?
    let year: Int?
    let yaerModel: Int?
    let plate: String?
    let uf: String?
    let city: String?
    let price: Int?

    static func imageForVehicle(id: Int) -> String {
        switch id {
        case 0:
            return "fiesta"
        default:
            return "car"
        }
    }
    
    static func ford() -> [Vehicle] {
        return [
            Vehicle.focus(),
            Vehicle.ecoSport(),
            Vehicle.fiesta()
        ]
    }
    
    static func chevrolet() -> [Vehicle] {
        return [
            Vehicle.camaro(),
            Vehicle.onix(),
            Vehicle.prisma()
        ]
    }
    
    static func wolksvagen() -> [Vehicle] {
        return [
            Vehicle.polo(),
            Vehicle.voyage(),
            Vehicle.gol()
        ]
    }
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
        case price
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
        let price = try container.decodeIfPresent(Int.self, forKey: .price)
        
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
            city: city,
            price: price
        )
    }
}


extension Vehicle {
    
    init(id: Int, model: String, brand: String, price: Int?) {
        self.init(
            id: id,
            situationId: nil,
            situtation: nil,
            model: model,
            brand: brand,
            color: nil,
            year: nil,
            yaerModel: nil,
            plate: nil,
            uf: nil,
            city: nil,
            price: price
        )
    }
    
    init(id: Int, model: String, brand: String) {
        self.init(
            id: id,
            model: model,
            brand: brand,
            price: nil
        )
    }
    
}

//FORD
extension Vehicle {
    
    static func fiesta() -> Vehicle {
        return Vehicle(id: 0, model: "Fiesta", brand: "Focus", price: 35000)
    }
    
    static func ecoSport() -> Vehicle {
        return Vehicle(id: 1, model: "EcoSport", brand: "Ford", price: 30000)
    }
    
    static func focus() -> Vehicle {
        return Vehicle(id: 2, model: "Focus", brand: "Ford", price: 28000)
    }
    
}

//Chevrolet
extension Vehicle {
    
    static func prisma() -> Vehicle {
        return Vehicle(id: 3, model: "Prisma", brand: "Chevrolet", price: 20000)
    }
    
    static func onix() -> Vehicle {
        return Vehicle(id: 4, model: "Onix", brand: "Chevrolet", price: 32000)
    }
    
    static func camaro() -> Vehicle {
        return Vehicle(id: 5, model: "Camaro", brand: "Chevrolet", price: 300000)
    }
    
}

//Wolksvagen
extension Vehicle {
    
    static func polo() -> Vehicle {
        return Vehicle(id: 6, model: "Polo", brand: "Wolksvagen", price: 14000)
    }
    
    static func gol() -> Vehicle {
        return Vehicle(id: 7, model: "Gol", brand: "Wolksvagen", price: 13460)
    }
    
    static func voyage() -> Vehicle {
        return Vehicle(id: 8, model: "Voyage", brand: "Wolksvagen", price: 23500)
    }
    
}

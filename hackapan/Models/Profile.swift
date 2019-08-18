//
//  Profile.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Profile {
    let name: String
    let cpf: String
    let rg: String
    let cep: String
    let city: String
    let uf: String
    let profession: String
    let income: String
    
    static func `default`() -> Profile {
        return Profile(
            name: "Ismael Nascimento",
            cpf: "123.456.789-10",
            rg: "12.345.567-89",
            cep: "12345678",
            city: "São Paulo",
            uf: "SP",
            profession: "Programador",
            income: "R$26.745,35"
        )
    }
    
    static func imageFor(_ profile: Profile) -> String? {
        switch profile.cpf {
        case "123.456.789-10":
            return "ismael"
        default:
            return nil 
        }
    }
    
}

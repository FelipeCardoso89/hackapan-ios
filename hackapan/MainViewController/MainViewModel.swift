//
//  MainViewModel.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum FormSection {
    case money(items: [Any]?)
    case car(items: [Any]?)
    case profile(items: [Any]?)
}

extension FormSection {
    
    var title: String? {
        switch self {
        case .money:
            return "Valor financiado"
        case .car:
            return "Carro"
        case .profile:
            return "Dados pessoais"
        }
    }
    
    var subtitle: String {
        switch self {
        case .money:
            return "Digite o valor que você quer financiar"
        case .car:
            return "Pesquise agora"
        case .profile:
            return "Nos diga quem é você"
        }
    }
    
    var items: [Any]? {
        switch self {
        case let .money(items):
            return items
        case let .car(items):
            return items
        case let .profile(items):
            return items
        }
    }
    
    var callToAction: String {
        
        switch self {
        case .money:
            return "Click aqui"
        case .car:
            return "Pesquisar veiculo"
        case .profile:
            return "Preencher seu perfil"
        }
    }
}

class MainViewModel {
    
    private var fields: [FormSection] = [
        .money(items: nil),
        .car(items: [Vehicle.fiesta()]),
        .profile(items: [Profile.default()])
    ]
    
    func numberFields(at section: Int) -> Int {
        return fields[section].items?.count ?? 1
    }
    
    func dto(at indexPath: IndexPath) -> Any? {
        
        let section = fields[indexPath.section]
        
        switch section {
        case .money:
            return MoneyTableViewCellDTO()
            
        case let .car(items):
        
            switch items?[indexPath.row] {
            case let vehicle as Vehicle:
                return CarTableViewCellDTO(
                    title: vehicle.model,
                    subtitle: "\(vehicle.brand) \(vehicle.yaerModel)",
                    image: Vehicle.imageForVehicle(id: vehicle.id)
                )
            default:
                return CallToActionTableViewCellDTO(title: section.callToAction)
            }
            
        case let .profile(items):
            
            switch items?[indexPath.row] {
            case let profile as Profile :
                return ProfileTableViewCellDTO(
                    title: profile.name,
                    subtitle: "CPF:\(profile.cpf)\nRG:\(profile.rg)",
                    image: Profile.imageFor(profile)
                )
                
            default:
                return CallToActionTableViewCellDTO(title: section.callToAction)
            }
        }
    }
    
    func dtohForHeader(at section: Int) -> Any? {
        let section = fields[section]
        return HomeSectionHeaderViewDTO(
            title: section.title ?? "",
            subtitle: section.subtitle
        )
    }
}

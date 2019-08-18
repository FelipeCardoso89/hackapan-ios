//
//  VehicleListViewController.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class VehicleListViewController: UIViewController {

    var vehicleItems = [Vehicle]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(of: CarCatalogCollectionViewCell.self)
    }


}

extension VehicleListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehicleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch vehicleItems[indexPath.item] {
        case let vehicle as Vehicle:
            let dto = CarCatalogCollectionViewCellDTO(vehicle: vehicle)
            return collection(collectionView, cellForItemAt: indexPath, forCarCatalogCollectionViewCellWith: dto)
        case let brand as VehicleBrand:
            let dto = CarCatalogCollectionViewCellDTO(brand: brand)
            return collection(collectionView, cellForItemAt: indexPath, forCarCatalogCollectionViewCellWith: dto)
        default:
            return UICollectionViewCell()
        }
    }
    
    
    private func collection(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, forCarCatalogCollectionViewCellWith dto: CarCatalogCollectionViewCellDTO) -> CarCatalogCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CarCatalogCollectionViewCell.self, for: indexPath)
        cell.configure(with: dto)
        return cell
    }
    
}


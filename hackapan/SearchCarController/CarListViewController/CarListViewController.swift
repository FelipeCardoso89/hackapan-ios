//
//  CarListViewController.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class CarListViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var vehicleItems: [Any] = VehicleBrand.allBrands()
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Modelo, marca ou a placa do veiculo"
        controller.searchBar.delegate = self
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(of: CarCatalogCollectionViewCell.self)
    }
    
    @IBAction func cancel(_ sender: Any) {
        (self.navigationController as? SearchCarNavigationController)?.searchCarDelegate?.dismissViewController(viewController: self)
    }
    
}

extension CarListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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



extension CarListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.vehicleItems = VehicleBrand.allBrands()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else {
            return
        }
       
        if let m = matches(for: #"[a-zA-Z]{3}[0-9]{4}"#, in: text).first?.uppercased() {
            
            SVProgressHUD.show(withStatus: "Buscando...")
            SinespService.shared.search(plate: m) { (result) in
                switch result {
                case let .success(v):
                    self.vehicleItems = [v]
                    SVProgressHUD.dismiss()
                case .failure:
                    self.vehicleItems = VehicleBrand.allBrands()
                    SVProgressHUD.showError(withStatus: "Não encontrado")
                    SVProgressHUD.dismiss(withDelay: 1)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
        } else {
            print("Fail")
        }
    }
    
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

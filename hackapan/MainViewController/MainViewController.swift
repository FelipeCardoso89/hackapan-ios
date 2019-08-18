//
//  MainViewController.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 17/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 22
        registerCells()
    }
    
    private func registerCells() {
        tableView.registerCell(of: MoneyTableViewCell.self)
        tableView.registerCell(of: CarTableViewCell.self)
        tableView.registerCell(of: ProfileTableViewCell.self)
        tableView.registerCell(of: CallToActionTableViewCell.self)
        tableView.registerHeaderFooterView(of: HomeSectionHeaderView.self)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberFields(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.dto(at: indexPath) {
        case let dto as MoneyTableViewCellDTO:
            return table(tableView, cellAt: indexPath, forMoneyTableViewCellWith: dto)
        case let dto as CarTableViewCellDTO:
            return self.table(tableView, cellAt: indexPath, forCarTableViewCellWith: dto)
        case let dto as ProfileTableViewCellDTO:
            return self.table(tableView, cellAt: indexPath, forProfileTableViewCellWith: dto)
        case let dto as CallToActionTableViewCellDTO:
            return self.table(tableView, cellAt: indexPath, forCallToActionTableViewCellWith: dto)
        default:
            return UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch viewModel.dtohForHeader(at: section) {
        case let dto as HomeSectionHeaderViewDTO:
            return self.table(tableView, forHomeSectionHeaderViewWith: dto)
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    private func table(_ tableView: UITableView, cellAt indexPath: IndexPath, forMoneyTableViewCellWith dto: MoneyTableViewCellDTO) -> MoneyTableViewCell {
        let cell = tableView.dequeueReusableCell(MoneyTableViewCell.self, for: indexPath)
        cell.configure(with: dto)
        return cell
    }
    
    private func table(_ tableView: UITableView, cellAt indexPath: IndexPath, forCarTableViewCellWith dto: CarTableViewCellDTO) -> CarTableViewCell {
        let cell = tableView.dequeueReusableCell(CarTableViewCell.self, for: indexPath)
        cell.configure(with: dto)
        return cell
    }
    
    private func table(_ tableView: UITableView, cellAt indexPath: IndexPath, forProfileTableViewCellWith dto: ProfileTableViewCellDTO) -> ProfileTableViewCell {
        let cell = tableView.dequeueReusableCell(ProfileTableViewCell.self, for: indexPath)
        cell.configure(with: dto)
        return cell
    }
    
    private func table(_ tableView: UITableView, cellAt indexPath: IndexPath, forCallToActionTableViewCellWith dto: CallToActionTableViewCellDTO) -> CallToActionTableViewCell {
        let cell = tableView.dequeueReusableCell(CallToActionTableViewCell.self, for: indexPath)
        cell.configure(with: dto)
        return cell
    }
    
    private func table(_ tableView: UITableView, forHomeSectionHeaderViewWith dto: HomeSectionHeaderViewDTO) -> HomeSectionHeaderView? {
        guard  let cell = tableView.dequeueHeaderFooterView(HomeSectionHeaderView.self) else {
            return nil
        }
        cell.configure(with: dto)
        return cell
    }
    
}

//
//  CellConfiguratorFactory.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import Foundation


typealias SearchItemCellConfig = TableViewCellConfigurator<SearchItemCell, AbstractCellViewModel>
typealias ShimmerItemCellConfig = TableViewCellConfigurator<SearchShimmerCell, AbstractCellViewModel>


// collection of cell configurator
class CellConfiguratorFactory {
    private var items: [CellConfigurator] = []
    
    //add cell configurator converted from cellviewmodel
    public func addAsCellConfigurator(cellViewModel: AbstractCellViewModel) {
        let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
        items.append(cellConfig)
    }
    
    public func addCellConfigurator(cellConfig: CellConfigurator) {
        items.append(cellConfig)
    }
    
    public func updateAsCellConfigurator(cellViewModel: AbstractCellViewModel, at index: Int) {
        let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
        items[index] = cellConfig
    }
    
    public func insertCellConfigurator(cellConfig: CellConfigurator, at index: Int) {
        items.insert(cellConfig, at: index)
    }
    
    public func getCellConfigurator(at index: Int) -> CellConfigurator {
        return items[index]
    }
    
    public func updateCellConfigurator(cellConfig: CellConfigurator, at index: Int) {
        items[index] = cellConfig
    }
    
    public func getCount() -> Int {
        return items.count
    }
    
    public func getLastItem() -> CellConfigurator? {
        return items.last
    }
    
    public func removeCellConfigurator(at index: Int) {
        items.remove(at: index)
    }
    
    public func removeAll() {
        return items.removeAll()
    }
}

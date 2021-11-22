//
//  GenericCell.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import UIKit


/* Abstraction of tableview cell will contain cellViewModel and reuseIdentifier property will cell data, also configure function to bind data to ui */
protocol AbstractSearchCell: AnyObject{
    var viewModel: AbstractCellViewModel? {get}
    static var cellReuseIdentifier: String {set get}
    
    func configure(viewModel: AbstractCellViewModel)
    func applyTheme()
}

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}


protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}


// this class will be used to bind cellviewmodel to cell
class TableViewCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}

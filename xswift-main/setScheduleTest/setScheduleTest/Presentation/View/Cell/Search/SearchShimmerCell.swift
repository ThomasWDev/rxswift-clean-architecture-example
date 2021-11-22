//
//  ShimmerCell.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import UIKit

class SearchShimmerCell: SearchItemCell {
    typealias DataType = AbstractCellViewModel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func configure(data: DataType) {
        applyTheme()
        containerView.layer.borderWidth = 0
        containerView.layer.borderColor = UIColor.clear.cgColor
        
        //shmmer skeleton animation
        ShimmerHelper.startShimmerAnimation(viewlist: [lblTitle, lblOverview, ivPoster])
    }
    
    // when theme change (dark or normal)
    override public func applyTheme() {
        switch (traitCollection.userInterfaceStyle) {
            case .dark:
                containerView.backgroundColor = .black
                containerView.layer.borderColor = UIColor.white.cgColor
                backgroundView?.backgroundColor = .black
                break

            case .light:
                containerView.backgroundColor = .white
                containerView.layer.borderColor = UIColor.black.cgColor
                break

            default:
                break
        }
    }
}

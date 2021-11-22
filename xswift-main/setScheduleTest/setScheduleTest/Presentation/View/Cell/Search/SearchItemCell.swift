//
//  SearchItemCell.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 30/10/21.
//

import UIKit


class SearchItemCell : UITableViewCell, ConfigurableCell {
    typealias DataType = AbstractCellViewModel
    
    var imageUrlAtCurrentIndex: String?
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isSkeletonable = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.isSkeletonable = true
        lbl.skeletonLineSpacing = 10
        lbl.multilineSpacing = 10
        return lbl
    }()
    
    let lblOverview : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.isSkeletonable = true
        lbl.skeletonLineSpacing = 10
        lbl.multilineSpacing = 10
        return lbl
    }()
    
    let ivPoster : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "img_avatar"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 45
        imgView.isSkeletonable = true
        return imgView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ivPoster.image = nil
        lblTitle.text = ""
        lblOverview.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(containerView)
        containerView.addSubview(ivPoster)
        containerView.addSubview(lblTitle)
        containerView.addSubview(lblOverview)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.width, height: 0, enableInsets: false)
        ivPoster.anchor(top: containerView.topAnchor, left:  containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 90, enableInsets: false)
        lblTitle.anchor(top: containerView.topAnchor, left: ivPoster.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 15, width: frame.size.width-30, height: 0, enableInsets: false)
        lblOverview.anchor(top: lblTitle.bottomAnchor, left: ivPoster.rightAnchor, bottom: ivPoster.bottomAnchor, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 15, paddingRight: 15, width: frame.size.width-30, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(data: DataType) {
        ShimmerHelper.startShimmerAnimation(view: ivPoster)
        lblTitle.text = data.title
        lblOverview.text = data.overview
        
        let posterUrl = "\(AppConfig.shared.getServerConfig().getMediaBaseUrl())/\(data.thumbnail ?? "" )"
        imageUrlAtCurrentIndex = posterUrl
        ivPoster.loadImage(from: posterUrl, completionHandler: { [weak self] url,image,isFinished  in
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.ivPoster.image = image
            ShimmerHelper.stopShimmerAnimation(view: weakSelf.ivPoster)
        })
        
        //apply  change theme
        applyTheme()
    }
    
    // when theme change (dark or normal)
    public func applyTheme() {
        switch (traitCollection.userInterfaceStyle) {
            case .dark:
                containerView.backgroundColor = .lightGray
                containerView.layer.borderColor = UIColor.white.cgColor
                lblTitle.textColor = .white
                lblOverview.textColor = .white
                backgroundView?.backgroundColor = .black
                break

            case .light:
                containerView.backgroundColor = .white
                containerView.layer.borderColor = UIColor.black.cgColor
                lblTitle.textColor = .black
                lblOverview.textColor = .darkGray
                break

            default:
                break
        }
    }
}

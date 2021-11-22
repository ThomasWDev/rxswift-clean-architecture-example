//
//  BaseViewController.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 29/10/21.
//

import UIKit

public class BaseViewController: UIViewController, UIScrollViewDelegate, Storyboarded {
    public lazy var TAG = self.description
    var viewModel: AbstractViewModel!
    public var isShimmerNeeded: Bool = false
    public var isPaginationEnabled: Bool = true
    
    init(viewModel: AbstractViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bindViewModel()
        
        initNavigationBar()
        
        initView()
        
        setDataSource()
    }
    
    // bind respective viewmodel
    public func bindViewModel() {
        // TODO: Implement in child Class
    }
    
    // initialize navigation bar
    public func initNavigationBar() {
        // TODO: Implement in child Class
    }
    
    //initialize its subview
    public func initView() {
        // Not Implemented Yet
    }
    
    //set its data source for subview/table/collection view
    public func setDataSource() {
        // TODO: Implement in child Class
    }
    
    //when theme change, we can also define dark mode color option in color asset
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch (traitCollection.userInterfaceStyle) {
            case .dark:
                self.applyDarkTheme()
                break
                
            case .light:
                self.applyNormalTheme()
                break
                
            default:
                break
        }
    }
    
    public func applyDarkTheme() {
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.backgroundColor = .black
    }
    
    public func applyNormalTheme() {
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
    }
    
    //disbale keyboard
    public func disableKeyboard(tappingView: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tappingView.isUserInteractionEnabled = true
        tappingView.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //show alert dialog
    public func alert(_ title: String, text: String, actionTitle: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: handler))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Shimmer
    public func startShimmerAnimation(views: [UIView]) {
        ShimmerHelper.startShimmerAnimation(viewlist: views)
    }
    
    public func stopShimmerAnimation(views: [UIView]) {
        ShimmerHelper.stopShimmerAnimation(viewlist: views)
    }
    
    // MARK: Pagination
    public enum ScrollDirection : Int {
        case none
        case right
        case left
        case up
        case down
        case crazy
    }
    
    public var lastContentOffset: CGFloat = 0.0
    
    public func getScrollDirection(scrollView:UIScrollView) -> ScrollDirection{
        var scrollDirection: ScrollDirection = .none
        
        if lastContentOffset > scrollView.contentOffset.y {
            scrollDirection = .up
        } else if lastContentOffset < scrollView.contentOffset.y {
            scrollDirection = .down
        }
        
        lastContentOffset = scrollView.contentOffset.y
        
        return scrollDirection
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            onEndScrolling(scView: scrollView)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onEndScrolling(scView: scrollView)
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate) {
            onEndScrolling(scView: scrollView)
        }
    }
    
    // To be overriden by child classes
    public func hasMoreData() -> Bool{
        fatalError("Must Override")
        return false
    }
    
    public func loadMoreData() -> Void{
        fatalError("Must Override")
    }
    
    public func getFirstVisibleItem() -> IndexPath{
        return IndexPath(row: 0, section: 0)
    }
    
    public func getLastVisibleItem() -> IndexPath{
        fatalError("Must Override")
        return IndexPath(row: 0, section: 0)
    }
    
    public func getTotalDataCount() -> Int{
        fatalError("Must Override")
        return 0
    }
    
    public func getPaginationOffset() -> Int{
        fatalError("Must Override")
        return 20
    }
    
    public func onEndScrolling(scView: UIScrollView) -> Void{
        if getScrollDirection(scrollView: scView) == .down{
            if(hasMoreData()){
                let firstVisibleItem = getFirstVisibleItem()
                let lastVisibleItem = getLastVisibleItem()
                
//                print("\(TAG) -- scrollViewDidScroll() -- down, lastVisibleItem = \(lastVisibleItem), dataCount = \(getTotalDataCount())")
                
                //load more data if indexpath is greater than total data count/offset
                if ( lastVisibleItem.row > getTotalDataCount()-getPaginationOffset()) {
                    loadMoreData()
                }
            }
        }
    }
}




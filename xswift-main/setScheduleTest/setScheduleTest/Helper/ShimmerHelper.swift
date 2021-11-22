//
//  ShimmerHelper.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/8/21.
//

import UIKit


class ShimmerHelper: NSObject {

    //start shimmer animation
    public static func startShimmerAnimation(viewlist: [UIView]) -> Void {
        //shmmer skeleton animation
        let gradient = SkeletonGradient(baseColor: UIColor.lightGray)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)

        for  view in viewlist{
            view.isSkeletonable = true
            if view.isKind(of: UITextView.self){
                (view as! UITextView).linesCornerRadius = 5
            }else if view.isKind(of: UILabel.self){
                (view as! UILabel).linesCornerRadius = 5
            }
            
            view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        }
    }
        
    //stop shimmer animation
    public static func stopShimmerAnimation(viewlist: [UIView]) -> Void {
        for  view in viewlist{
            view.hideSkeleton()
        }
        
    }
    
    //start shimmer animation
    public static func startShimmerAnimation(view: UIView) -> Void {
        //shmmer skeleton animation
        let gradient = SkeletonGradient(baseColor: UIColor.lightGray)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)

        view.isSkeletonable = true 
        if view.isKind(of: UITextView.self){
            (view as! UITextView).linesCornerRadius = 5
        }else if view.isKind(of: UILabel.self){
            (view as! UILabel).linesCornerRadius = 5
        }
        
        view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        
    }
        
    //stop shimmer animation
    public static func stopShimmerAnimation(view: UIView) -> Void {
        view.hideSkeleton()
    }
}

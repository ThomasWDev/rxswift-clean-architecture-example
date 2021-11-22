//
//  DetailsViewController.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: BaseViewController {
    // MARK: Non UI Objects
    public var movie: Movie!
    public var movieViewModel: AbstractMovieViewModel!
    private let disposeBag = DisposeBag()
    private let movieDetailsTrigger = PublishSubject<Int>()
    
    // MARK: UI Objects
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblTotalVote: UILabel!
    @IBOutlet weak var uivInfoContainer: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleasingYear: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblOverviewTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        super.initView()
        ivPoster.contentMode = .scaleAspectFill
        
        //start shimmer animation
        startShimmerAnimation()
    }
    
    override func initNavigationBar() {
        self.navigationItem.title = "Details"
    }
    
    override func bindViewModel() {
        movieViewModel = (viewModel as! AbstractMovieViewModel)
        let movieInput = MovieViewModel.MovieInput(movieDetailsTrigger: movieDetailsTrigger)
        let movieOutput = movieViewModel.getMovieOutput(input: movieInput)
        
        //receive response and populate UI
        movieOutput.movieDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                guard let weakSelf = self, let response = response else {
                    return
                }
                
                print("\(weakSelf.TAG) -- bindViewModel() -- response = \(response)")
                weakSelf.bindData(model: response)
            }).disposed(by: disposeBag)
        
        // detect error and show error message
        movieOutput.errorTracker
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {
            [weak self] error in
            
            guard let weakSelf = self, let error = error else {
                return
            }
            
            print("\(String(describing: weakSelf.TAG)) -- bindViewModel() -- error  -- code = \(error.errorCode), message = \(error.errorMessage)")
        }).disposed(by: disposeBag)
        
        triggerFetcingMovieDetails(movieId: movie.id ?? 0)
    }
    
    public func triggerFetcingMovieDetails(movieId: Int) {
        movieDetailsTrigger.onNext(movieId)
    }
    
    private func bindData(model: Movie) {
        let posterUrl = "\(AppConfig.shared.getServerConfig().getMediaBaseUrl())\(model.posterPath ?? "")"
        
        ivPoster.loadImage(from: posterUrl, completionHandler: {
            [weak self] url, image, isFinished in
            
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.ivPoster.image = image?.decodedImage(size: weakSelf.ivPoster.bounds.size)
            weakSelf.stopShimmerAnimation(views: [weakSelf.ivPoster])
        })
        
        lblVoteAverage.text = "Vote Avg : \(model.voteAverage ?? 0)"
        lblTotalVote.text = "Vote Total : \(model.voteCount ?? 0)"
        lblName.text = "Name: \(model.originalTitle ?? "")"
        lblReleasingYear.text = "Releasing Date : \(model.releaseDate ?? "")"
        lblLanguage.text = "Popularity : \(model.popularity ?? 0)"
        lblOverview.text = "\(model.overview ?? "")"
        
        //stop shimmer
        stopShimmerAnimation()
    }
    
    private func startShimmerAnimation() -> Void {
       //shmmer skeleton animation
        startShimmerAnimation(views: [ivPoster, lblVoteAverage, lblTotalVote, uivInfoContainer, lblOverviewTitle, lblOverview])
   }
       
   //stop shimmer animation
   private func stopShimmerAnimation() -> Void {
        stopShimmerAnimation(views: [lblVoteAverage, lblTotalVote, uivInfoContainer, lblOverviewTitle, lblOverview])
   }
}

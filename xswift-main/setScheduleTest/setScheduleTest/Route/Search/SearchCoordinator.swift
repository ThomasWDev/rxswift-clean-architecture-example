//
//  RootCoordinator.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 31/7/21.
//

import UIKit

class SearchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        let repository = SearchRepository(apiClient: APIClient.shared)
        let usecase = SearchUsecase(repository: repository)
        let viewModel = SearchViewModel(usecase: usecase)
        let vc = SearchViewController(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func showDetailsController(movie: Movie) {
        let repository = MovieRepository(apiClient: APIClient.shared)
        let usecase = MovieUsecase(repository: repository)
        let viewModel = MovieViewModel(usecase: usecase)
        let vc = DetailsViewController.instantiate(viewModel: viewModel)
        vc.movie = movie
        self.navigationController.pushViewController(vc, animated: true)
    }
}

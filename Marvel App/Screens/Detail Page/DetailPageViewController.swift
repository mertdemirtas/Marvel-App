//
//  DetailPageViewController.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import UIKit
import RxRelay
import RxSwift

class DetailPageViewController: BaseViewController<DetailPageViewModel> {
    
    private lazy var characterDetailContainerView: CharacterDetailContainerView = {
        let temp = CharacterDetailContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func addViewComponents() {
        view.addSubview(characterDetailContainerView)
        
        NSLayoutConstraint.activate([
            characterDetailContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterDetailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterDetailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterDetailContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DetailPageViewController: DetailPageViewModelDelegate {
    func reloadData() {
        characterDetailContainerView.setData(by: viewModel.getData())
        characterDetailContainerView.reloadData()
    }
}

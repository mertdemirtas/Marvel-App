//
//  MainPageViewController.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 1.09.2022.
//

import UIKit
import RxSwift
import SwiftUI

class MainPageViewController: BaseViewController<MainPageViewModel> {
    // MARK: Constants
    private let cellHeight = 200.0
    
    // MARK: Components
    private lazy var collectionView: BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let temp = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        temp.dataSource = self
        temp.delegate = self
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.registerCell(cells: [CharacterCardCollectionViewCell.self])

        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.startRequest()
    }
    
    override func addViewComponents() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: CollectionView Extensions
extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getItemCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCardCollectionViewCell", for: indexPath) as? CharacterCardCollectionViewCell else { return BaseCollectionViewCell()}
        guard let data = viewModel.getCharacterData(at: indexPath) else { return cell }
        cell.setData(data: data)
        cell.genericView.setButtonAction(action: {
            self.navigationController?.pushViewController(DetailPageBuilder.build(id: data.id, characterName: data.name, imageURLString: data.image), animated: true)
        })
        return cell
    }
}

extension MainPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.row == ((viewModel.getItemCount()) - 1)) {
            viewModel.getMoreData()
        }
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: cellHeight)
    }
}

// MARK: Viewmodel Extensions
extension MainPageViewController: MainPageViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
        collectionView.reloadInputViews()
    }
}

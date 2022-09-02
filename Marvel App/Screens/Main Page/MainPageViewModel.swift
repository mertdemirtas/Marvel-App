//
//  MainPageViewModel.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 1.09.2022.
//

import Foundation
import RxRelay

protocol MainPageViewModelDelegate: AnyObject {
    func reloadData()
}


class MainPageViewModel: BaseViewModel {
    private let networkManager = NetworkManager()
    
    private var items = [CharacterCardData]()
    private lazy var currentOffset = 0
    private lazy var totalCount = 0
    
    private var endpoint: Endpoint!
    
    weak var delegate: MainPageViewModelDelegate?
    
    public func startRequest() {
        prepareEndpoint()
    }
    
    private func prepareEndpoint() {
        endpoint = CharacterListRequest(currentOffset: currentOffset)
        getData(endpoint: endpoint)
    }
    
    private func getData(endpoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endpoint, completionHandler: { [weak self] (result: MarvelCharacterModel) in
            self?.bindData(result: result)
            self?.loading.onNext(false)
        })
    }
    
    private func bindData(result: MarvelCharacterModel) {
        totalCount = result.data?.total ?? 0
        if let formattedData = MainPageFormatter.formatToCharacterCardData(marvelModel: result) {
            currentOffset += 20
            items += formattedData
            delegate?.reloadData()
        }
    }
    
    public func getCharacterData(at index: IndexPath) -> CharacterCardData? {
        return items[index.item]
    }
    
    public func getItemCount() -> Int {
        return items.count
    }
    
    public func shouldLoadMoreData(_ rowIndex: Int) -> Bool {
        if (currentOffset < totalCount && rowIndex == items.count-1) {
            return true
        } else {
            return false
        }
    }
    
    public func getMoreData() {
        currentOffset += 20
        prepareEndpoint()
    }
}

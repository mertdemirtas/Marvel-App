//
//  DetailPageViewModel.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import RxSwift

protocol DetailPageViewModelDelegate: AnyObject {
    func reloadData()
}

class DetailPageViewModel: BaseViewModel {
    private let networkManager = NetworkManager()
    public var data: CharacterDetailData?
    
    weak var delegate: DetailPageViewModelDelegate?
    
    private var characterID: Int
    private var characterName: String
    private var imageURLString: String
    
    init(characterID: Int, characterName: String, imageURLString: String) {
        self.characterID = characterID
        self.characterName = characterName
        self.imageURLString = imageURLString
        super.init()
        prepareRequest()
    }
    
    private func prepareRequest() {
        let endpoint = CharacterDetailRequest(characterId: characterID)
        getData(endpoint: endpoint)
    }
    
    private func getData(endpoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endpoint, completionHandler: { [weak self] (result: MarvelComicsModel) in
            self?.bindData(result: result)
            self?.delegate?.reloadData()
            self?.loading.onNext(false)
        })
    }
    
    private func bindData(result: MarvelComicsModel) {
        data = CharacterDetailData(name: characterName, image: imageURLString, comics: result.data?.results)
        delegate?.reloadData()
    }
    
    public func getData() -> CharacterDetailData? {
        return data ?? nil
    }
}

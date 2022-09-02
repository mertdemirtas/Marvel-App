//
//  CharacterListRequest.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import Alamofire

class CharacterDetailRequest: Endpoint {
    var networkConstants: NetworkConstants = MarvelNetworkConstants.returnConstants()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var characterId: Int
    
    init(characterId: Int) {
        self.characterId = characterId
        preparePath()
    }
    
    private func preparePath() {
        path = "characters/" + "\(characterId)" + "/comics" + "?ts=\(networkConstants.ts)" + "&apikey=\(networkConstants.apiKey)" + "&hash=\(networkConstants.hashKey)" + "&orderBy=onsaleDate" + "&limit=10"
    }
}

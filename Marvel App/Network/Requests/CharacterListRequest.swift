//
//  CharacterListRequest.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import Alamofire

class CharacterListRequest: Endpoint {
    var networkConstants: NetworkConstants = MarvelNetworkConstants.returnConstants()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var currentOffset: Int
    
    init(currentOffset: Int) {
        self.currentOffset = currentOffset
        preparePath()
    }
    
    private func preparePath() {
        path = "characters?ts=\(networkConstants.ts)" + "&apikey=\(networkConstants.apiKey)" + "&hash=\(networkConstants.hashKey)" + "&limit=20" + "&offset=\(currentOffset)"
    }
}

//
//  MarvelNetworkConstants.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation

class MarvelNetworkConstants {
    class func returnConstants() -> NetworkConstants {
        let constants = NetworkConstants(apiKey: "510458feadd3f594af1147b6a29b4595", apiURL: "https://gateway.marvel.com/v1/public/", ts: "1", hashKey: "460a01fa74a5504688f14fd07a718622")
        return constants
    }
}

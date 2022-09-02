//
//  MainPageFormatter.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation

class MainPageFormatter {
    class func formatToCharacterCardData(marvelModel: MarvelCharacterModel) -> [CharacterCardData]? {
        var temp = [CharacterCardData]()
        if let data = marvelModel.data?.results {
            for element in data {
                temp.append(CharacterCardData(name: element.name, image: (element.thumbnail?.path ?? "") + "." + "\(element.thumbnail?.thumbnailExtension ?? "jpg")", id: element.id))
            }
        }
        return temp
    }
}

//
//  DetailPageBuilder.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 2.09.2022.
//

import Foundation
import UIKit

class DetailPageBuilder {
    class func build(id: Int?, characterName: String?, imageURLString: String?) -> UIViewController {
        let viewModel = DetailPageViewModel(characterID: id ?? 0, characterName: characterName ?? "", imageURLString: imageURLString ?? "")
        let vc = DetailPageViewController(viewModel: viewModel)
        vc.title = characterName
        return vc
    }
}

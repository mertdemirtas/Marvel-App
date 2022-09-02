//
//  MainPageBuilder.swift
//  Marvel App
//
//  Created by Mert Demirtaş on 1.09.2022.
//

import Foundation
import UIKit

class MainPageBuilder {
    class func build() -> UIViewController {
        let viewModel = MainPageViewModel()
        let vc = MainPageViewController(viewModel: viewModel)
        vc.title = "Marvel App"
        return vc
    }
}

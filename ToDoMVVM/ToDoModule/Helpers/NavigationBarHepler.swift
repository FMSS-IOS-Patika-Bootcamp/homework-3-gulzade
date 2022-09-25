//
//  NavigationBarHepler.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import UIKit

class NavigationBarHepler {
    static func changeNavBarAppearance() {
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setBackButtonBackgroundImage(UIImage(systemName: "list.bullet.indent"), for: .normal, barMetrics: .default)
        
        let navAppearance = UINavigationBar.appearance()
        
        let emptyImage = UIImage()
        navAppearance.backIndicatorImage = emptyImage
        navAppearance.backIndicatorTransitionMaskImage = emptyImage
        
    }
}

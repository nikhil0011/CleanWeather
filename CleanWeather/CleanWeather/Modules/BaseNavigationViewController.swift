//
//  BaseNa.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//


import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        nvc.navigationBar.barStyle = .default
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = LColor.surface
        appearance.titleTextAttributes = [
            .foregroundColor: LColor.primary,
            .font: AppFont.regularFont(16)
        ]
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        navigationBar.tintColor = LColor.primary
    }
    
}


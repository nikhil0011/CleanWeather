//
//  ViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var pageview: LandingPageView = LandingPageView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.stack(pageview)
        #if Preprod
        print("nn")
        #endif
        #if Staging
        print("stage")
        #endif
        fetch()
        // Do any additional setup after loading the view.
    }
    
    func fetch() {
        Network.catalogue { (results) in
            switch results {
            case .success(let data):
                print("Suuccess")
            case .failure(let error):
                print("failure")

            }
        }
    }
    
}


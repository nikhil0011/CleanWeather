//
//  ViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


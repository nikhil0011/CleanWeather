//
//  Extensions.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import UIKit
extension UIBarButtonItem {
    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return menuBarItem
    }
}
extension UIViewController {
    func addRightBarItem(image: String, action: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: action, imageName: image)
    }
    func customiseBackItem(image: String, action: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: image),
            style: .plain,
            target: self,
            action: action
        )
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    func enableInteractiveGesture() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
extension UIViewController {
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

// 
//  HomeView.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
    }

    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Pokemon Home")
        navItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(done))
        navBar.setItems([navItem], animated: false)
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true

        self.view.addSubview(navBar)
    }

    @objc func done() { // remove @objc for Swift 3

    }
}


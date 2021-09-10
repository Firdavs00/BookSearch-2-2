//
//  HomeViewController.swift
//  BookSearch
//
//  Created by MacBook Pro on 10/09/21.
//

import UIKit

class HomeViewController: UIViewController {
let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

// Mark: - Methods
    func initView(){
        addNavigationBar()
    }
    func addNavigationBar(){
        title = "The world of books"
        navigationItem.searchController = searchController
    }

}

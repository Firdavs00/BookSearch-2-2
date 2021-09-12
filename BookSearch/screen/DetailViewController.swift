//
//  DetailViewController.swift
//  BookSearch
//
//  Created by MacBook Pro on 11/09/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var kitobNomi1: UILabel!
    @IBOutlet weak var aftir1: UILabel!
    @IBOutlet weak var tavsifi: UILabel!
    
    var searchB: BookModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        kitobNomi1.text = searchB?.items
        
        
    }


}

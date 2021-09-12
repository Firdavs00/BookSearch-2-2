//
//  HomeViewController.swift
//  BookSearch
//
//  Created by MacBook Pro on 10/09/21.
//

import UIKit
import Alamofire
import Kingfisher
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate {
    var items: Array<Item> = Array()
//ApiPostList funksiyamiz orqali API dan malumotlarni chaqirib olishda va parsing  qilishda  foydalanimiz
    func ApiPostList() {
        AFHttp.get(url: AFHttp.API_POST_LIST + searchBar.text!, params: AFHttp.paramsEmpty(), handler: {respons in
            switch respons.result{
            case .success:
                do {
                    let decodedData = try JSONDecoder().decode(BookModel.self, from: respons.data!)
                    self.items = decodedData.items
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("error decod data")
                    DispatchQueue.main.async {
                        self.items = []
                        self.tableView.reloadData()
                    }
                }
            case .failure(_):
                print("eror")
            }
        })
    }
    @IBOutlet weak var tableView: UITableView!
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    // Mark: - Methods
    func initView(){
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        addNavigationBar()
    }
    func addNavigationBar(){
        title = "The world of books"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search , target: self , action: #selector(rightSearchTapped))
    }
    @objc func rightSearchTapped() {
        navigationItem.titleView = searchBar
        ApiPostList()
//        searchBar.showsCancelButton = true
    }
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //
    //    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        ApiPostList()
        print("opened")
    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //      performRequest(with: bookURL + searchBar.text!)
    //print("open")
    //    }
    
    //    Mark: - TabView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
//tableView funksiyamizda parsing bolgan malumotlarimizni cell da ko'rsatishda foydalanamiz
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as! PostTableViewCell
        let item = items[indexPath.row]
        cell.kitobName.text = item.volumeInfo.title
        cell.aftirName.text = item.volumeInfo.authors.first
        cell.images.kf.setImage(with: getImageURL(item.volumeInfo.imageLinks.smallThumbnail))
        
        return cell
    }
//getImageURL funksiyamiz orqali esa Api dan kelayotgan image rasmlarimizning URL i http bo'lib kelayotgan ekan shuni uchun http ga "s" qo'shib oldik
    func getImageURL(_ urlString: String) -> URL {
        var str = urlString
        str.insert("s", at: str.index(str.startIndex,offsetBy: 4))
        return URL(string: str)!
    }
// tableView funksiyamizda celda kelgan malumotlarni bosilganda to'liq malumot olishda foydalanamiz
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        DispatchQueue.main.async {
            vc.kitobNomi1.text = self.items[indexPath.row].volumeInfo.title
            vc.aftir1.text = self.items[indexPath.row].volumeInfo.authors.first
            vc.tavsifi.text = self.items[indexPath.row].volumeInfo.description
            vc.image1.kf.setImage(with: self.getImageURL(self.items[indexPath.row].volumeInfo.imageLinks.thumbnail))
        }

navigationController?.pushViewController(vc, animated: true)
    }
    //  cell o’lchami
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}


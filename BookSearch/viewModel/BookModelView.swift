//
//  BookModelView.swift
//  BookSearch
//
//  Created by MacBook Pro on 11/09/21.
//
//
//import Foundation
//class BookModelView: ObservableObject {
//@Published var posts = [BookModel]()
//    
//    func ApiPostList() {
//        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: {respons in
//            
//            switch respons.result{
//            case .success:
//                let posts = try? JSONDecoder().decode([BookModel].self, from: respons.data!)
//                self.posts = posts!
//                print(respons.result)
//            case let .failure(eror):
//                print(eror)
//            }
//        })
//    }
//}

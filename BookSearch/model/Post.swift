//
//  Post.swift
//  BookSearch
//
//  Created by MacBook Pro on 10/09/21.
//

//Bizga kerak bo'lgan serverdan keladigan malimotni Modeli
import Foundation

struct BookModel: Decodable {
    var kind: String
    var totalItems: Int
    
    var items: [Item]
}

struct Item: Decodable {
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    var title: String
    var authors: [String]
    var description: String
    var imageLinks: ImageLinks
}

struct ImageLinks: Decodable {
    var smallThumbnail: String
    var thumbnail: String
}

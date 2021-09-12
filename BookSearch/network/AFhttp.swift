//
//  AFhttp.swift
//  BookSearch
//
//  Created by MacBook Pro on 11/09/21.
//

import Foundation
import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "https://www.googleapis.com/"
private let DEV_SER = "https://www.googleapis.com/"

let headers: HTTPHeaders = [
    "Accept": "application/json",
]

class AFHttp {
    
    // MARK : - AFHttp Requests
    
    class func get(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    // MARK : - AFHttp Methods
    class func server(url: String) -> URL{
        if(IS_TESTER){
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    // MARK : - AFHttp Apis
    static let API_POST_LIST = "books/v1/volumes?q="

    
    
    // MARK : - AFHttp Params
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [
            :]
        return parameters
    }
    

}

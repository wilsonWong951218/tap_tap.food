//
//  RestFulApi.swift
//  Tap_Tap.Food
//
//  Created by Macintosh on 2018/10/27.
//  Copyright © 2018年 LAT. All rights reserved.
//

import Foundation
class RestfulApi{
    
    var urlLink = "http://192.168.1.10:8000/notes"
    
    func post(_ token:String) {
        let parameters = "title=\(token)"
        guard let url = URL(string: urlLink) else {return}
        var request = URLRequest(url: url)
        guard let httpBody = parameters.data(using: String.Encoding.utf8) else {return}
        request.httpBody = httpBody
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
       
        let session = URLSession.shared
        session.dataTask(with: request) { (data, respone, error) in
            print("POST succese")
            if let error = error{
                print("error",error)
            }
            if let respone = respone{
                print("getRespone",respone)
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("data:",json)
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}

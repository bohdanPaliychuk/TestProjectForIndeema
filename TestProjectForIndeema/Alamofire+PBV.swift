//
//  Alamofire+PBV.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/25/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import Foundation
import Alamofire


func request(url: NSURL) -> Request {
    return Alamofire.request(.GET, url)
}

//extension Alamofire.Request {
//    
//    func responseResult<T: BaseModel>(completionHandler: (NSURLRequest?, NSHTTPURLResponse?, Result<T>) -> Void)
//        -> Self {
//            
//    }
//}

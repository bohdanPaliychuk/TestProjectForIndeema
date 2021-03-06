//
//  DataProvider.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/25/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import Foundation
import Alamofire

class DataProvider {
    
    private static let baseURL = "https://4.bp.blogspot.com/"
    
    private static var _cache: NSCache!
    static var cache: NSCache {
        if _cache == nil {
            _cache = NSCache()
        }
        return _cache
    }
    
    
    class func loadImageWithPath(path: String,
                                 progressHandler: ((progress: Float)->Void)?,
                                 resultHandler: ((image: UIImage?, error: NSError?) -> Void)) -> Alamofire.Request? {
        
        if let image = cache.objectForKey(path) as? UIImage {
            resultHandler(image: image, error: nil)
            return nil
        }
        
        
        let urlString = baseURL + path
        let url = NSURL(string: urlString)
        
        guard let unwrappedUrl = url else {
            resultHandler(image: nil, error: NSError(domain: "Incorect url", code: 123456, userInfo: nil))
            return nil
        }
        let  alamofireRequst = Alamofire.request(.GET, unwrappedUrl)
            .progress({ (bytesRead, totalBytesRead, totalBytesExpectedToRead) in
                dispatch_async(dispatch_get_main_queue(), {
                    let progress = Double(totalBytesRead) / Double(totalBytesExpectedToRead)
                    progressHandler?(progress: Float(progress))
                })
            })
            .response { (request, response, data, error) in
                dispatch_async(dispatch_get_main_queue(), {
                    let image = UIImage(data: data!)
                    if let image = image {
                        self.cache.setObject(image, forKey: path)
                    }
                    resultHandler(image: image, error: error)
                })
        }
        
        return alamofireRequst
    }
}
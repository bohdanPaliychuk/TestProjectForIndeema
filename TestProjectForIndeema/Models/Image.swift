//
//  ImageModel.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/25/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import Foundation
import Alamofire

enum DownloadStatus {
    
    case NotStarted
    case Started
    case OnPause
    case DownLoaded
    
    var nextStep: DownloadStatus {
        switch self {
        case .NotStarted:
            return .Started
        case .Started:
            return .OnPause
        case .OnPause:
            return .Started
        case .DownLoaded:
            return .DownLoaded
        }
    }
}

class Image {
    
    var title: String
    var path: String
    var request: Alamofire.Request?
    
    var imageDidSetHandler: ((image: UIImage?)->Void)?
    var image = UIImage(named: "no_image") {
        didSet {
            imageDidSetHandler?(image: image)
            downloadStatus = .DownLoaded
        }
    }
    
    var progressDidSetHandler: ((progress: Float)->Void)?
    var progress: Float = 0.0 {
        didSet {
            progressDidSetHandler?(progress: progress)
        }
    }
    
    var downloadStatusDidSetHandler: ((downloadStatus: DownloadStatus)->Void)?
    var downloadStatus = DownloadStatus.NotStarted {
        didSet {
            downloadStatusDidSetHandler?(downloadStatus: downloadStatus)
        }
    }
    
    
    init(title: String, path: String) {
        self.title = title
        self.path = path
    }
}
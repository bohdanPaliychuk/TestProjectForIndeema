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

class ImageModel {
    
    var title: String
    var path: String
    var request: Alamofire.Request?
    var image: UIImage?
    var downloadProgress: Float = 0.0
    var downloadStatus = DownloadStatus.NotStarted// {
//        didSet {
//            downloadStatus = oldValue.nextStep
//        }
//    }

    
    init(title: String, path: String) {
        self.title = title
        self.path = path
    }
}
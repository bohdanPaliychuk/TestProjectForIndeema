//
//  ImageDetailedViewController.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/26/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit

class ImageDetailedViewController: UIViewController {
    
    var image: Image!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataProvider.loadImageWithPath(image.path, progressHandler: nil) { (image, error) in
            print(image)
            self.imageView.image = image
        }
    }
}

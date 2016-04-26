//
//  ViewController.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/25/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit

class ImagesViewer: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var images = [
        ImageModel(title: "Pyramid", path: "-NC7nLIBRiYM/VIS5lENiSAI/AAAAAAABY2I/Rgsq6dQgqMg/s0/Louvre%2BPyramid%2BUHD.jpg"),
        ImageModel(title: "Constance", path: "-dFZSF8ZESBM/VIBYiGDfltI/AAAAAAABYbM/bNuPZ0bUHko/s0/Constance%2BHalaveli%2BMaldives%2BUHD.jpg"),
        ImageModel(title: "Aston Martin", path: "-jS9AKEwPeHQ/UxeSbPDXWjI/AAAAAAAApWM/-emBFoRWuwU/s0/Aston+Martin+Supercars_Ultra+HD.jpg"),
        ImageModel(title: "Rolling Waves", path: "-KBLDnQ90g4g/UmvW7pjV5xI/AAAAAAAASlE/iMEPAmWJ5FM/s0/Rolling_Waves_Mod-ultra-HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        ImageModel(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadImageForCell(cell: TableCell, withIndexPath indexPath: NSIndexPath) {
        
    let image = self.images[indexPath.row]
        
      image.request = DataProvider.loadImageWithPath(image.path,
                progressHandler: { (progress) in
                    image.downloadProgress = progress
                    cell.progressView.progress = image.downloadProgress
                    cell.progressLabel.text = "\(progress*100)%"
//                    self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
            },
                resultHandler: { (dowloadImage, error) in
                    if error == nil {
                        image.image = dowloadImage
                        image.downloadStatus = .DownLoaded
                        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
                    } else {
                        let alert = UIAlertController(title: "Error",
                            message: error?.description,
                            preferredStyle: UIAlertControllerStyle.Alert
                        )
                        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                }
        })
    }
}


extension ImagesViewer: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? TableCell
        let image = self.images[indexPath.row]
        
        cell?.titleLabel.text = images[indexPath.row].title
        cell?.thumbnail.image = image.image
        cell?.progressView.progress = image.downloadProgress
        cell?.progressLabel.text = "\(image.downloadProgress*100)%"
        
        cell?.actionHandler = {
            switch image.downloadStatus {
            case .NotStarted:
                self.loadImageForCell(cell!, withIndexPath: indexPath)
                cell?.button.setTitle("Pause", forState: .Normal)
            case .Started:
//                let request = DataProvider.requsts[self.images[indexPath.row].path]
                image.request?.suspend()
                cell?.button.setTitle("Resume", forState: .Normal)
            case .OnPause:
//                let request = DataProvider.requsts[self.images[indexPath.row].path]
                image.request?.resume()
            case .DownLoaded:
                cell?.button.setTitle("Downloaded", forState: .Normal)
            }
           image.downloadStatus = image.downloadStatus.nextStep
        }
        
        return cell!
    }
}




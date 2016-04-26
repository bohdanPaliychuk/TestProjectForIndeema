//
//  ViewController.swift
//  TestProjectForIndeema
//
//  Created by Bohdan Paliychuk on 4/25/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var images = [
        Image(title: "Pyramid", path: "-NC7nLIBRiYM/VIS5lENiSAI/AAAAAAABY2I/Rgsq6dQgqMg/s0/Louvre%2BPyramid%2BUHD.jpg"),
        Image(title: "Constance", path: "-dFZSF8ZESBM/VIBYiGDfltI/AAAAAAABYbM/bNuPZ0bUHko/s0/Constance%2BHalaveli%2BMaldives%2BUHD.jpg"),
        Image(title: "Aston Martin", path: "-jS9AKEwPeHQ/UxeSbPDXWjI/AAAAAAAApWM/-emBFoRWuwU/s0/Aston+Martin+Supercars_Ultra+HD.jpg"),
        Image(title: "Rolling Waves", path: "-KBLDnQ90g4g/UmvW7pjV5xI/AAAAAAAASlE/iMEPAmWJ5FM/s0/Rolling_Waves_Mod-ultra-HD.jpg"),
        Image(title: "Winter nature", path: "-BMmgkIkfTOM/UsF-F9q2qhI/AAAAAAAAcBc/x_waaNRX4co/s0/Winter+landscapes+from+Tirol+Ultra+HD.jpg"),
        Image(title: "Ultra HD", path: "-zV3tG6t3WcI/UylQJdf7PvI/AAAAAAAAsIk/n-zgl-iZXpk/s0/4K+Ultra+HD+LED+BRAVIA_Ultra+HD.jpg"),
        Image(title: "Shy Girl", path: "-a4NNZbMWG_I/VBX1LZvHFOI/AAAAAAABMwI/H5uvnIgQ5nw/s0/Shy%2BGirl%2BPortrait_Ultra%2BHD.jpg"),
        Image(title: "Selfie", path: "-MYYy4iiOsOA/VCOcntTnhPI/AAAAAAABOZ4/lZCInpE1nvE/s0/Selfie_Ultra%2BHD.jpg"),
        Image(title: "Lioness", path: "-MYYy4iiOsOA/VCOcntTnhPI/AAAAAAABOZ4/lZCInpE1nvE/s0/Selfie_Ultra%2BHD.jpg"),
        Image(title: "Chameleon", path: "-8QzTFoH6xd8/VHDd7efxc3I/AAAAAAABW_4/qTTdsED22Ag/s0/Lizard%2BChameleon%2BUHD.jpg"),
        Image(title: "Aircraft Carrier", path: "-wOmpGp5kAbs/UiNNPlh8ScI/AAAAAAAAH28/aZ9nmLEpTtc/s0/USS+Midway+Aircraft+Carrier_ultra_HD.jpg"),
        Image(title: "Fan Art", path: "-R5ePCL6HjF4/VLjssb7CpkI/AAAAAAABa3c/2BvGHdShl7U/s0/Tomb%2BRaider%2BReborn_UHD.jpg"),
        Image(title: "FIFA 14", path: "-_pXm5hjk9mA/UpZO_Fht5gI/AAAAAAAAXE4/VYei9gG-lTM/s0/FIFA-14_PlayStation_4_ultra_HD_2nd.jpg"),
        Image(title: "Yamaha R6", path: "-TYHbmktfirY/U0PNDfqhmAI/AAAAAAAAxBg/evd4FTKr9Es/s0/Yamaha+R6+Motorcycle_Ultra+HD.jpg"),
        Image(title: "Copacabana Beach", path: "-n4TuO9GewK4/U0LdfT8GIAI/AAAAAAAAw8g/UmkW3XzbG5Y/s0/Girl+in+Rooftop+Pool+Porto+Bay+Rio_Ultra+HD.jpg"),
        Image(title: "Waves", path: "-H6bVQ45s5Ng/U7I6uHeQ4sI/AAAAAAABAzE/9g99cVirTpc/s0/Waves+break+on+the+rocks_Ultra+HD.jpg"),
        Image(title: "Sunset over", path: "-2AIn7-s6-xk/U5xXXSgxUUI/AAAAAAAA-Q0/ZX3dDRdrgKw/s0/Sunset+Loch+Ness+lake-Ultra+HD.jpg"),
        Image(title: "Mesa Arch", path: "-aI5duUKlycM/U6B7b14q4dI/AAAAAAAA-2o/Hw0XdUrc8EY/s0/Mesa+Arch+Canyonlands+National+Park-Ultra+HD.jpg"),
        Image(title: "Seagulls", path: "-1NbmRy9nvjM/U5_rbzc2HnI/AAAAAAAA-1I/-B0h0bWK2Zo/s0/Seagulls+above+ocean+waves-Ultra+HD.jpg"),
        Image(title: "Leopard", path: "-cplarYTDqnM/UewsKH_1SLI/AAAAAAAAAbg/lSsph7xtvb4/s0/Leopard_3840x2160.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    private func setButtonTitleForCell(cell: TableCell, image: Image) {
        
        switch image.downloadStatus {
        case .NotStarted:
            cell.button.setTitle("Start", forState: .Normal)
        case .Started:
            cell.button.setTitle("Pause", forState: .Normal)
        case .OnPause:
            cell.button.setTitle("Resume", forState: .Normal)
        case .DownLoaded:
            cell.button.setTitle("Downloaded", forState: .Normal)
        }
    }
}


extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? TableCell
        
        let image = self.images[indexPath.row]
        
        cell?.titleLabel.text = image.title
        cell?.progressLabel.text = "\(image.progress * 100)%"
        cell?.progressView.progress = image.progress
        cell?.thumbnail.image = image.image
        
        setButtonTitleForCell(cell!, image: image)
        
        cell?.actionHandler = {
            switch image.downloadStatus {
            case .NotStarted:
                self.images[indexPath.row].request = DataProvider.loadImageWithPath(image.path, progressHandler: { (progress) in
                        self.images[indexPath.row].progress = progress
                    }, resultHandler: { (image, error) in
                        guard let strongImage = image else {
                            print(error)
                            return
                        }
                        self.images[indexPath.row].image = strongImage
                })
            case .Started:
                self.images[indexPath.row].request?.suspend()
            case .OnPause:
                self.images[indexPath.row].request?.resume()
            case .DownLoaded: break
            }

            self.setButtonTitleForCell(cell!, image: image)
            self.images[indexPath.row].downloadStatus = image.downloadStatus.nextStep
        }
        
        self.images[indexPath.row].progressDidSetHandler = { progress in
            cell?.progressView.progress = progress
            cell?.progressLabel.text = "\(progress * 100)%"
        }
        self.images[indexPath.row].imageDidSetHandler = { image in
            cell?.thumbnail.image = image
        }
        self.images[indexPath.row].downloadStatusDidSetHandler = { downloadStatus in
            self.setButtonTitleForCell(cell!, image: image)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        self.images[indexPath.row].progressDidSetHandler = nil
        self.images[indexPath.row].imageDidSetHandler = nil
        self.images[indexPath.row].downloadStatusDidSetHandler = nil
    }
}




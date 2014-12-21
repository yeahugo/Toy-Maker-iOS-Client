//
//  AiToyStoreViewController.swift
//  AiToyMaker
//
//  Created by Gavin Ye on 12/18/14.
//  Copyright (c) 2014 Aijingang. All rights reserved.
//

import UIKit
import Alamofire

enum ModelType{
    case Cartoon,Pinzhuang
}

class AiToyStoreViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let collectionCellIdentifier = "CollectionCell"
    var images:[String]?
    var models:[NSDictionary] = []
    var hostName:String = "http://192.168.1.103:8000/"
    var modelType = ModelType.Cartoon
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var menuView:UIView!

    @IBAction func changeModelsFilter(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            modelType = .Cartoon
        case 1:
            modelType = .Pinzhuang
        default:
            println("Bad segment index!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        images = ["a.png",  "b.png", "c.png", "d.png", "e.png", "f.png", "g.png", "h.png",  "j.png", "k.png", "l.png", "m.png"]
        
//        AlamofireErrorDomain
        var urlString = hostName + "models/catalog/5490cb83884bebe72f62acb8"
        Alamofire.request(.GET, urlString, parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, JSON, error) -> Void in
//                println( JSON)
                self.models = JSON as [NSDictionary]
                println(self.models)
            self.collectionView.reloadData()
       }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
//        return self.images!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:AiCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifier, forIndexPath: indexPath) as AiCollectionViewCell
        
        println(self.models[indexPath.row].valueForKey("thumbnail"))
        var thumbnailString:String = self.models[indexPath.row].valueForKey("thumbnail") as String
        let range:Range = Range(start: advance(thumbnailString.startIndex, 1), end: advance(thumbnailString.endIndex, -1))
        thumbnailString = thumbnailString.substringWithRange(range)
        let thumbnailArray:Array = thumbnailString.componentsSeparatedByString(",")
        var imageName = thumbnailArray.first!
        imageName = imageName.substringWithRange(Range(start: advance(imageName.startIndex, 1), end: advance(imageName.endIndex,-1)))
        let imageUrl = self.hostName + imageName
        ImageLoader.sharedLoader.imageForUrl(imageUrl, completionHandler:{(image: UIImage?, url: String) in
            cell.imageView.image = image
        })
        
//        let imageName = (self.images?[indexPath.row])?
//        cell.imageView.image = UIImage(named: imageName!)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailViewController:AiToyDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ToyDetail") as AiToyDetailViewController
        let imageName = self.images?[indexPath.row]
        detailViewController.portraitImageName = imageName
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController:AiToyDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ToyDetail") as AiToyDetailViewController
        self.navigationController?.pushViewController(detailViewController, animated: true)
        NSLog("prepareForSegue!! sender is ")
    }

}

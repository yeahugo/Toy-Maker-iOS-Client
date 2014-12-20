//
//  AiToyStoreViewController.swift
//  AiToyMaker
//
//  Created by Gavin Ye on 12/18/14.
//  Copyright (c) 2014 Aijingang. All rights reserved.
//

import UIKit
//import Alamofire

class AiToyStoreViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let collectionCellIdentifier = "CollectionCell"
    var images:[String]?
    var selectIndex:Int?
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var menuView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        images = ["a.png",  "b.png", "c.png", "d.png", "e.png", "f.png", "g.png", "h.png",  "j.png", "k.png", "l.png", "m.png"]
        
//        Alamofire.request(.GET, "https://dl.dropboxusercontent.com/u/7817937/nameko.json")
//        .responseJSON { (request, response, JSON, error) -> Void in
////              self.images = JSON?.valueForKey("images") as? [String]
//              NSLog("images is %@", self.images!)
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:AiCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifier, forIndexPath: indexPath) as AiCollectionViewCell
        let imageName = (self.images?[indexPath.row])?
        cell.imageView.image = UIImage(named: imageName!)
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("index path is %@", indexPath)
//        selectIndex = indexPath.row
//        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let detailViewController:AiToyDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ToyDetail") as AiToyDetailViewController
        let imageName = self.images?[indexPath.row]
        detailViewController.portraitImageName = imageName
//        let portraitImage:UIImage = UIImage(named: imageName!)!
//        detailViewController.portraitImageView.image = portraitImage
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController:AiToyDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ToyDetail") as AiToyDetailViewController
        self.navigationController?.pushViewController(detailViewController, animated: true)
        NSLog("prepareForSegue!! sender is ")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

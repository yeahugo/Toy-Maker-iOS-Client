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
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var menuView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
//        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        images = ["a.png",  "b.png", "c.png", "d.png", "e.png", "f.png", "g.png", "h.png", "i.png", "j.png", "k.png", "l.png", "m.png"]
        
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
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

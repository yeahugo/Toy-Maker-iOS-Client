//
//  AiToyDetailViewController.swift
//  AiToyMaker
//
//  Created by Gavin Ye on 12/20/14.
//  Copyright (c) 2014 Aijingang. All rights reserved.
//

import UIKit
import Alamofire

class AiToyDetailViewController: UIViewController {

    @IBOutlet var printTime:UILabel!
    @IBOutlet var objectSize:UILabel!
    @IBOutlet var partNum:UILabel!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var scrollView:UIScrollView!
    var toyId:String!
    var toyDic:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("hostname is"+hostName)
        
        var urlString = hostName + "models/" + toyId
        Alamofire.request(.GET, urlString, parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, JSON, error) -> Void in
                self.toyDic = JSON as NSDictionary
                self.titleLabel.text = self.toyDic.valueForKey("name") as? String
                var imageNames = self.toyDic.valueForKey("images") as [String]
                for var index = 0;index < imageNames.count; index++ {
                    var imageName:String = self.toyDic.valueForKey("images")?[index]? as String
                    var imageUrl = hostName + imageName
                    var startX = CGFloat(index) * self.scrollView.frame.size.width
                    ImageLoader.sharedLoader.imageForUrl(imageUrl, completionHandler:{(image: UIImage?, url: String) in
                        var imageView:UIImageView = UIImageView(image: image)
                        imageView.frame = CGRectMake(startX, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)
                        self.scrollView.addSubview(imageView)
                    })
                    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(imageNames.count), self.scrollView.frame.size.height)
                }
                self.printTime.text = self.toyDic.valueForKey("print_time")? as? String
                var partNum:Int = self.toyDic.valueForKey("parts_num") as Int
                println("partNum is ")
                println(partNum)
                self.partNum.text = String(partNum)
                self.objectSize.text = self.toyDic.valueForKey("object_size")? as? String
                println(self.toyDic.valueForKey("parts_num")?)
        }
//        self.portraitImageView.image = UIImage(named: portraitImageName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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

    @IBOutlet var portraitImageView:UIImageView!
    @IBOutlet var titleLabel:UILabel!
//    var portraitImageName:NSString!
    var toyId:String!
    var toyDic:NSDictionary!
//    var hostName:String = "http://192.168.1.103:8000/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("hostname is"+hostName)
        
        var urlString = hostName + "models/" + toyId
        Alamofire.request(.GET, urlString, parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, JSON, error) -> Void in
                self.toyDic = JSON as NSDictionary
                self.titleLabel.text = self.toyDic.valueForKey("name") as? String
                var imageName:String = self.toyDic.valueForKey("images")?.firstObject? as String
                var imageUrl = hostName + imageName
                ImageLoader.sharedLoader.imageForUrl(imageUrl, completionHandler:{(image: UIImage?, url: String) in
                    self.portraitImageView.image = image
                })
                println(self.toyDic)
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

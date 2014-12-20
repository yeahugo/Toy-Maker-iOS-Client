//
//  AiToyDetailViewController.swift
//  AiToyMaker
//
//  Created by Gavin Ye on 12/20/14.
//  Copyright (c) 2014 Aijingang. All rights reserved.
//

import UIKit

class AiToyDetailViewController: UIViewController {

    @IBOutlet var portraitImageView:UIImageView!
    @IBOutlet var titleLabel:UILabel!
    var portraitImageName:NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.portraitImageView.image = UIImage(named: portraitImageName)
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

//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by 佐々木駿 on 2019/07/20.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImage.image = image
        bigImage.transform = CGAffineTransform(scaleX: 2, y: 2);
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

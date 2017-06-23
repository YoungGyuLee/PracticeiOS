//
//  DetailVC.swift
//  Practice4
//
//  Created by 이영규 on 2017. 6. 23..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class DetailVC : UIViewController{
    
    @IBOutlet var partImg: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var campusLabel: UILabel!
    
    var image : UIImage?
    var name : String?
    var campus : String?
    
    override func viewDidLoad(){
        print("여기 옴")
        nameLabel.text = name//VC1에서 해제하고 넘겨줄 것이라서 여기서 해제할 필요x
        campusLabel.text = campus
        partImg.image = image
        
    }
    
}

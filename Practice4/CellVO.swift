//
//  CellVO.swift
//  Practice4
//
//  Created by 이영규 on 2017. 6. 23..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation


class CellVO{
    //InfoCell이 셀에 담길 데이터가 어떤 데이터들인가..에 관한 것이었다면
    //CellVCO는 실제 셀에 어떤 값이 들어가는가..에 관한 것
    //이 부분이 안드에서 어댑터라고 생각하면 됨.
    
    var name : String?
    var campus : String?
    var part : String?
    var partImg : String?
    
    init(name:String?, campus:String?, part:String?, partImg:String?){
        self.name = name
        self.campus = campus
        self.part = part
        self.partImg = partImg
    }
}

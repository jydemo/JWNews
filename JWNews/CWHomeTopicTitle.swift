//
//  CWHomeTopicTitle.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class CWHomeTopicTitle: NSObject {
    
    var category: String?
    
    var web_url: String?
    
    var concern_id: String?
    
    var icon_url: String?
    
    var name: String?
    
    var isSelected: Bool = true
    
    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["category"] as? String
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        category = aDecoder.decodeObject(forKey: "category") as? String
        web_url = aDecoder.decodeObject(forKey: "web_url") as? String
        concern_id = aDecoder.decodeObject(forKey: "concern_id") as? String
        icon_url = aDecoder.decodeObject(forKey: "icon_url") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        isSelected = aDecoder.decodeBool(forKey: "isSelected")
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(category, forKey: "category")
        aCoder.encode(web_url, forKey: "web_url")
        aCoder.encode(concern_id, forKey: "concern_id")
        aCoder.encode(icon_url, forKey: "icon_url")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(isSelected, forKey: "isSelected")
    }

}

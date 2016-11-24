//
//  CWNetworkTool.swift
//  JWNews
//
//  Created by atom on 2016/11/21.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

import Alamofire

import SVProgressHUD

class CWNetworkTool : NSObject {
    
    static let shareNetworkTool = CWNetworkTool()
    
    func loadArticleRefreshTip(finished:@escaping (_ count: Int) -> ()) {
    
        let url = BASE_URL + "/2/article/v39/refresh_tip/"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                return
            
            }
            
            if let value = response.result.value as? [String: AnyObject] {
                
                if let json = value["data"] as? [String: AnyObject] {
                    
                    if let count = json["count"] as? Int {
                    
                        
                        finished(count)
                        
                        
                    }
                    
                    
                
                }
            
            }
            
        }
    
    }
    
    func loadHomeTitleData(finished: @escaping (_ topTitles: [CWHomeTopicTitle]) -> ()) {
        
        //openudid=494fb8041fdb6435f3ab55c0d76350ccbaef25da
        
        let url = BASE_URL + "/article/category/get_subscribed/v1/?" //"article/category/get_subscribed/v1/?"
        
        let params = ["vid": vid, "openudid": openudid, "id": id, "aid": aid, "iid": iid] as [String : Any]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                return
                
            }
            
            if let value = response.result.value as? [String: AnyObject] {
                
                print(value)
                
                if let data = value["data"] as? [String: AnyObject], let json = data["data"] as? [[String: AnyObject]] {
                    
                    var topics = [CWHomeTopicTitle]()
                    
                    for dict in json {
                        
                        let title = CWHomeTopicTitle(dict: dict)
                        
                        topics.append(title)
                    
                    }
                    
                    finished(topics)
                
                }
                
            }
            
        }
    
    }
    
}

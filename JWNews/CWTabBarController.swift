//
//  CWTabBarController.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class CWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewControllers()
        
    }

    
    

    fileprivate func addChildViewControllers() {
        
        addChildViewController(CWHomeViewController(), title: "首页", imageName: "home_tabbar_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        
        addChildViewController(CWVideoViewController(), title: "视频", imageName: "video_tabbar_22x22_", selectedImageName: "video_tabbar_press_22x22_")
        
        addChildViewController(CWNewCardViewController(), title: "关注", imageName: "newcare_tabbar_22x22_", selectedImageName: "newcare_tabbar_press_22x22_")
        
        addChildViewController(CWMineViewController(), title: "我的", imageName: "mine_tabbar_22x22_", selectedImageName: "mine_tabbar_press_22x22_")
    
    }
    
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        childController.tabBarItem.image = UIImage(named: imageName)
        
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        childController.title = title
        
        let nav = CWNavigationController(rootViewController: childController)
        
        addChildViewController(nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

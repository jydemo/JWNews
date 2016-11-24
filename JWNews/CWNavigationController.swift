//
//  CWNavigationController.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class CWNavigationController: UINavigationController {
    
    override class func initialize() {
        
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        
        navBar.barTintColor = UIColor.white
        
        navBar.tintColor = CWColor(0, g: 0, b: 0, a: 0.7)
        
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17)]
        
        
    
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_28x28_"), style: .plain, target: self, action: #selector(navgationBack))
            
        
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    
    func navgationBack() {
        
        popViewController(animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  CWHomeViewController.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

let homeTopCellID = "CWHomeTopicCell"

class CWHomeViewController: CWBaseViewController {
    
    var oldIndex: Int = 0
    
    var homeTitles = [CWHomeTopicTitle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        
        showRefreshTipView()
        
        homeTitleViewCallback()
        
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = CWGlobalColor()
        
        automaticallyAdjustsScrollViewInsets = false
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.barTintColor = CWColor(210, g: 63, b: 66, a: 1.0)
        
        navigationItem.titleView = titleView
        
        view.addSubview(scrollView)
    
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
        
        let scrollview = UIScrollView()
        
        scrollview.frame = UIScreen.main.bounds
        
        scrollview.isPagingEnabled = true
        
        scrollview.delegate = self
        
        return scrollview
    
    }()
    
    fileprivate lazy var titleView:CWScrollTitleView = {
        
        let titleView = CWScrollTitleView()
        
        return titleView
    
    }()
    
    fileprivate lazy var tipView: CWTipView = {
        
        let tipView = CWTipView()
        
        tipView.frame = CGRect(x: 0, y: 44, width: SCREENW, height: 35)
        
        self.navigationController?.navigationBar.insertSubview(tipView, at: 0)
        
        return tipView
    
    }()
    
    private func showRefreshTipView() {
        
        CWNetworkTool.shareNetworkTool.loadArticleRefreshTip { (count) in
            
            self.tipView.tipLabel.text = (count == 0 ) ? "暂无更新，请休息一会儿" : "今日头条推荐引擎有\(count)条刷新"
            
            UIView.animate(withDuration: CAnimationDuration, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: { 
                self.tipView.tipLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { (_) in
                
                self.tipView.tipLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                let delayTime = DispatchTime(uptimeNanoseconds: UInt64(2 * Double(NSEC_PER_SEC)))
                
                DispatchQueue.main.asyncAfter(deadline: delayTime, execute: { 
                  
                    self.tipView.isHidden = true
                    
                })
                
                
            })
            
        }
    
    }
    
    private func homeTitleViewCallback() {
        
        titleView.titleArrayClosure { [unowned self] (titleArray) in
            
            self.homeTitles = titleArray
            
            self.archveTitles(titles: titleArray)
            
            for topTitle in titleArray {
                
                
            
            }
            
        }
    
    }
    
    private func archveTitles(titles: [CWHomeTopicTitle]) {
    
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            
            print(path)
            
            let filePath = path.appending("/top_titles.archive")
            
            NSKeyedArchiver.archiveRootObject(titles, toFile: filePath)
            
        }
        
    
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

extension CWHomeViewController: UIScrollViewDelegate {


}

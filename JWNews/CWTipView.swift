//
//  CWTipView.swift
//  JWNews
//
//  Created by atom on 2016/11/23.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class CWTipView: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = CWColor(215, g: 233, b: 246, a: 1.0)
        
        addSubview(tipLabel)
        
        tipLabel.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self)
            
        }
        
    }
    
    lazy var tipLabel: UILabel = {
        
        let tipLabel = UILabel()
        
        tipLabel.textColor = CWColor(91, g: 162, b: 207, a: 1.0)
        
        tipLabel.textAlignment = .center
        
        tipLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        return tipLabel
    
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

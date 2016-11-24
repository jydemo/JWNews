//
//  UIView+Extension.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

extension UIView {
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    var width: CGFloat {
        
        get {
            
            return self.frame.size.width
        }
        
        set(newValue) {
            
            var temFrame: CGRect = frame
            
            temFrame.size.width = newValue
            
            frame = temFrame
        
        }
    }
    
    var  height: CGFloat {
        
        get {
            
            return self.frame.size.height
        
        }
        
        set(newValue) {
            
            var tmpFrame = frame
            
            tmpFrame.size.height = newValue
            
            frame = tmpFrame
        
        }
    
    }
    
    var size: CGSize {
        
        get {
            
            return self.frame.size
        
        }
        
        set(newValue) {
            
            var tmpframe = frame
            
            tmpframe.size = newValue
            
            frame = tmpframe
        
        }
    
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }

}



//
//  CWScrollTitleView.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class CWScrollTitleView: UIView {

    var titles = [CWHomeTopicTitle]()
    
    var labels = [CWTitleLabel]()
    
    fileprivate var labelWidths = [CGFloat]()
    
    var addBtnClickClosure: (() -> ())?
    
    var didSelectTitleLabel: ((_ titleLabel: CWTitleLabel) -> ())?
    
    var titlesClosure: ((_ titleArray: [CWHomeTopicTitle]) -> ())?
    
    fileprivate var currentIndex = 0
    
    fileprivate var oldIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        CWNetworkTool.shareNetworkTool.loadHomeTitleData { [ unowned self] (homeTopicTitle) in
            
            let dict = ["category": "__all__", "name": "推荐"]
            
            let recomend = CWHomeTopicTitle(dict: dict as [String : AnyObject])
            
            self.titles.append(recomend)
            
            self.titles += homeTopicTitle
            
            self.setupUI()
            
        }
        
    }
    
    fileprivate func setupUI() {
        
        addSubview(scrollView)
        
        addSubview(addButton)
        
        scrollView.snp.makeConstraints { (make) in
            
            make.left.top.bottom.equalTo(self)
            
            make.right.equalTo(addButton.snp.left)
        }
        
        addButton.snp.makeConstraints { (make) in
            
            make.top.bottom.right.equalTo(self)
            
            make.width.equalTo(30)
            
        }
        
        
        setupTitlesLabel()
        
        setupLabelPosition()
        
        titlesClosure?(titles)
    
    }
    
    fileprivate lazy var  addButton: UIButton = {
        
        let button = UIButton()
        
        button.setImage(UIImage(named: "add_channel_titlbar_16x16_"), for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
       
        return button
        
    }()
    
    @objc fileprivate func addButtonClick() {
    
        addBtnClickClosure?()
        
    }
    
    fileprivate func addButtonClickClosure(_ closure: @escaping () -> ()) {
        
        addBtnClickClosure = closure
        
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
    
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
        
    }()
    
    func didSelectorTitleLabelClosure(_ closure: @escaping (_ titleLabel: CWTitleLabel) -> ()) {
        
        didSelectTitleLabel = closure
        
    }
    
    func titleArrayClosure(_ closure: @escaping (_ titleArray: [CWHomeTopicTitle]) -> ()) {
        
        titlesClosure = closure
    
    }
        
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func titleLabelClick(_ tap: UITapGestureRecognizer) {
        
        guard let currentLabel = tap.view as? CWTitleLabel else {
            
            return
            
        }
        
        oldIndex = currentIndex
        
        currentIndex = currentLabel.tag
        
        let oldLabel = labels[oldIndex]
        
        oldLabel.textColor = CWColor(235, g: 235, b: 235, a: 1.0)
        
        oldLabel.currentScale = 1.0
        
        currentLabel.textColor = UIColor.white
        
        currentLabel.currentScale = 1.1
        
        adjustTitleOffsetToCurrentIndex(currentIndex, oldIndex: oldIndex)
        
        didSelectTitleLabel?(currentLabel)
    }
    

}

extension CWScrollTitleView {
    
    fileprivate func setupTitlesLabel() {
        
        for (index, topic) in titles.enumerated() {
            
            let label = CWTitleLabel()
            
            label.text = topic.name
            
            label.tag = index
            
            label.textColor = CWColor(235, g: 235, b: 235, a: 1.0)
            
            label.textAlignment = .center
            
            label.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            
            label.addGestureRecognizer(tap)
            
            label.font = UIFont.systemFont(ofSize: 17)
            
            label.sizeToFit()
            
            label.width += CMargin
            
            labels.append(label)
            
            labelWidths.append(label.width)
            
            scrollView.addSubview(label)
        
        }
        
        let currentLabel = labels[currentIndex]
        
        currentLabel.textColor = UIColor.white
        
        currentLabel.currentScale = 1.1
    
    }
    
    fileprivate func setupLabelPosition() {
        
        var titleX: CGFloat = 0.0
        
        let titleY: CGFloat = 0.0
        
        var titleW: CGFloat = 0.0
        
        let titleH = self.height
        
        for (index, label) in labels.enumerated() {
            
            titleW = labelWidths[index]
            
            titleX = CMargin
            
            if index != 0 {
                
                let lastLabel = labels[index - 1]
                
                titleX = lastLabel.frame.maxX + CMargin
                
                
            
            }
            
            label.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        
        }
        
        if let lastLabel = labels.last {
            
            scrollView.contentSize = CGSize(width: lastLabel.frame.maxX, height: 0)
        
        }
    
    }
    
    
    
    func adjustTitleOffsetToCurrentIndex(_ currentIndex: Int, oldIndex: Int) {
        
        guard oldIndex != currentIndex else { return }
        
        let oldLabel = labels[oldIndex]
        
        let currentLabel = labels[currentIndex]
        
        currentLabel.currentScale = 1.1
        
        currentLabel.textColor = UIColor.white
        
        oldLabel.textColor = CWColor(235, g: 235, b: 235, a: 1.0)
        
        oldLabel.currentScale = 1.0
        
        var offsetX = currentLabel.centerX - SCREENW * 0.5
        
        if offsetX < 0 {
            
            offsetX = 0
        
        }
        
        var maxOffsetX = scrollView.contentSize.width - (SCREENW - addButton.width)
        
        if maxOffsetX < 0 {
            
            maxOffsetX = 0
        
        }
        
        if offsetX > maxOffsetX {
            
            offsetX = maxOffsetX
        
        }
        
        
        
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    
    }
    
    override var frame: CGRect {
        
        didSet {
            
            let newFrame = CGRect(x: 0, y: 0, width: SCREENW, height: 44)
            
            super.frame = newFrame
        
        }
    
    }

}

class CWTitleLabel: UILabel {
    
    var currentScale: CGFloat = 1.0 {
    
        didSet {
            
            transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        
        }
    }
    
}

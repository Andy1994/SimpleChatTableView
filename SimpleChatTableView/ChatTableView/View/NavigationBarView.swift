//
//  NavigationBarView.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {

  override init(frame: CGRect) {
    super.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 64))
    
    let blurEffect = UIBlurEffect(style: .light)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.frame = bounds
    addSubview(blurView)
    
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 44))
    titleLabel.textAlignment = .center
    titleLabel.textColor = UIColor.black
    titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    titleLabel.text = "消息"
    addSubview(titleLabel)
    
    let spliteLine = UILabel(frame: CGRect(x: 0, y: bounds.size.height - 0.5, width: ScreenWidth, height: 0.5))
    spliteLine.backgroundColor = UIColor(hex: "#eeeeee")
    addSubview(spliteLine)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

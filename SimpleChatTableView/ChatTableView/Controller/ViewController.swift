//
//  ViewController.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let navigationBarView = NavigationBarView()
  let chatTableView = ChatTableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(hex: "#F4F3F1")
    
    view.addSubview(chatTableView)
    
    view.addSubview(navigationBarView)
    
    chatTableView.chatModels = ChatModel.loadPlistData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}


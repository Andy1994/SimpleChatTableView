//
//  ChatTableView.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

let ChatTableViewRowHeight: CGFloat = 70
let ChatTableViewImageViewSize: CGFloat = 48

class ChatTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
  
  var chatModels = [ChatModel]() {
    didSet {
      reloadData()
    }
  }
  
  let reuseIdentifier = "ChatTableViewCell"

  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: FullScreen, style: style)
    
    contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    rowHeight = ChatTableViewRowHeight
    dataSource = self
    delegate = self
    alwaysBounceVertical = true
    showsVerticalScrollIndicator = false
    separatorStyle = .none
    register(ChatTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chatModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ChatTableViewCell
    cell?.chatModel = chatModels[indexPath.item]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

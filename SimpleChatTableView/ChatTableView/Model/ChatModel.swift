//
//  ChatModel.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let FullScreen = UIScreen.main.bounds

class ChatModel: NSObject {
  
  var avatar = ""
  var title = ""
  var pictureUrl = ""
  var pictureWidth: CGFloat = 0
  var pictureHeight: CGFloat = 0
  
  class func getModels() -> [ChatModel] {
    return []
  }
  
}

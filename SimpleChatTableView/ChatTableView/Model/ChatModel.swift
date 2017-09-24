//
//  ChatModel.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class ChatModel: NSObject {
  
  var name = ""
  var avatar = ""
  var content = ""
  var time = ""
  
  init(data: NSDictionary) {
    super.init()
    name = data["name"]! as! String
    avatar = data["avatar"]! as! String
    content = data["content"]! as! String
    time = data["time"]! as! String
  }
  
  class func loadPlistData() -> [ChatModel] {
    var chatModels = [ChatModel]()
    if let path = Bundle.main.path(forResource: "ChatData", ofType: "plist") {
      let data = NSArray(contentsOfFile: path)
      for index in 0 ..< data!.count {
        chatModels.append(ChatModel(data: data![index] as! NSDictionary))
      }
      for index in 0 ..< data!.count {
        chatModels.append(ChatModel(data: data![index] as! NSDictionary))
      }
      for index in 0 ..< data!.count {
        chatModels.append(ChatModel(data: data![index] as! NSDictionary))
      }
    }
    return chatModels
  }
  
}

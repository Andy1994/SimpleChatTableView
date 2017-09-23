//
//  ChatTableViewCell.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
  
  let avatarImageView = UIImageView()
  
  let avatarImageViewSize: CGFloat = 48
  
  var chatModel: ChatModel? {
    didSet {
      if let model = chatModel {
        avatarImageView.wb_setImageWithURL(URL(string: model.avatar), placeholder: nil, options: nil, progress: nil) { [weak self] (_, _, _, _, _) in
          if let weakSelf = self {
            weakSelf.avatarImageView.roundCorner()
          }
        }
      }
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    
    avatarImageView.frame = CGRect(x: 12, y: (ChatTableViewRowHeight - avatarImageViewSize) / 2, width: avatarImageViewSize, height: avatarImageViewSize)
    avatarImageView.contentMode = .scaleAspectFill
    addSubview(avatarImageView)
    
    let spliteLine = UILabel(frame: CGRect(x: 72, y: ChatTableViewRowHeight - 0.5, width: ScreenWidth - 72, height: 0.5))
    spliteLine.backgroundColor = UIColor(hex: "#f0f0f0")
    addSubview(spliteLine)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

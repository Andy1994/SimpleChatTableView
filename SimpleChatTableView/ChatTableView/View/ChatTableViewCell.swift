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
  let nameLabel = UILabel()
  let timeLabel = UILabel()
  let contentLabel = UILabel()
  
  let avatarImageViewSize: CGFloat = 48
  
  var chatModel: ChatModel? {
    didSet {
      if let model = chatModel {
        nameLabel.text = model.name
        timeLabel.text = model.time
        contentLabel.text = model.content
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
    
    nameLabel.frame = CGRect(x: 72, y: 15, width: ScreenWidth - 72 - 47, height: UIFont.boldSystemFont(ofSize: 14).lineHeight)
    nameLabel.textAlignment = .left
    nameLabel.textColor = UIColor(hex: "#1e1e1e")
    nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
    addSubview(nameLabel)
    
    timeLabel.frame = CGRect(x: ScreenWidth - 47, y: 20, width: 47, height: UIFont.boldSystemFont(ofSize: 11).lineHeight)
    timeLabel.textAlignment = .center
    timeLabel.textColor = UIColor(hex: "#aaaaaa")
    timeLabel.font = UIFont.boldSystemFont(ofSize: 11)
    addSubview(timeLabel)
    
    let contentLabelFont = UIFont.boldSystemFont(ofSize: 12)
    contentLabel.frame = CGRect(x: 72, y: ChatTableViewRowHeight - 15 - contentLabelFont.lineHeight, width: ScreenWidth - 72 - 47, height: contentLabelFont.lineHeight)
    contentLabel.textAlignment = .left
    contentLabel.textColor = UIColor(hex: "#aaaaaa")
    contentLabel.font = contentLabelFont
    addSubview(contentLabel)
    
    let spliteLine = UILabel(frame: CGRect(x: 72, y: ChatTableViewRowHeight - 0.5, width: ScreenWidth - 72, height: 0.5))
    spliteLine.backgroundColor = UIColor(hex: "#f0f0f0")
    addSubview(spliteLine)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

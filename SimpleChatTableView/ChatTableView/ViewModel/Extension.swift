//
//  Extension.swift
//  SimpleChatTableView
//
//  Created by wangwenbo on 2017/9/23.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let FullScreen = UIScreen.main.bounds

extension String {
  
  func sizeForFont(_ font: UIFont, size: CGSize) -> CGSize {
    let fString = self as NSString
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
    let attrDict = [
      NSFontAttributeName: font,
      NSParagraphStyleAttributeName: paragraphStyle
    ]
    let rect = fString.boundingRect(with: size,
                                    options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin],
                                    attributes: attrDict,
                                    context: nil)
    return rect.size
  }
  
  func heightForFont(_ font: UIFont, width: CGFloat) -> CGFloat {
    let size = self.sizeForFont(font, size: CGSize(width: width, height: CGFloat(MAXFLOAT)))
    return size.height
  }
}

extension UIColor {
  
  var hexString: String {
    let colorRef = self.cgColor.components
    
    let r: CGFloat = colorRef![0]
    let g: CGFloat = colorRef![1]
    let b: CGFloat = colorRef![2]
    
    return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
  }
  
  convenience init(hex: String) {
    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    var alpha: CGFloat = 1.0
    var hex:   String = hex
    
    if hex.hasPrefix("#") {
      let index = hex.characters.index(hex.startIndex, offsetBy: 1)
      hex         = hex.substring(from: index)
    }
    
    let scanner = Scanner(string: hex)
    var hexValue: CUnsignedLongLong = 0
    if scanner.scanHexInt64(&hexValue) {
      switch (hex.characters.count) {
      case 3:
        red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
        green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
        blue  = CGFloat(hexValue & 0x00F)              / 15.0
      case 4:
        red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
        green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
        blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
        alpha = CGFloat(hexValue & 0x000F)             / 15.0
      case 6:
        red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
        green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
        blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
      case 8:
        red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
        green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
        blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
        alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
      default:
        print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
      }
    } else {
      print("Scan hex error")
    }
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

extension UIImageView {
  
  func wb_setImageWithURL(_ imageURL: URL?, placeholder: UIImage?, options: YYWebImageOptions?, progress: YYWebImageProgressBlock?, completion: YYWebImageCompletionBlock?) {
    var allOptions: YYWebImageOptions = [YYWebImageOptions.setImageWithFadeAnimation, YYWebImageOptions.progressiveBlur]
    if let newOptions = options {
      allOptions.insert(newOptions)
    }
    yy_setImage(with: imageURL, placeholder: placeholder, options: allOptions, progress: progress, transform: { (image, url) -> UIImage? in
      return image
    }, completion: completion)
  }
}

extension UIImageView {
  
  func roundCorner() {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0);
    UIBezierPath(ovalIn: bounds).addClip()
    draw(bounds)
    image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
  }
}

//
//  ViewController.swift
//  TBBZ_swift
//
//  Created by Bangzhe Liu on 7/29/16.
//  Copyright © 2016 taobao. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

  var nextY=80
  var labels=[UILabel]()
  var weatherLabel=[UILabel]()
  let mainwidth:CGFloat = UIScreen.main.bounds.width
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let weatherBtn=UIButton(frame:CGRect(x:mainwidth/2-75, y:30, width:150, height:70))
    weatherBtn.setTitle("天气预报", for:UIControlState())
    weatherBtn.titleLabel?.font = UIFont(name:"STKaiti", size:30)
    weatherBtn.titleLabel?.textAlignment = NSTextAlignment.center
    weatherBtn.setTitleColor(UIColor.blue, for:UIControlState())
    weatherBtn.setTitleColor(UIColor.green, for:UIControlState.highlighted)
    weatherBtn.addTarget(self, action:#selector(ViewController.weatherButton), for:UIControlEvents.touchUpInside)
    self.view.addSubview(weatherBtn);
  }

  func weatherButton() {
    let url = URL(string : "http://www.weather.com.cn/data/sk/101010100.html")
    let data = try? Data(contentsOf: url!)
    var json:Any! = nil
    do {
      json = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.allowFragments)
    }catch {
      print("error")
    }
    let label:UILabel = UILabel(frame:CGRect(x: 10, y: 110, width: mainwidth, height: 40))
    let weatherinfo = (json as! NSDictionary).object(forKey: "weatherinfo")!
    
    label.text = "city: \(((weatherinfo as AnyObject).object(forKey: "city"))!)  time: \(((weatherinfo as AnyObject).object(forKey: "time"))!)  rain: \(((weatherinfo as AnyObject).object(forKey: "rain"))!)"
    label.font = UIFont(name:"STKaiti", size:15)
    label.textAlignment = NSTextAlignment.center
    self.labels.append(label)
    self.view.addSubview(label)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
  }
}


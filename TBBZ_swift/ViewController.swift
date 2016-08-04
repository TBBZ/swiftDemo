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
  let mainwidth:CGFloat = UIScreen.mainScreen().bounds.width
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let weatherBtn=UIButton(frame:CGRect(x:mainwidth/2-75, y:30, width:150, height:70))
    weatherBtn.setTitle("天气预报", forState:UIControlState.Normal)
    weatherBtn.titleLabel?.font = UIFont(name:"STKaiti", size:30)
    weatherBtn.titleLabel?.textAlignment = NSTextAlignment.Center
    weatherBtn.setTitleColor(UIColor.blueColor(), forState:UIControlState.Normal)
    weatherBtn.setTitleColor(UIColor.greenColor(), forState:UIControlState.Highlighted)
    weatherBtn.addTarget(self, action:#selector(ViewController.weatherButton), forControlEvents:UIControlEvents.TouchUpInside)
    self.view.addSubview(weatherBtn);
  }

  func weatherButton() {
    let url = NSURL(string : "http://www.weather.com.cn/data/sk/101010100.html")
    let data = NSData(contentsOfURL: url!)
    var json:AnyObject! = nil
    do {
      json = try NSJSONSerialization .JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
    }catch {
      print("error")
    }
    let label:UILabel = UILabel(frame:CGRect(x: 10, y: 110, width: mainwidth, height: 40))
    let weatherinfo = json.objectForKey("weatherinfo")
    
    label.text = "city: \((weatherinfo?.objectForKey("city"))!)  time: \((weatherinfo?.objectForKey("time"))!)  rain: \((weatherinfo?.objectForKey("rain"))!)"
    label.font = UIFont(name:"STKaiti", size:15)
    label.textAlignment = NSTextAlignment.Center
    self.labels.append(label)
    self.view.addSubview(label)
  }
  
  override func viewWillAppear(animated: Bool) {
    
  }
}


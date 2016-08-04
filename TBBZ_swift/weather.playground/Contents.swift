//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let url = NSURL(string : "http://www.weather.com.cn/data/sk/101010100.html")
let data = NSData(contentsOfURL: url!)
do {
  var json = try NSJSONSerialization .JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
}catch {
  print("error")
}

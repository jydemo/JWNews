//
//  CWConst.swift
//  TodayNew
//
//  Created by atom on 2016/11/19.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

let CAnimationDuration = 0.25


let CMargin: CGFloat = 10.0



/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height

func CWColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)

}

let BASE_URL = "http://iu.snssdk.com" //"http://lf.snssdk.com/"

let resolution = "640*1136&ab_feature=z1"
let vid = "FB6ACE01-17EA-4D93-ADF7-AAD2ACD8CB85&app_name=explore_article"
let channel = "App%20Store"
let openudid = "494fb8041fdb6435f3ab55c0d76350ccbaef25da"
let ssmix = "a"
let device_type = "iPhone%205%20(Global)"

let id = "26"

let idfv = "FB6ACE01-17EA-4D93-ADF7-AAD2ACD8CB85"
let os_version = "10.2"
let live_sdk_version = "1.3"

let aid = "26"
let device_platform = "iphone"

let ab_client = "a1,f2,f7,e1"

let ac = "WIFI"

let version_code = "5.8.3"

let idfa = "FA89FEC8-3959-474F-AC83-3CBB1B2E7812"

let ab_version = "79286,91222,83098,87331,90893,91216,91115,90765,91330,90767,88183,90126,91357,88869,91461,91605,87495,87988"

let iid = "6376118572"

let device_id = "3312676546"

let categories = "%5B%0A%20%20%22news_hot%22%2C%0A%20%20%22video%22%2C%0A%20%20%22news_local%22%2C%0A%20%20%22news_society%22%2C%0A%20%20%22news_entertainment%22%2C%0A%20%20%22组图%22%2C%0A%20%20%22news_tech%22%2C%0A%20%20%22news_car%22%2C%0A%20%20%22news_sports%22%2C%0A%20%20%22news_finance%22%2C%0A%20%20%22news_military%22%2C%0A%20%20%22news_world%22%2C%0A%20%20%22essay_joke%22%2C%0A%20%20%22image_funny%22%2C%0A%20%20%22image_ppmm%22%2C%0A%20%20%22news_health%22%2C%0A%20%20%22positive%22%2C%0A%20%20%22jinritemai%22%2C%0A%20%20%22news_house%22%2C%0A%20%20%22中国新唱将%22%0A%5D"

let city = ""

let server_city = "本地"

let version = "3312676546%7C14%7C1479799611"

let IID: String = "5034850950"

//let device_id: String = "6096495334"

func CWGlobalColor() -> UIColor {
    
    return CWColor(245, g: 80, b: 83, a: 1.0)

}

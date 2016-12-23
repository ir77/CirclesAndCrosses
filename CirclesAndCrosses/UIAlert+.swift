//
//  UIAlert+.swift
//  CirclesAndCrosses
//
//  Created by yuchimur on 2016/12/24.
//  Copyright © 2016年 内村　祐之. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func simpleAlertController(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }
}




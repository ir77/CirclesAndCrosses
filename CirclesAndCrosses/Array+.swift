//
//  Array+.swift
//  CirclesAndCrosses
//
//  Created by yuchimur on 2016/12/24.
//  Copyright © 2016年 内村　祐之. All rights reserved.
//

import UIKit

extension Array where Element: UIControl {
    func toDisable() {
        self.forEach {
            $0.isEnabled = false
        }
    }
    
    func toEnable() {
        self.forEach {
            $0.isEnabled = true
        }
    }
}


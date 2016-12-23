//
//  CellButton.swift
//  CirclesAndCrosses
//
//  Created by yuchimur on 2016/12/24.
//  Copyright © 2016年 内村　祐之. All rights reserved.
//

import UIKit

enum Status: Int {
    case None = 0
    case Circle = 1
    case Cross = 2
    
    var title: String {
        switch self {
        case .Circle:
            return "◯"
        case .Cross:
            return "☓"
        default:
            return ""
        }
    }
    
}

class CellButton: UIButton {
    var status: Status = .None
    
    override func awakeFromNib() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func changeStatusTo(status: Status) {
        switch status {
        case .Circle:
            self.status = .Circle
            self.setImage(UIImage(named: "mark_maru")!, for: .normal)
        case .Cross:
            self.status = .Cross
            self.setImage(UIImage(named: "mark_batsu")!, for: .normal)
        default:
            print("status change failed")
        }
    }

}

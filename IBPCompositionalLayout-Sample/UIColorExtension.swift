//
//  UIColorExtension.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/31.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let random = Int.random(in: 0...5)
        let color: UIColor
        switch random {
        case 0:
            color = UIColor.red
        case 1:
            color = UIColor.blue
        case 2:
            color = UIColor.gray
        case 3:
            color = UIColor.green
        case 4:
            color = UIColor.purple
        case 5:
            color = UIColor.systemPink
        default:
            color = UIColor.black
        }

        return color
    }
}

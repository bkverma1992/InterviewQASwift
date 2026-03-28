//
//  Common.swift
//  LeaderbordDemo
//
//  Created by APPLE on 01/08/25.
//

import Foundation
import UIKit

// MARK: - UIViewController Utilities
extension UIViewController {
    
    /// Creates a rank string like 1st, 2nd with superscript suffix styling
    func makeSuperscriptedRank(_ number: String, suffix: String) -> NSAttributedString {
        let base = NSMutableAttributedString(string: number, attributes: [
            .font: UIFont.systemFont(ofSize: number == "1" ? 52 : 30, weight: .bold)
        ])
        
        let superscript = NSAttributedString(string: suffix, attributes: [
            .font: UIFont.systemFont(ofSize: number == "1" ? 26 : 15),
            .baselineOffset: number == "1" ? 25 : 18
        ])
        
        base.append(superscript)
        return base
    }
    
    /// Sets multiple UILabels with rank strings in superscript style
    func setRankLabels(_ rankLabels: [(UILabel?, String, String)]) {
        for (label, number, suffix) in rankLabels {
            label?.attributedText = makeSuperscriptedRank(number, suffix: suffix)
        }
    }

    /// Makes multiple UIImageViews circular with border color
    func makeImagesCircular(_ configs: [(UIImageView?, UIColor)], borderWidth: CGFloat = 2) {
        for (imageView, color) in configs {
            imageView?.makeCircular(borderWidth: borderWidth, borderColor: color)
        }
    }
    
    /// Returns a UIColor from RGB values
    func rgbColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

// MARK: - Top Corner Rounded Of The View
extension UIView {
    func roundTopCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.clipsToBounds = true
    }
    
    func roundAllCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

// MARK: - Ciruclar Image
extension UIImageView {
    func makeCircular(borderWidth: CGFloat = 2, borderColor: UIColor = .white) {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
}


extension Numeric {
    var commaSeparated: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let number = self as? NSNumber {
            return formatter.string(from: number) ?? "\(self)"
        }
        
        return "\(self)"
    }
}


extension UIColor {
    static func fromRGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

// MARK: - Superscript Rank Creator
extension NSAttributedString {
    
    static func makeSuperscriptedRank(_ number: Int) -> NSAttributedString {
        let suffix: String

        let ones = number % 10
        let tens = (number / 10) % 10

        if tens == 1 {
            suffix = "th"
        } else {
            switch ones {
            case 1: suffix = "st"
            case 2: suffix = "nd"
            case 3: suffix = "rd"
            default: suffix = "th"
            }
        }

        let numberString = "\(number)"
        let base = NSMutableAttributedString(string: numberString, attributes: [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ])
        let superscript = NSAttributedString(string: suffix, attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .baselineOffset: 8
        ])
        
        
        base.append(superscript)
        return base
    }
}

// Nested computed property

import Foundation
import UIKit

struct Data1 {
    var count: Int
    var unit: String
    
    var attributedText: NSAttributedString {
        let result = NSMutableAttributedString()
        
        
        let countAttributes = [
            NSFontAttributeName : UIFont.systemFontOfSize(24),
            NSForegroundColorAttributeName : UIColor.redColor()
        ]
        let countText = NSAttributedString(string: String(count),
                                           attributes: countAttributes)
        result.appendAttributedString(countText)
        
        
        let unitAttributes = [
            NSFontAttributeName : UIFont.systemFontOfSize(14),
            NSForegroundColorAttributeName : UIColor.blackColor()
        ]
        let unitText = NSAttributedString(string: unit,
                                          attributes: unitAttributes)
        result.appendAttributedString(unitText)
        
        
        return result
    }
}

Data1(count: 27, unit: "inch").attributedText

func +(text1: NSAttributedString, text2: NSAttributedString) -> NSAttributedString{
    let result = NSMutableAttributedString()
    result.appendAttributedString(text1)
    result.appendAttributedString(text2)
    return result
}

struct Data2 {
    var count: Int
    var unit: String
    
    var attributedText: NSAttributedString {
        // Nested computed property 😊
        var countText: NSAttributedString {
            let countAttributes = [
                NSFontAttributeName : UIFont.systemFontOfSize(24),
                NSForegroundColorAttributeName : UIColor.redColor()
            ]
            return NSAttributedString(string: String(count),
                                      attributes: countAttributes)
        }
        
        // Nested computed property 😊
        var unitText: NSAttributedString {
            let unitAttributes = [
                NSFontAttributeName : UIFont.systemFontOfSize(14),
                NSForegroundColorAttributeName : UIColor.blackColor()
            ]
            return NSAttributedString(string: unit,
                                      attributes: unitAttributes)
        }
        
        return countText + unitText
    }
}

Data2(count: 27, unit: "inch").attributedText



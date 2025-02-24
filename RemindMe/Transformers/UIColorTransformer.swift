//
//  UIColorTransformer.swift
//  RemindMe
//
//  Created by Tanmay . on 24/02/25.
//

import Foundation
import UIKit

class UIColorTransformer: ValueTransformer {
    
    // Transforms the color into data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            print("There was an error Archiving the data(UIColorTransformer): \(error.localizedDescription)")
            return nil
        }
    }
    
    // Revert the transformed data back into color: 
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            print("There was an error unarchiving the data into color(UIColorTransformer): \(error.localizedDescription)")
            return nil
        }
    }
    
}

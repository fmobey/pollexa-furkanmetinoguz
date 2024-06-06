//
//  NSObject+Extensions.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import Foundation

public extension NSObject {
    
    @objc final class var className: String {
        String(describing: self)
    }
}

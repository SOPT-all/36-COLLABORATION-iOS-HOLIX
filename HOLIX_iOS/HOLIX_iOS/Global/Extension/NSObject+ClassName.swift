//
//  NSObject+ClassName.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

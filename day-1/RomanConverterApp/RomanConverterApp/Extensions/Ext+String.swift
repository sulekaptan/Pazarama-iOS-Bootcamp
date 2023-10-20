//
//  Ext+String.swift
//  RomanConverterApp
//
//  Created by Kaan Yıldırım on 14.10.2023.
//

import Foundation

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

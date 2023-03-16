//
//  CustomError.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import Foundation

extension Error {
    var errorDomain: String? {
        return (self as NSError).domain
    }
}

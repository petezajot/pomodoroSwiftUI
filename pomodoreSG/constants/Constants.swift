//
//  Constants.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import Foundation
import SwiftUI

struct Constants {
    static private let josefinSansBold: String = "JosefinSans-Bold"
    static private let josefinSansMedium: String = "JosefinSans-Medium"
    static private let josefinSandSemiBold: String = "JosefinSans-SemiBold"
    static private let josefineSansRegular: String = "JosefinSans-Regular"
    static private let josefinSansLightName: String = "JosefinSans-Light"
    static private let josefinSansThinName: String = "JosefinSans-Thin"
    
    struct Colors {
        static let darkPrimaryColor: Color = Color(hex: "#D32F2F")
        static let lightPrimaryColor: Color = Color(hex: "#FFCDD2")
        static let primaryColor: Color = Color(hex: "#F44336")
        static let textIconsColor: Color = Color(hex: "#FFFFFF")
        static let accentColor: Color = Color(hex: "#607D8B")
        static let primaryText: Color = Color(hex: "#212121")
        static let secondaryText: Color = Color(hex: "#757575")
        static let dividerColor: Color = Color(hex: "#BDBDBD")
    }
    
    struct Fonts {
        static let titleFont: Font = Font.custom(josefinSansBold, size: 26)
        static let subtitleFont: Font = Font.custom(josefinSansMedium, size: 20)
        static let tinyTitleFont: Font = Font.custom(josefinSandSemiBold, size: 18)//Not necessary
        static let regularFont: Font = Font.custom(josefineSansRegular, size: 16)
        static let bigFont: Font = Font.custom(josefineSansRegular, size: 18)
        static let tinyFont: Font = Font.custom(josefineSansRegular, size: 14)
        static let caption: Font = Font.custom(josefineSansRegular, size: 12)
        static let josefinSansLight: Font = Font.custom(josefinSansLightName, size: 26)
        static let josefinSansThin: Font = Font.custom(josefinSansThinName, size: 26)
    }
}

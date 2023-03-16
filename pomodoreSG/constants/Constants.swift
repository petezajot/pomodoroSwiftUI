//
//  Constants.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import Foundation
import SwiftUI

struct Constants {
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
        static let titleFont: Font = Font.custom("JosefinSans-Bold", size: 26)
        static let subtitleFont: Font = Font.custom("JosefinSans-Medium", size: 20)
        static let tinyTitleFont: Font = Font.custom("JosefinSans-SemiBold", size: 18)//Not necessary
        static let regularFont: Font = Font.custom("JosefinSans-Regular", size: 16)
        static let bigFont: Font = Font.custom("JosefinSans-Regular", size: 18)
        static let tinyFont: Font = Font.custom("JosefinSans-Regular", size: 14)
        static let caption: Font = Font.custom("JosefinSans-Regular", size: 12)
        
        static let josefinSansLight: Font = Font.custom("JosefinSans-Light", size: 26)
        static let josefinSansThin: Font = Font.custom("JosefinSans-Thin", size: 26)
    }
}

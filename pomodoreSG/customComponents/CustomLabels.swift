//
//  CustomLabels.swift
//  pomodoreSG
//
//  Created by MacBook Air on 15/03/23.
//

import SwiftUI

enum LabelSize {
    case title
    case subtitle
    case large
    case regular
    case tiny
    case caption
    case placeholder
}

struct CustomLabels: View {
    var labelSize: LabelSize
    var text: String
    
    var body: some View {
        switch labelSize {
        case .title:
            Text(text)
                .font(Constants.Fonts.titleFont)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .subtitle:
            Text(text)
                .font(Constants.Fonts.subtitleFont)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .large:
            Text(text)
                .font(Constants.Fonts.tinyTitleFont)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .regular:
            Text(text)
                .font(Constants.Fonts.regularFont)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .tiny:
            Text(text)
                .font(Constants.Fonts.tinyFont)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .caption:
            Text(text)
                .font(Constants.Fonts.caption)
                .foregroundColor(Constants.Colors.primaryText)
                .frame(alignment: .center)
        case .placeholder:
            Text(text)
                .font(Constants.Fonts.regularFont)
                .foregroundColor(Constants.Colors.dividerColor)
                .frame(alignment: .center)
        }
    }
}

struct CustomLabels_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabels(labelSize: .placeholder, text: "Hola Mundo")
    }
}

//
//  SettingsOptions.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 03.07.2022.
//

import UIKit

struct SettingsOption {
    var title: String
    var icon: UIImage?
    var iconBackgroundColor: UIColor
    var isOn: Bool?
    var statusTitle: String?

    enum SettingsOptionType {
        case staticCell(model: SettingsOption)
        case switchCell(model: SettingsOption)
        case statusCell(model: SettingsOption)
    }
}

struct Section {
    let options: [SettingsOption.SettingsOptionType]
}

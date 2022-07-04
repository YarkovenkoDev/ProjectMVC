//
//  SettingsOptionModel.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 03.07.2022.
//

import UIKit

final class SettingsOptionModel {

    func createModels() -> [Section] {
        return [
            Section(options: [
                .switchCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .orange, isOn: true)),
                .statusCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, statusTitle: "Off")),
                .statusCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: .systemBlue,  statusTitle: "On")),
                .staticCell(model: SettingsOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen)),
                .staticCell(model: SettingsOption(title: "Personal Hotspot", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen)),
                .switchCell(model: SettingsOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackgroundColor: .systemBlue, isOn: true)),
                               ]),

            Section(options: [
                .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed)),
                .staticCell(model: SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackgroundColor: .systemPink)),
                .staticCell(model: SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo)),
                .staticCell(model: SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo)),
            ]),

            Section(options: [
                .staticCell(model: SettingsOption(title: "General", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray)),
                .staticCell(model: SettingsOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray)),
                .staticCell(model: SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue)),
                .staticCell(model: SettingsOption(title: "Home Screen", icon: UIImage(named: "home.screen"), iconBackgroundColor: .systemBlue)),
                .staticCell(model: SettingsOption(title: "Accessibility", icon: UIImage(named: "human"), iconBackgroundColor: .systemBlue)),
                .staticCell(model: SettingsOption(title: "Wallpaper", icon: UIImage(named: "wallpaper"), iconBackgroundColor: .systemCyan)),
                .staticCell(model: SettingsOption(title: "Siri & Search", icon: UIImage(named: "siri"), iconBackgroundColor: .black)),
                .staticCell(model: SettingsOption(title: "Face ID & Passcode", icon: UIImage(systemName: "faceid"), iconBackgroundColor: .systemGreen)),
            ])
        ]
    }
    
}

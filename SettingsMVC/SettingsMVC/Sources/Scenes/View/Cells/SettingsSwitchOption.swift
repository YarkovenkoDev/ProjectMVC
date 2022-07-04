//
//  SettingsSwitchOption.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 03.07.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    //MARK: - Static Properties

    static let identifier = "SwitchTableViewCell"

    //MARK: - Views

    private lazy var iconContainer: UIView = {
        let view = UIView()

        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.iconCornerRadius
        view.layer.masksToBounds = true

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()

        label.numberOfLines = Metric.labelNumberOfLines

        return label
    }()

    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()

        switchButton.onTintColor = .systemGreen

        return switchButton
    }()

    //MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(switchButton)
        contentView.clipsToBounds = true
        accessoryType = .none
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Override Func

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - Metric.size
        iconContainer.frame = CGRect(
            x: Metric.iconContainerFrameX,
            y: Metric.iconContainerFrameY,
            width: size,
            height: size
        )

        let imageSize = size / Metric.imageSize
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )

        label.frame = CGRect(
            x: Metric.labelFrameX + iconContainer.frame.size.width,
            y: Metric.labelFrameY,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )

        switchButton.sizeToFit()
        switchButton.frame = CGRect(
            x: contentView.frame.size.width - switchButton.frame.size.width - 20,
            y: (contentView.frame.size.height - switchButton.frame.size.height) / 2,
            width: switchButton.frame.size.width,
            height: switchButton.frame.size.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        switchButton.isOn = false
    }

    //MARK: - Public Func

    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        switchButton.isOn = model.isOn ?? false
    }
    
}

//
//  StatusTableViewCell.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 03.07.2022.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    //MARK: - Static Properties

    static let identifier = "StatusTableViewCell"

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

    private lazy var statusLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = Metric.labelNumberOfLines
        label.textColor = .systemGray

        return label
    }()

    //MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(statusLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Override Func

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - Metric.size
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize = size/Metric.imageSize
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2 ,
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

        statusLabel.frame = CGRect(
            x: contentView.frame.size.width - iconContainer.frame.size.width - Metric.statusLabelFrameX,
            y: Metric.statusLabelFrameY,
            width: contentView.frame.size.width - iconContainer.frame.size.width - 15,
            height: contentView.frame.size.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        statusLabel.text = nil
    }

    //MARK: - Public Func
    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        statusLabel.text = model.statusTitle
    }
}


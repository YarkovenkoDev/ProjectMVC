//
//  TableSettingsView.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 02.07.2022.
//

import UIKit

final class TableSettingsView: UIView {

    //MARK: - Private Properties

    private var models = [Section]()

    //MARK: - Views

    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    //MARK: - Private Func

    private func commonInit() {
        setupHieracly()
        setupLayout()
        setupTable()
    }

    private func setupHieracly() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(StaticTableViewCell.self, forCellReuseIdentifier: StaticTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(StatusTableViewCell.self, forCellReuseIdentifier: StatusTableViewCell.identifier)
    }

    //MARK: - Public Func

    public func configureView(with models: [Section]) {
        self.models = models
    }
}

//MARK: - UITableViewDelegate

extension TableSettingsView: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]

        switch model {
        case .staticCell(let model):
            print(model.title)
        case .statusCell(let model):
            print(model.title)
        case .switchCell(let model):
            print(model.title)
        }
    }
}

//MARK: - UITableViewDataSource

extension TableSettingsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StaticTableViewCell.identifier,
                for: indexPath
            ) as? StaticTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .statusCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StatusTableViewCell.identifier,
                for: indexPath
            ) as? StatusTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

}



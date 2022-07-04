//
//  TableViewController.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 02.07.2022.
//

import UIKit

class TableViewController: UIViewController {

    //MARK: - Private Properties
    private var model: SettingsOptionModel?

    private var tableView: TableSettingsView? {
        guard isViewLoaded else { return nil }
        return view as? TableSettingsView
    }

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = TableSettingsView()
        model = SettingsOptionModel()

        configureView()
        navBarConfigs()
    }

    private func navBarConfigs() {
        navigationItem.title = "Settings"
    }

}

private extension TableViewController {
    func configureView() {
        guard let models = model?.createModels() else { return }
                tableView?.configureView(with: models)
    }
}

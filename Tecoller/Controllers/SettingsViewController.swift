//
//  SettingsViewController.swift
//  Tecoller
//
//  Created by 志波大輝 on 2018/11/28.
//  Copyright © 2018 志波大輝. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    }

}

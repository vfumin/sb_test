//
//  BondValueTableViewController.swift
//  Task
//
//  Created by Fumin Vladimir on 01.06.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class BondValueTableViewController: UIViewController{
    private let disposeBag = DisposeBag()
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let items = Observable.just(BondValue.allCases)
        items.bind(to: tableView.rx.items(cellIdentifier: "Cell")){(row, element, cell) in
            cell.textLabel?.text = element.rawValue.uppercased()
            }.disposed(by:disposeBag)
    }
    
}

//
//  ViewController.swift
//  MVVMExample
//
//  Created by Bilal Ahmad on 11/03/2022.
//

import UIKit

class EmployessViewController: UIViewController{
   
    @IBOutlet weak var tableView : UITableView!

    lazy var viewModel = {
            EmployeesViewModel()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }

    func initView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        
        tableView.register(EmployeeCell.nib, forCellReuseIdentifier: EmployeeCell.identifier)
    }

    func initViewModel () {
       
        viewModel.getEmployees()
        viewModel.reloadTableView = { [weak self] in
        DispatchQueue.main.async {
        self?.tableView.reloadData()
    }
  }
        
}
    
    
}

extension EmployessViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for:  indexPath) as? EmployeeCell else {fatalError("xib does not exist")}
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.EmployeeCell = cellVM
        return cell
    }
    
}

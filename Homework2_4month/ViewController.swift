//
//  ViewController.swift
//  SnapKitLesson2
//
//  Created by Бектур Каримов on 28/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
        private var tableView = UITableView()
    private var timeData:[Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupConstraimts()
        title = "Some News"
    }
    func setupTableView(){
        tableView.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.idCell)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func setupConstraimts(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
        
            make.edges.equalToSuperview()
        }
        APIManager.shared.getData { [weak self] result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    guard let self else {return}
                    self.timeData = data.articles
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomViewCell.idCell) as! CustomViewCell
        let value = timeData[indexPath.row]
        cell.configure(with: value)
//        cell.textLabel?.text = "dsasdvd"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


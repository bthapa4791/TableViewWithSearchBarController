//
//  ViewController.swift
//  TableViewWithUISearchBar
//
//  Created by Bimal Thapa on 9/20/17.
//  Copyright © 2017 Bimal Thapa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var myData: NSArray = ["One", "Two", "Three"]

    private var tableView: UITableView!
    
   var searchBarController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.backgroundColor = .brown
        
        searchBarController = UISearchController(searchResultsController: nil)
        
        searchBarController.searchBar.delegate = self
        
        tableView.tableHeaderView = searchBarController.searchBar
        
        tableView.setContentOffset(CGPoint.init(x: 0, y: 44), animated: false)
        
        self.view.addSubview(tableView)
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = myData[indexPath.row] as! String
        cell.backgroundColor = .brown
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        var statusBarFrame: CGRect = UIApplication.shared.statusBarFrame
//        var yDiff: CGFloat = (navigationController?.navigationBar.frame.origin.y)! - (navigationController?.navigationBar.frame.size.height)! - statusBarFrame.size.height;
//        navigationController?.navigationBar.frame = CGRect(x: 0, y: yDiff, width: 320, height: (navigationController?.navigationBar.frame.size.height)!)
//       
       navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


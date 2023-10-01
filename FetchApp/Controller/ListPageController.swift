//
//  ViewController.swift
//  FetchApp
//
//  Created by yajurva shrotriya on 9/29/23.
//

import UIKit

//Class inherits TableviewDatasource and Delegate functions
class ListPageController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Initialise outlets and variables
    @IBOutlet weak var tableView: UITableView!
    var datasource: [Item]?
    var groupdict: [String: Int] = [:]
    
    override func loadView() {
        super.loadView()
        loadJson()

    }
    
    //Set up view upon loading
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        
        let nib = UINib(nibName: "itemsTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "itemsTableViewCell")
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Making each individual cell from datasource
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "itemsTableViewCell") as! itemsTableViewCell
        
        
        cell.configureCell(id: datasource?[indexPath.row].id, listid: datasource?[indexPath.row].listId, name: datasource?[indexPath.row].name)
        
        //Configure cell with data
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Function to load JSon data into the app through a task session
    func loadJson(){
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let dataUrl = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")!
        
        let task = session.dataTask(with: dataUrl){data, response, error in
            
            //Ensure there is no error
            guard error == nil else{
                print("The error is: \(error!)")
                return
            }
            
            //Ensure there is Data found
            guard let content = data else{
                print("No data found")
                return
            }
            
            //Serialise the NSData object into a Dictionary [String:Any]
            do{
                let apiResponse = try JSONDecoder().decode([Item].self, from: content)
                    print("1")
                    let hiringData = apiResponse
                    self.datasource = hiringData
                    DispatchQueue.main.async {
                        
                        self.tableDataOrder()
                        
                    }

                
            }catch{
                print("Error while decoding")
            }
            
        }
        
        task.resume()
        
    }
    
    //Function to sort and filter the necessary data
    func tableDataOrder(){
        
        let datasource2 = datasource!.filter{ items in
            if items.name == ""{
                return false
            }
            else if items.name == nil{
                return false
            }
            else{
                return true
            }
        }
        datasource = datasource2

        //Sorting by Listid and name
        datasource = datasource?.sorted{ (lhs,rhs) in
            if lhs.listId! == rhs.listId! {
                return lhs.name! < rhs.name!
            }
            return lhs.listId! < rhs.listId!
        }
        
        self.tableView.reloadData()
    }
}


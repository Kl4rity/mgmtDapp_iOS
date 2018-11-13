//
//  FirstViewController.swift
//  DevP_tab
//
//  Created by Norb on 05.11.18.
//  Copyright © 2018 Norb. All rights reserved.
//

//pull to refresh
//live data objects
//spinner einbauen

import UIKit

//global set lists
var listGrpName = [""]
var listMemberName = [""]
var listEmail = [""]

//json
struct Course {
    init(json: [String: Any]){
        listGrpName = json["TO_BE_DEFINED"] as! [String]
        listMemberName = json["TO_BE_DEFINED"] as! [String]
        listEmail = json["TO_BE_DEFINED"] as! [String]
    }
}
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    //adds rows as long as items are in array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return listGrpName.count
    }
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //com: try to implement button :endcom| UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = listGrpName[indexPath.row]
        //com: try to implement button :endcom| as? ButtonTableViewCell
        
        return(cell)
    }
    //swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            listGrpName.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //parse json
        let jsonUrlString = "URL EINGEBEN"
        guard let url = URL(string: jsonUrlString) else
        {return}
        URLSession.shared.dataTask(with: url) {(data1, data2, data3) in
            
            guard let data = data1 else {return}
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
            }catch let jsonErr{
                print("Error JSON Serialization",jsonErr)
            }
            
        
        }.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


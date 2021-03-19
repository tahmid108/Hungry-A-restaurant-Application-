//
//  JsonViewController.swift
//  Hungry
//
//  Created by kuet on 8/12/19.
//  Copyright © 2019 Kuet. All rights reserved.
//


import UIKit

class JsonViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var arrData = [JsonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }
    
    func jsonParsing(){
        let url = URL(string: "http://www.json-generator.com/api/json/get/bUuHMfMuOG?indent=2")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for arr in results.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
}

extension JsonViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblArtist.text = arrData[indexPath.row].foodName
        cell.lblTrack.text = arrData[indexPath.row].price
        cell.lblrest.text = arrData[indexPath.row].restName
        cell.img.kf.setImage(with: URL(string: arrData[indexPath.row].artwork))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

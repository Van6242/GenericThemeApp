//
//  ViewController.swift
//  GenericThemeApp
//
//  Created by  on 5/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var myList = ["hi"]

    @IBOutlet weak var myTextf: UITextField!
    @IBOutlet weak var myTableview: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableview.delegate = self
        myTableview.dataSource = self
        loadFromUserDefalts()
    }
    @IBAction func addButton(_ sender: Any)
    {
        //get name
        let name = myTextf.text!
        myList.append(name)
        myTableview.reloadData()
        
        myTextf.text = ""
        saveToUserDefalts()
        
        
    }
    var canedit = false
    @IBAction func delbtn(_ sender: Any)
    {
        canedit = !canedit
        myTableview.setEditing(canedit, animated: true)
        myTableview.reloadData()
    }


    func saveToUserDefalts()
    {
        let defalts = UserDefaults.standard
        defalts.setValue(myList, forKey: "mylist")
    }
    func loadFromUserDefalts()
    {
        let defalts = UserDefaults.standard
        myList = defalts.object(forKey: "mylist") as! [String]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            myList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            saveToUserDefalts()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
       
        let item = myList[indexPath.row]
        cell.textLabel?.text = item
        //set other things here too
        return cell
    
    }
 
    
}


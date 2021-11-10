//
//  InboxViewController.swift
//  S7_Airbnb
//
//  Created by MAC17 on 10/11/21.
//

import UIKit

class InboxViewController: UIViewController {

   
    @IBOutlet weak var segmentOptions: UISegmentedControl!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Creae arreglo de lugares
    let people: [String] = ["Kiara Pinedo","Danna Vila","Karyluz Ccala","Sandra Alcantara"]
    let messages: [String] = ["hola kace? 🧐","pagame p 😡","habla somos?💃🏽","esta llamando listaaa!🥱"]
    
    let notifications: [String] = ["Tienes soli", "Favor de cerrar sesion en otros dispositivos"]
    let descriptions: [String] = ["El pepe quiere ser tu amix 😎", "Se entro desde una mac 🖥"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    @IBAction func onClickSegment(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    
    // setup de la tabla
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//extension de mi controlador
extension InboxViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentOptions.selectedSegmentIndex == 0 {
            return people.count
        } else {
            return notifications.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")!
        
        if segmentOptions.selectedSegmentIndex == 0 {
            cell.textLabel?.text = people[indexPath.row]
            cell.detailTextLabel?.text = messages[indexPath.row]
        }else {
            cell.textLabel?.text = notifications[indexPath.row]
            cell.detailTextLabel?.text = descriptions[indexPath.row]
        }
        return cell
    }
}

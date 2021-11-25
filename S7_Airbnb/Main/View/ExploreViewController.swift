//
//  ExplorerViewController.swift
//  S7_Airbnb
//
//  Created by MAC06 on 25/11/21.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //Creae arreglo de lugares
    let places: [String] = ["Mancora","Acapulco","Miami","Cancun"]
    let datesToTravel: [String] = ["4-6 Nov","11-14 Dic","1-5 Ene","3-6 Feb"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
           
   func setUpTable() {
       tableView.delegate = self
       tableView.dataSource = self
   }
}

extension ExploreViewController:  UITableViewDelegate, UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return places.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellExplore", for: indexPath) as! ExploreTableViewCell
       
       cell.lblTitle.text = places[indexPath.row]
       cell.lblAddress.text = datesToTravel[indexPath.row]
       
       if indexPath.row == 0 {
           cell.imageExplore?.image = UIImage(named: "mancora")
       } else if indexPath.row == 1 {
           cell.imageExplore?.image = UIImage(named: "acapulco")
       } else if indexPath.row == 2 {
           cell.imageExplore?.image = UIImage(named: "miami")
       } else {
           cell.imageExplore?.image = UIImage(named: "canun")
       }
       
      
       cell.lblPrice.text = "$120.00 / night"
       cell.lblRating.text = "4.69"
       cell.lblCountRating.text = "(120)"
       
       let cellView = UIView()
       cellView.backgroundColor = UIColor.systemBackground
       cell.selectedBackgroundView = cellView
       
       return cell
   }
        
}


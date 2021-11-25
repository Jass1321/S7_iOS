
//
//  ExplorerViewController.swift
//  S7_Airbnb
//
//  Created by MAC06 on 25/11/21.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let placeViewModel = PlaceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        configure()
        bind()
    }
           
   func setUpTable() {
       tableView.delegate = self
       tableView.dataSource = self
   }
    
    func configure() {
           placeViewModel.getPlaces()
   }
   
   func bind() {
       placeViewModel.refreshData = { [weak self] () in
           DispatchQueue.main.async {
               self?.tableView.reloadData()
           }
       }
   }
}

extension ExploreViewController:  UITableViewDelegate, UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return placeViewModel.arrayResults.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellExplore", for: indexPath) as! ExploreTableViewCell
               
       let object = placeViewModel.arrayResults[indexPath.row]
              
      cell.lblTitle.text = object.name
      cell.lblAddress.text = object.address
      cell.lblPrice.text = "S/.120.00"
      cell.lblRating.text = String(object.rating)
      cell.lblCountRating.text = "(\(object.userRatingsTotal))"
      
      let urlImage = URL(string: object.photo)
  
      let data = try? Data(contentsOf: urlImage!)
      
      if let imageData = data {
          cell.imageExplore?.image = UIImage(data: imageData)
      }
      //no se sombree
      let cellView = UIView()
      cellView.backgroundColor = UIColor.systemBackground
      cell.selectedBackgroundView = cellView
      
      return cell
   }
        
}


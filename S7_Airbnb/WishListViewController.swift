//
//  WishListViewController.swift
//  S7_Airbnb
//
//  Created by MAC17 on 10/11/21.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Creae arreglo de lugares
    let places: [String] = ["Mancora","Acapulco","Miami","Cancun"]
    let datesToTravel: [String] = ["4-6 Nov","11-14 Dic","1-5 Ene","3-6 Feb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // setup de la tabla
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func resizeImage(name: String, for size: CGSize) -> UIImage{
        let image = UIImage(named: name)
        let renderer = UIGraphicsImageRenderer(size:size)
        return renderer.image {
            (context) in image?.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = places[indexPath.section]
        cell.detailTextLabel?.text = datesToTravel[indexPath.section]
        
        // FORMA A LAS FOTOS
        cell.imageView?.layer.cornerRadius = 8.0
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.contentMode = .scaleAspectFit
       // cell.imageView?.translatesAutoresizingMaskIntoConstraints = true
       // cell.imageView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
       // cell.imageView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        if indexPath.section == 0 {
            cell.imageView?.image = UIImage(named: "mancora")
        }else if indexPath.section == 1 {
            cell.imageView?.image = UIImage(named: "acapulco")
        }else if indexPath.section == 2 {
            cell.imageView?.image = UIImage(named: "miami")
        }else {
            cell.imageView?.image = UIImage(named: "cancun")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
    
   
}

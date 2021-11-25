//
//  ExploreDetailViewController.swift
//  S7_Airbnb
//
//  Created by MAC06 on 25/11/21.
//

import UIKit

class ExploreDetailViewController: UIViewController {

    
    var name: String? = nil
    var address: String? = nil
    var rating: String? = nil
    var userRatingsTotal: String? = nil
    var photo: String? = nil
    
    @IBOutlet weak var imageDE: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = name!
        lblAddress.text = address!
        
        let urlImage = URL(string: photo!)
                
        let data = try? Data(contentsOf: urlImage!)
        
        if let imageData = data {
            imageDE.image = UIImage(data: imageData)
        }
               
        let actionImage = UITapGestureRecognizer(target: self, action: #selector(self.imageClick))
           
        imageDE.addGestureRecognizer(actionImage)
        imageDE.isUserInteractionEnabled = true
        
        print("Variables")
        print(name)
        print(address)
        print(rating)
        print(userRatingsTotal)
        
    }
    
    @objc func imageClick(sender: UITapGestureRecognizer) {
           dismiss(animated: true)
    }

   

}

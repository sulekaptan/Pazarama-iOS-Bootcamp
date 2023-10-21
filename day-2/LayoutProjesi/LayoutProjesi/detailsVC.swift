//
//  detailsVC.swift
//  LayoutProjesi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    //var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedSimpson = SelectedSimpson.shared.selected
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
}

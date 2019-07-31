//
//  ViewController.swift
//  ChapeuSeletor
//
//  Created by Rafael Forbeck on 29/07/19.
//  Copyright © 2019 Rafael Forbeck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var manhaButton: UIButton!
    @IBOutlet weak var tardeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manhaButton.layer.cornerRadius = 10
        tardeButton.layer.cornerRadius = 10
    }

    @IBAction func manhaPressed(_ sender: Any) {
        Model.shared.selectedPeriod = .morning
        performSegue(withIdentifier: "table", sender: self)
    }
    @IBAction func tardePressed(_ sender: Any) {
        Model.shared.selectedPeriod = .afternoon
        performSegue(withIdentifier: "table", sender: self)
    }
}


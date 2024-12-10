//
//  UnderConstructionViewController.swift
//  KIKI
//
//  Created by Fares Ajimi on 15/12/2021.
//

import UIKit

class UnderConstructionViewController: UIViewController {

    @IBOutlet weak var gifUIImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let underConstructionGif = UIImage.gifImageWithName("underConstruction") {
            self.gifUIImageView.image = underConstructionGif
        }
    }
}

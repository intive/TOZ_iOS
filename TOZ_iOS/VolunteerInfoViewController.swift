//
//  VolunteerInfoViewController.swift
//  TOZ_iOS
//

import UIKit

class VolunteerInfoViewController: UIViewController {

    @IBOutlet weak var beVolunteerButton: UIButton!
    @IBOutlet weak var textInfo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func configureView() {
        beVolunteerButton.backgroundColor = Color.Cell.Button.primary
        beVolunteerButton.tintColor = Color.Cell.Button.text
        beVolunteerButton.layer.cornerRadius = 5
    }
}

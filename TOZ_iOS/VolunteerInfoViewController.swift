//
//  VolunteerInfoViewController.swift
//  TOZ_iOS
//

import UIKit

class VolunteerInfoViewController: UIViewController {
    @IBOutlet weak var howToHelpDescription: UILabel!

    var becomeVolunteerOperation = BecomeVolunteerOperation()

    override func viewDidLoad() {
        super.viewDidLoad()
        getBecomeVolunteerDescription()
    }

    func getBecomeVolunteerDescription() {
        becomeVolunteerOperation.resultCompletion = { result in
            switch result {
            case .success(let becomeVolunteer):
                DispatchQueue.main.async {
                    self.howToHelpDescription.text = becomeVolunteer.howToHelpDescription
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        becomeVolunteerOperation.start()
    }
}

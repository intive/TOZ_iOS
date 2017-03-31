//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var organizationLabel: UILabel!
    let organizationInfoOperation = OrganizationInfoOperation()

    override func viewDidLoad() {
        getOrganizationInfo()
    }

    func getOrganizationInfo() {
        organizationInfoOperation.resultCompletion = { result in
            let text: String

            switch result {
            case .success(let organizationInfoItem):
                text = organizationInfoItem.name
            case .failure(let error):
                text = "\(error)"
            }

            DispatchQueue.main.async {
                self.organizationLabel.text = text
            }
        }
        organizationInfoOperation.start()
    }
}

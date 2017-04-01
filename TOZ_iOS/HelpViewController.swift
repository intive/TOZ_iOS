//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    let organizationInfoOperation = OrganizationInfoOperation()

    override func viewDidLoad() {
        getOrganizationInfo()
    }

    @IBAction func financeHelpButton(_ sender: UIButton) {
        performSegue(withIdentifier: "financeView", sender: self)
    }

    @IBAction func unwindToHelp(segue: UIStoryboardSegue) {
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
                // Do someting
            }
        }
        organizationInfoOperation.start()
    }
}

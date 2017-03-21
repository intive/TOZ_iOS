//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var organizationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkLayerConfiguration.setup()
        getOrgInfo()
    }

    func getOrgInfo() {
        let orgInfo = OrganizationInfoOperation()
        orgInfo.start()
        // item is of type OrganizationInfoItem
        orgInfo.success = { item in
            DispatchQueue.main.async {
            self.organizationLabel.text = "Organization: \(item.name) \n Bank Account Number: \(item.bankAccountNumber) \n Bank name: \(item.bankAccountBankName)"
            }
        }
        orgInfo.failure = { error in print(error.localizedDescription) }
    }
}

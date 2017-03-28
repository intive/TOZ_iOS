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
        getOrganizationInfo()
    }

    func getOrganizationInfo() {
        let organizationInfo = OrganizationInfoOperation()
        organizationInfo.start()
        organizationInfo.resultCompletion = { item in
            DispatchQueue.main.async {
            self.organizationLabel.text = "\(item.name) \n Bank Account Number: \(item.bankAccountNumber) \n Bank name: \(item.bankAccountBankName)"
            }
        }
    }
}

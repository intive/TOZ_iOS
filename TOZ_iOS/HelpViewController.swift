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
        // item is of type OrganizationInfoItem
        switch organizationInfo.result {
        case .success?:
            //maybe expects type (OrganizationInfoItem) but gets ((OrganizationInfoItem) -> Void) ?
            organizationInfo.result?.success = { item in
                DispatchQueue.main.async {
                self.organizationLabel.text = "Organization: \(item.name) \n Bank Account Number: \(item.bankAccountNumber) \n Bank name: \(item.bankAccountBankName)"
                }
            }
        default:
            //maybe expects type (Error) but gets ((Error) -> Void) ?
            organizationInfo.result?.failure = { error in print(error) }
        }
    }
}

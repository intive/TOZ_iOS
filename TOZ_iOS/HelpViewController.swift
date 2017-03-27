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
        // item should be of type OrganizationInfoItem
        switch organizationInfo.result {
        case .success?:
            organizationInfo.resultCompletion? = { item in
                DispatchQueue.main.async {
                self.organizationLabel.text = "\(.success.item.name) \n Bank Account Number: \(.success.item.bankAccountNumber) \n Bank name: \(.success.item.bankAccountBankName)"
                }
            }
        default:
            organizationInfo.resultCompletion? = { error in print(error) }
        }
    }
}

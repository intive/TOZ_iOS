//
//  HelpFinanceViewController.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 28.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpFinanceViewController: UIViewController {

    @IBOutlet weak var financeHeader: UILabel!
    @IBOutlet weak var financeDescription: UILabel!
    @IBOutlet weak var financeInfo: UILabel!

    var organizationInfoOperation = OrganizationInfoOperation()

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrganizationInfo()
    }

    func getOrganizationInfo() {
        organizationInfoOperation.resultCompletion = { result in
            switch result {
            case .success(let localOrganization):
                DispatchQueue.main.async {
                self.financeHeader.text = localOrganization.header
                self.financeDescription.text = localOrganization.description
                self.financeInfo.text = localOrganization.name + "\n" + localOrganization.branch + "\n" + localOrganization.addressStreet + " " + localOrganization.addressHouseNumber + "\n" + localOrganization.addressPostcode + " " + localOrganization.addressCity + "\n\n" + localOrganization.bankAccountNumber
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        organizationInfoOperation.start()
    }
}

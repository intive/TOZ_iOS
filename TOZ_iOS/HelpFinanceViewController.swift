//
//  HelpFinanceViewController.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 28.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpFinanceViewController: UIViewController {

    @IBOutlet weak var financeDescription: UILabel!
    @IBOutlet weak var financeInfo: UILabel!
    @IBOutlet weak var accountNumberAndName: UILabel!

    var organizationInfoOperation = OrganizationInfoOperation()

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrganizationInfo()
        self.accountNumberAndName.adjustsFontSizeToFitWidth = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.setNeedsDisplay()
    }

    func getOrganizationInfo() {
        organizationInfoOperation.resultCompletion = { result in
            switch result {
            case .success(let localOrganization):
                DispatchQueue.main.async {

                    var description: String {
                        var properDescription: String = ""
                        if BackendAuth.shared.token == nil {
                            if let descriptionText = localOrganization.invitationText {
                                properDescription = descriptionText
                            }
                        } else {
                            if let descriptionText = localOrganization.volunteerText {
                                properDescription = descriptionText
                            }
                        }
                        return properDescription
                    }

                    let street = localOrganization.street ?? ""
                    let houseNumber = localOrganization.houseNumber ?? ""
                    let apartmentNumber = localOrganization.apartmentNumber ?? ""
                    let postCode = localOrganization.postCode ?? ""
                    let city = localOrganization.city ?? ""
                    let bankName = localOrganization.bankName ?? ""

                    self.financeDescription.text = description
                    self.financeInfo.text = localOrganization.name + "\n" + postCode + " " + city + "\n" + street + " " + houseNumber + apartmentNumber
                    self.accountNumberAndName.text = localOrganization.accountNumber + "\n" + bankName
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
        organizationInfoOperation.start()
    }

}

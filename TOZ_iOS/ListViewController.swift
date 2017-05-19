//
//  ListViewController.swift
//  TOZ_iOS
//
//  Created by RKB on 14/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var collectionView: ListUICollectionView!
    let identifierCell = "Cell"
    var reservations: [ReservationItem] = [ReservationItem(idObject: "111", date: Date(), timeOfDay: .morning, ownerSurname: "W", ownerForename: "D")]
    var calendarHelper = CalendarHelper()
    var resultScheduleOperation: GetScheduleWeekOperation!

    override func viewDidLoad() {
        super.viewDidLoad()

        reservations.append(ReservationItem(idObject: "111", date: Date(), timeOfDay: .morning, ownerSurname: "W", ownerForename: "S"))
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width, height: 40)
        collectionView = ListUICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: identifierCell)

        collectionView.backgroundColor = UIColor.green
        self.view.addSubview(collectionView)
        reservations = []
        retrieveReservationsinRange()
        print(calendarHelper.rangeDateItemArray())
    }

    func retrieveReservationsinRange() {
        let fromDate = WeekdayItem(from: Date()).dataLabel
        let toDate = WeekdayItem(from: Date()).dataLabel
        resultScheduleOperation = GetScheduleWeekOperation(fromDate: fromDate, toDate: "2017-05-30")
        resultScheduleOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfReservation):
                DispatchQueue.main.async {
                    self.reservations = listOfReservation
                    self.collectionView.reloadData()
                    if self.reservations != listOfReservation {
                        fatalError()
                    }
                    print(listOfReservation)
                }
            case .failure(let error):
                print ("\(error)")
            }
        }

        resultScheduleOperation.start()
    }

}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return reservations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath)
        if let cell = cell as? ListCollectionViewCell {
            cell.OnCell(display: reservations[indexPath.row])
        }

        return cell

    }

}

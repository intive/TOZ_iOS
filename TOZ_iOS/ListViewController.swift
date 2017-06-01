//
//  ListViewController.swift
//  TOZ_iOS
//
//  Created by RKB on 14/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var checkBox: UISwitch!
    var label: UILabel!
    var stackFilter: UIStackView!
    var dayTime: UISegmentedControl!
    var collectionView: ListUICollectionView!
    let identifierCell = "Cell"
    var reservations: [ReservationItem] = [ReservationItem(idObject: "111", date: Date(), timeOfDay: .morning, ownerSurname: "W", ownerForename: "D")]
    var calendarHelper = CalendarHelper()
    var resultScheduleOperation: GetScheduleWeekOperation!


    override func viewDidLoad() {
        super.viewDidLoad()

        var naviHeight = self.navigationController?.navigationBar.bounds.height

        stackFilter = UIStackView(frame: CGRect(x: 0, y: naviHeight!, width: self.view.frame.width, height: 40))

        stackFilter.translatesAutoresizingMaskIntoConstraints = false

        stackFilter.axis = .horizontal
        stackFilter.distribution = .equalSpacing
        stackFilter.alignment = .fill
        stackFilter.spacing = 10
        stackFilter.backgroundColor = UIColor.white

        self.view.backgroundColor = UIColor.gray
        label = UILabel()
        label.textColor = UIColor.white
        label.text = "Moje"
        stackFilter.addArrangedSubview(label)
        checkBox = UISwitch()
        checkBox.isOn = true

        //checkBox.backgroundColor = UIColor.purple
        stackFilter.addArrangedSubview(checkBox)
        dayTime = UISegmentedControl(items: ["Rano", "Popołudniu"])

        stackFilter.addArrangedSubview(dayTime)

        self.view.addSubview(stackFilter)
        reservations.append(ReservationItem(idObject: "111", date: Date(), timeOfDay: .morning, ownerSurname: "W", ownerForename: "S"))

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width - 50, height: 40)
        layout.scrollDirection = .vertical
        layout.sectionFootersPinToVisibleBounds = true
        layout.sectionHeadersPinToVisibleBounds = true

        let collectionFrame = CGRect(x: 0, y: naviHeight! + 40 + 30, width: self.view.frame.width, height: self.view.frame.height - 170)

        collectionView = ListUICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: identifierCell)

        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false

        collectionView.backgroundColor = UIColor.green

        self.view.addSubview(collectionView)

        self.view.addConstraint(
            NSLayoutConstraint(
                item: collectionView,
                attribute: .top,
                relatedBy: .equal,
                toItem: stackFilter,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 10
        ))

//        self.navigationController?.navigationBar.addConstraints([NSLayoutConstraint(
//            item: self.view,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: stackFilter,
//            attribute: .bottom,
//            multiplier: 1.0,
//            constant: 10
//            )])
        //self.navigationController?.navigationBar.bottomAnchor.constraint(equalTo: stackFilter.topAnchor, constant: 20)
        //self.view.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 40)

        reservations = []
        retrieveReservationsinRange()
        print(calendarHelper.rangeDateItemArray())
    }

    func retrieveReservationsinRange() {
        let fromDate = WeekdayItem(from: Date()).dataLabel
        let toDate = WeekdayItem(from: Date()).dataLabel
        resultScheduleOperation = GetScheduleWeekOperation(fromDate: fromDate, toDate: "2017-06-30")
        resultScheduleOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfReservation):
                DispatchQueue.main.async {
                    self.reservations = listOfReservation
                    if self.reservations != listOfReservation {
                        fatalError()
                    }
                    self.updateUI()
                    //print(listOfReservation)
                }
            case .failure(let error):
                print ("\(error)")
            }
        }

        resultScheduleOperation.start()
    }

    func dayTimeChange(sender: UISegmentedControl!) {
        print("It Works, Value is --&gt;\(sender.selectedSegmentIndex)")
    }

    func checkBoxChange(sender: UISwitch!) {
        print("It Works, Value is --&gt;\(sender.isOn)")
    }

    func updateUI() {
        self.reservations.sort(by: { $0.date < $1.date })
        self.collectionView.reloadData()
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

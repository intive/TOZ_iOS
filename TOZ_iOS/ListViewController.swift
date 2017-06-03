//
//  ListViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var checkBox: UISwitch!
    var label: UILabel!
    var stackFilter: UIStackView!
    var dayTime: UISegmentedControl!
    var collectionView: UICollectionView!
    let identifierCell = "Cell"
    var reservations: [ReservationItem] = [] {
        didSet {
            reservationsFiltred = reservations
            reservationsFiltred.sort(by: { $0.date < $1.date })
        }
    }
    var reservationsFiltred: [ReservationItem] = []
    var freeReservation: [ReservationItem] = []
    var rangeDateItemArray: [WeekdayItem] = []
    var calendarHelper = CalendarHelper()
    var resultScheduleOperation: GetScheduleWeekOperation!

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = UIColor.gray

        //stackFilter = UIStackView(frame: CGRect(x: 0, y: naviHeight!, width: self.view.frame.width, height: 40))
        stackFilter = UIStackView()
        stackFilter.axis = .horizontal
        stackFilter.distribution = .equalSpacing
        stackFilter.alignment = .fill
        stackFilter.spacing = 5
        stackFilter.backgroundColor = UIColor.white
        //stackFilter.is

        label = UILabel()
        label.textColor = UIColor.white
        label.text = "Dostępne"
        label.translatesAutoresizingMaskIntoConstraints = false
        stackFilter.addArrangedSubview(label)

        checkBox = UISwitch()
        checkBox.isOn = false
        checkBox.addTarget(self, action: #selector(ListViewController.checkBoxChange(sender:)), for: .valueChanged)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        stackFilter.addArrangedSubview(checkBox)

        dayTime = UISegmentedControl(items: ["Wszystkie", "Rano", "Popołudniu"])
        dayTime.selectedSegmentIndex = 0
        dayTime.addTarget(self, action: #selector(ListViewController.tappedFilterDay(sender:)), for: .valueChanged)
        dayTime.translatesAutoresizingMaskIntoConstraints = false
        stackFilter.addArrangedSubview(dayTime)

        stackFilter.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackFilter)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width - 50, height: 40)
        layout.scrollDirection = .vertical
        layout.sectionFootersPinToVisibleBounds = true
        layout.sectionHeadersPinToVisibleBounds = true
        //let collectionFrame = CGRect(x: 0, y: naviHeight! + 40 + 30, width: self.view.frame.width, height: self.view.frame.height - 170)
        let collectionFrame = CGRect(x: 0, y: (self.view.frame.height)/6, width: self.view.frame.width, height: (5 * self.view.frame.height)/6)
        collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        //collectionView = UICollectionView(
        //collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: identifierCell)
        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.backgroundColor = UIColor.green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)

        stackFilter.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 5.0).isActive = true
        stackFilter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5.0)
        stackFilter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15.0)

        //NSLayoutConstraint(item: collectionView, attribute: .height   , relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 20.0).isActive = true
        //collectionView.heightAnchor.constraint(equalToConstant: 300)
        retrieveReservationsinRange()
        rangeDateItemArray = calendarHelper.rangeDateItemArray()
        //print(calendarHelper.rangeDateItemArray())
    }

    func retrieveReservationsinRange() {
        let fromDate = WeekdayItem(from: Date()).dataLabel
        let toDate = WeekdayItem(from: Calendar.current.date(byAdding: .day, value: 30, to: Date())!).dataLabel
        resultScheduleOperation = GetScheduleWeekOperation(fromDate: fromDate, toDate: toDate)
        resultScheduleOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfReservation):
                DispatchQueue.main.async {
                    self.reservations = listOfReservation
                    if self.reservations != listOfReservation {
                        fatalError()
                    }
                    self.updateUI()
                }
            case .failure(let error):
                print ("\(error)")
            }
        }

        resultScheduleOperation.start()
    }

    func tappedFilterDay(sender: UISegmentedControl) {
        print("Tapped tappedFilterDay: \(sender.selectedSegmentIndex)")
        //print(dayTime.selectedSegmentIndex)
        //print(dayTime.selectedSegmentIndex)
        filtrReservation()
        updateUI()
    }

    func checkBoxChange(sender: UISwitch!) {
        print("Tapped: \(sender.isOn)")
        filtrReservation()
    }

    func updateUI() {
        self.collectionView.reloadData()
    }

    func filtrReservation() {
        switch dayTime.selectedSegmentIndex {
            case 0, UISegmentedControlNoSegment:
                reservationsFiltred = reservations
            case 1:
                reservationsFiltred = reservations.filter({ $0.timeOfDay == .morning })
            case 2:
                reservationsFiltred = reservations.filter({ $0.timeOfDay == .afternoon })
            default:
                break
        }

        //reservation is
        if checkBox.isOn {
            for (_, rangeDateItemArrayItem) in rangeDateItemArray.enumerated() {
                if let resevationFound = reservations.index(where: { rangeDateItemArrayItem == WeekdayItem(from: $0.date)}) {
                    let reservationItem = ReservationItem(idObject: "", date: reservations[resevationFound].date, timeOfDay: .afternoon, ownerSurname: nil, ownerForename: nil)
                }
            }
        }

        //filter by name and surname
        //if checkBoxMineReservation.isOn {
            //reservationsFiltred = reservations.filter({ $0.ownerSurname == "name" && $0.ownerName == "name" })
        //}

        //reservationsFiltred.sort(by: { $0.date < $1.date })
    }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return reservationsFiltred.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath)
        if let cell = cell as? ListCollectionViewCell {
            cell.OnCell(display: reservationsFiltred[indexPath.row])
        }

        return cell

    }

}

struct FreeReservationItem {
    var date: Date
    var timeOfDay: TimeOfDay?
    var ownerSurname: String?
    var ownerForename: String?
}

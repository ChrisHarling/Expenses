//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Chris Harling on 6/2/19.
//  Copyright © 2019 Chris Harling. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var expenses = [Expense]()
    
    var dateFormatter = DateFormatter()
    var numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
        
        if let date = dateFormatter.date(from: "June 1, 2018 18:30"){
            expenses.append(Expense(title: "Dinner", amount: 32.50, date: date))
        }
        if let date = dateFormatter.date(from: "May 30, 2018 12:17"){
            expenses.append(Expense(title: "Office Supplies", amount: 59.34, date: date))
        }
        if let date = dateFormatter.date(from: "May 30, 2018 11:43"){
            expenses.append(Expense(title: "Uber", amount: 16.23, date: date))
        }
        if let date = dateFormatter.date(from: "May 29, 2018 8:45"){
            expenses.append(Expense(title: "Coffee", amount: 3.95, date: date))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath )
        
        if let cell = cell as? ExpenseTableViewCell{
            
            let expense = expenses[indexPath.row]
            
            numberFormatter.usesGroupingSeparator = true
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale.current
            
            cell.titleLabel.text = expense.title
            cell.amountLabel.text = numberFormatter.string(from: NSNumber(value: expense.amount))
            cell.dateLabel.text = dateFormatter.string(from: expense.date)
        }
        return cell
    }
}

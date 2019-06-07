//
//  ExpensesViewController.swift
//  ExpensesChallenge
//
//  Created by John Williams III on 6/6/19.
//  Copyright © 2019 John Williams III. All rights reserved.
//

import UIKit

struct ExpensesStruct {
    let title: String
    let amount: Double
    let date: Date
    
    init(title:String, amount:Double, date:Date) {
        self.title = title
        self.amount = amount
        self.date = date
    }
}


class ExpensesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var ExpenseArray = [ExpensesStruct]()
    
    
    @IBOutlet weak var tableviewOutlet: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ExpenseArray = loadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() -> [ExpensesStruct] {
        var ExpenseArray:[ExpensesStruct] = []
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy HH:mm"
        
        ExpenseArray.append(ExpensesStruct(title: "Dinner", amount:32.50, date:formatter.date(from: "June 1, 2018 18:30")!))
        ExpenseArray.append(ExpensesStruct(title: "Office Supplies", amount:59.34, date:formatter.date(from: "May 30, 2018 12:17")!))
        ExpenseArray.append(ExpensesStruct(title: "Uber", amount:16.23, date:formatter.date(from: "May 30, 2018 11:43")!))
        ExpenseArray.append(ExpensesStruct(title: "Coffee", amount:3.95, date:formatter.date(from: "May 29, 2018 8:45")!))
        
        return ExpenseArray
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpenseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseDataCell", for: indexPath) as! ExpenseTableViewCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy HH:mm"
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        
        let title = ExpenseArray[indexPath.row].title
        let amount = numberFormatter.string(from: ExpenseArray[indexPath.row].amount as NSNumber)
        let date = formatter.string(from: ExpenseArray[indexPath.row].date)
        
        cell.titleLabel.text = title
        cell.amountLabel.text = amount
        cell.dateLabel.text = date
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

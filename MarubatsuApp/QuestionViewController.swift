//
//  QuestionViewController.swift
//  MarubatsuApp
//
//  Created by 佐藤壮 on 2023/09/04.
//

import UIKit

class QuestionViewController: UITableViewController {

    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var answer: UISegmentedControl!
    
    var questions: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addQuiz(_ sender: Any) {
        if let text = addTextField.text,  !text.isEmpty {
            questions.append(text)
            let userDefaults = UserDefaults.standard
            userDefaults.set(questions, forKey: "questions")
            addTextField.text = ""
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func removeQuiz(_ sender: Any) {
        if questions.count > 0 {
            questions.removeLast()
            let userDefaults = UserDefaults.standard
            userDefaults.set(questions, forKey: "questions")
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

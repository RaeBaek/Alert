//
//  ViewController.swift
//  Alert
//
//  Created by 백래훈 on 2023/03/03.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showAlertController(style: UIAlertController.Style) {
        let alertController: UIAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
            print("OK pressed")
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        let anotherAction: UIAlertAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField { (field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        }
        
        
        self.present(alertController, animated: true, completion: {
            print("Alert controller shown")
        })
    }

    //MARK: @IBActions
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }

}


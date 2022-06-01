//
//  MenuVC.swift
//  OutdoorSocialMedia
//
//  Created by 정지원 on 2022/06/01.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func notLoginedYet(){
        let notLoginedAlert = UIAlertController(title: "로그인 알림", message: "로그인을 먼저 진행해 주세요.", preferredStyle: .alert)
        let actionGoLogin = UIAlertAction(title: "로그인 창으로 이동", style: .default, handler: {(action) in
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .popover
            self.present(nextVC, animated: true, completion: nil)
        })
        let actionCancle = UIAlertAction(title: "취소", style: .default, handler: {(action) in})
        notLoginedAlert.addAction(actionGoLogin)
        notLoginedAlert.addAction(actionCancle)
        present(notLoginedAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnMyHobby(_ sender: UIButton) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MyHobbyVC") as? MyHobbyVC else {return}
            nextVC.modalPresentationStyle = .popover
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
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

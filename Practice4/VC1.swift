//
//  VC1.swift
//  Practice4
//
//  Created by 이영규 on 2017. 6. 23..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class VC1 : UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate{
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var campusText: UITextField!
    
    @IBOutlet var partText: UITextField!
    
    
    @IBOutlet var listTable: UITableView!
    
    let partPicker : UIPickerView = UIPickerView()
    let partData : [String] = ["개발", "기획", "디자인"]
    var infoList : [CellVO] = [CellVO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTable.estimatedRowHeight = 50.0
        listTable.rowHeight = UITableViewAutomaticDimension
        initPickerView()
        listTable.isHidden = true
        listTable.delegate = self
        listTable.dataSource = self
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        print("탭탭")
        // self.idTxt.becomeFirstResponder()
        //자동으로 텍뷰에 포커스
        self.nameText.resignFirstResponder()
        //텍뷰에 포커스 아웃.
        self.campusText.resignFirstResponder()
        
    }
    
    func initPickerView(){
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width
            , height: view.frame.height)
        let bar = UIToolbar(frame:barFrame)
        let btnDone = UIBarButtonItem(title: "선택", style:  .done, target: self, action: #selector(selectedRow))
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        bar.setItems([btnSpace, btnDone], animated: true)
        
        partPicker.delegate = self
        partPicker.dataSource = self//피커뷰 딜리게이트 적용
        partText.inputView = partPicker//파트 텍스트에 해당 픽커 삽입
        partText.inputAccessoryView = bar//하트 텍스트에 바 형태 대입.
    }
    
    func selectedRow(){
        let row = partPicker.selectedRow(inComponent: 0)
        partText.text = partData[row]
        partText.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partData.count
        //이건 피커에서 보여줄 갯수
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partData[row]
        //이건 피커에서 보여줄 내용
    }
    
    @IBAction func addList(_ sender: Any) {
        let name = nameText.text
        let campus = campusText.text
        let part = partText.text!
        
        nameText.text = ""
        campusText.text = ""
        partText.text = ""
        
        switch part{
            
            case "개발":
                let infoVO = CellVO(name: name, campus: campus, part: part, partImg: "develop")
                infoList.append(infoVO)
                if infoList.count != 0{
                    listTable.isHidden = false
                }
                listTable.reloadData()
            
            case "기획":
                let infoVO = CellVO(name: name, campus: campus, part: part, partImg: "plan")
                infoList.append(infoVO)
                if infoList.count != 0{
                    listTable.isHidden = false
                }
                listTable.reloadData()
            
            case "디자인":
                let infoVO = CellVO(name: name, campus: campus, part: part, partImg: "design")
                infoList.append(infoVO)
                if infoList.count != 0{
                    listTable.isHidden = false
                }
                listTable.reloadData()
        default:
                print("no option")
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
        //해당 셀 이름과 클래스 명시
        let infoVO = infoList[indexPath.row]
        
        cell.nameLabel.text = infoVO.name//cell의 name의 text는 row번 째 infoVO의 list
        cell.campusLabel.text = infoVO.campus
        cell.partLabel.text = infoVO.part
        if let imgName = infoVO.partImg{
            cell.partImg.image = UIImage(named: imgName)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVO = infoList[indexPath.row]
        //infoVO는 테이블(infoList)에서 row번 째 인덱스
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {return}
        
    
        dvc.name = infoVO.name//dvc는 DetailVC
        dvc.campus = infoVO.campus
        dvc.image = UIImage(named: infoVO.partImg!)//이미지를 통으로 넘김(String형식으로)
        navigationController?.pushViewController(dvc, animated: true)
        
        
        
        
    }

    
}


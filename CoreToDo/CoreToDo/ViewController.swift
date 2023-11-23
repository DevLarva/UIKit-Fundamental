//
//  ViewController.swift
//  CoreToDo
//
//  Created by 백대홍 on 11/23/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // AppDelegate에서 CoreData context를 가져옴. 이 context를 통해 CoreData와 상호작용.
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()   // UITableView를 생성하고 설정. cell의 identifier는 "cell"로 설정.
    
    // ToDoListItem 객체를 담을 배열을 생성. 이 배열은 테이블 뷰의 데이터 소스로 사용.
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Core ToDo"  // 뷰 컨트롤러의 타이틀을 "Core ToDo"로 설정.
        getAllItems()
        view.addSubview(tableView)
        
        // 테이블 뷰의 delegate와 dataSource를 self로 설정.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        
        // 네비게이션 바의 오른쪽 버튼을 추가 버튼으로 설정. 버튼을 누르면 didTapAdd 메소드가 호출.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    // 추가 버튼을 눌렀을 때 호출되는 메소드
    @objc private func didTapAdd() {
        //이 alert는 사용자에게 새로운 메모를 입력받음.
        let alert = UIAlertController(title: "새로운 메모", message: "새로운 메모를 입력하세요.", preferredStyle: .alert)
        
        // alert에 텍스트 필드를 추가
        alert.addTextField(configurationHandler: nil)
        
        //이 액션을 선택하면 입력받은 메모를 CoreData에 저장.
        alert.addAction(UIAlertAction(title: "추가", style: .cancel, handler: { [weak self] _ in
            // guard문을 이용해 텍스트 필드의 텍스트가 비어있지 않은지 확인
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty
                    
            else {
                return
            }
            // 텍스트 필드의 텍스트를 CoreData에 저장
            self?.createItem(name: text)
        }))
        // 생성한 alert를 보여줌.
        present(alert, animated: true)
    }
    
    // 테이블 뷰의 행 개수를 반환하는 메소드. models 배열의 개수와 같다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    // 테이블 뷰의 특정 셀이 선택되었을 때 호출되는 메소드.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 선택 효과를 즉시 해제합니다.
        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "편집", message: nil, preferredStyle: .actionSheet)
        
        
        sheet.addAction(UIAlertAction(title: "취소하기", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "수정하기", style: .default, handler: { _ in
            let alert = UIAlertController(title: "수정", message: "수정할 메모를 입력하세요.", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "추가", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty
                        
                else {
                    return
                }
                
                self?.updateItem(item: item, newName: newName)
            }))
            
            self.present(alert, animated: true)
        }))
        
        sheet.addAction(UIAlertAction(title: "삭제하기", style: .destructive, handler: { [weak self] _ in
            self?.deleteItem(item: item)
        }))
        present(sheet, animated: true)
    }
    
    // MARK: - Core Data
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            
            DispatchQueue.main.async { // 메인 스레드에서 테이블 뷰를 리로드
                self.tableView.reloadData()
            }
            
        } catch {
            //error
        }
        
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
}

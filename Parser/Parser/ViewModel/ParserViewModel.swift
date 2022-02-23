//
//  ParserViewModel.swift
//  Parser
//
//  Created by mnameit on 17/02/22.
//

import Foundation

public class ParserVieModel
{
    var parserArray=Box([Any]())
    let locationName = Box("Loading...")
    var update: () -> Void = { }
    
    init() {
        DispatchQueue.main.async {
            self.getData()
        }
    }
    func getData() {
        var modelArray = [Any]()
        
        guard let filePath=Bundle.main.path(forResource: "issues", ofType: ".csv") else {
            return
        }
        var data=""
        do {
            data=try String(contentsOfFile:filePath)
        } catch  {
            print(error)
            return
        }
        
        var rows=data.components(separatedBy: "\n")
        rows.removeFirst()
        for row in rows {
            var columns=row.components(separatedBy: ",")
            columns=columns.map({$0.replacingOccurrences(of: "\"", with: "")})
         
            if columns.count==4 {
                let parserModel = ParserModel(FirstName: columns[0], SurName: columns[1], count: columns[2], DOB: columns[3])
                modelArray.append(parserModel)
            }
        }
        parserArray=Box(modelArray)
        update()
    }
}

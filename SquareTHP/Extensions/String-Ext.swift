//
//  String-Ext.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import Foundation

extension String {
    func asPhoneNumber() -> String {
        var str = "("
        str += self.prefix(3)
        str += ") "
        
        let endingStr = self.suffix(7)
        str += endingStr.prefix(3)
        str += "-"
        str += endingStr.suffix(4)
        
        return str
    }
}

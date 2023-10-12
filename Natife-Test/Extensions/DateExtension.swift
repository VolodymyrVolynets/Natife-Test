//
//  DateExtension.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import Foundation

extension Date {
    var stringDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/YYYY"
        return dateFormater.string(from: self)
    }
}

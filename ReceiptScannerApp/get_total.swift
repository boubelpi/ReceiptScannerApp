//
//  get_total.swift
//  ReceiptScannerApp
//
//  Created by Pavel Boubel on 15/12/22.
//

import Foundation

var receipt : Double? = nil

func get_total(_ str : String) -> Double? {
    var ans : Double? = nil
    receipt = nil
    var array_of_doubles : [Double] = []
    let str2 = str + " "
    let ar_of_str = Array(str2)
    var wrd = ""
    var cnt_of_dots = 0
    for i in 0...str2.count - 1 {
        if (ar_of_str[i] != " ") {
            wrd += String(ar_of_str[i])
            if (ar_of_str[i] == ".") {cnt_of_dots += 1}
        }
        else {
            let x = Double(wrd)
            if (x != nil && cnt_of_dots == 1) {array_of_doubles.append(x!)}
            wrd = ""
            cnt_of_dots = 0
        }
    }
    array_of_doubles.sort() {$0 > $1}
    if (array_of_doubles.count == 0) {return ans}
    else if (array_of_doubles.count == 1) {ans = array_of_doubles[0]}
    else {ans = array_of_doubles[1]}
    receipt = ans!
    return ans
}

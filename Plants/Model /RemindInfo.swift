//
//  RemindInfo.swift
//  Plants
//
//  Created by Tahani Mohammed on 24/04/1446 AH.
//

import Foundation

struct Reminder: Identifiable , Equatable {
    
  let id = UUID()
  var title: String
    var room: String
    var light: String
    var wateringDays: String
    var waterAmount: String
    
  var isCompleted = false
}

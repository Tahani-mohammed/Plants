//
//  AddReminderView.swift
//  Planto
//
//  Created by Tahani Mohammed on 23/04/1446 AH.
//

import SwiftUI

struct AddReminderView: View {
    
//    enum FocusableField: Hashable {
//        case title , room , light , wateringDay , waterAmount
//    }
    
@State var selectedRoom = 0
@State  var selectedLight = 0
@State  var selectedWatering = 0
@State  var selectedWater = 0
    //WOOOW THNI GOOOD WOOORK 
var onCommit: (_ reminder: Reminder) -> Void
var onDelete: (() -> Void)?
    
let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony","Bathroom"]
let lights = ["Full Sun", "Partial Sun", "Low Light"]
let watering = ["Every day", "Every 2 days", "Every 3 days", "Once a week","Every 10 days", "Every 2 weeks"]
let water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    
@State private var reminder = Reminder(title: "", room: "" , light: "" , wateringDays: "" , waterAmount: "")
    
    @Environment(\.dismiss)
     private var dismiss
    
private func commit() {
      onCommit(reminder)
        dismiss()
    }
    
private func cancel() {
      dismiss()
    }
private func deleteReminder() {
        onDelete?() // Call delete closure
        dismiss()
       }
       
    
    var body: some View {
        
        NavigationStack {
            
            Form{
                Section{
                    HStack {
                        Text("Plant Name")
                        .foregroundColor(Color.white)

                TextField("" , text: $reminder.title)
                        
                    }
                }.listRowBackground(Color.grary)
                .foregroundColor(Color.white)
                Section{
                    Picker(selection: $selectedRoom,
                           label:
                            HStack {
                        Image(systemName:"location")
                        Text("Room")
                    }) {
                        ForEach(0..<rooms.count, id: \.self) {
                            Text(rooms[$0])
                        }
                    }
                    
                    .onChange(of: selectedRoom) {
                        reminder.room = rooms[selectedRoom]
                    }
                    Picker(selection: $selectedLight,
                           label:
                            HStack {
                        Image(systemName:"sun.max")
                        Text("Light")
                    }
                    ) {
                        ForEach(0..<lights.count, id: \.self) {
                            Text(lights[$0])
                        }
                    }
                    
                    .onChange(of: selectedLight) {
                        reminder.light = lights[selectedLight]
                    }
                }.listRowBackground(Color.grary)
                    .pickerStyle(.menu)
                    .accentColor(.gray)
                Section {
                    Picker(selection: $selectedWatering,
                           label:
                            HStack {
                        Image(systemName:"drop")
                        Text("Watering Days")

                    }
                    ) {
                        ForEach(0..<watering.count, id: \.self) {
                            Text(watering[$0])
                        }
                    }
                    .onChange(of: selectedWatering) {
                        reminder.wateringDays = watering[selectedWatering]
                    }
                    
                    Picker(selection: $selectedWater,
                           label:
                            
                            HStack {
                        Image(systemName:"drop")
                        Text("Water")

                    })
                    {
                        ForEach(0..<water.count, id: \.self) {
                            Text(water[$0])
                        }
                    }
                    .onChange(of: selectedWater) {
                        reminder.waterAmount = water[selectedWater]
                    }
                 }.listRowBackground(Color.grary)
                    .pickerStyle(.menu)
                    .accentColor(.gray)
                
        }.background(Color.lightgray)
        .scrollContentBackground(.hidden)
           .foregroundColor(.white)
     
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder")
                        .font(.headline)
                        .foregroundColor(Color.white)
                }
                
            ToolbarItem(placement: .cancellationAction) {
            Button(action: cancel) {
            Text("Cancel")
            .foregroundColor(.greeni)
                        }
                      }
            ToolbarItem(placement: .confirmationAction) {
            Button(action: commit) {
            Text("Add")
            .foregroundColor(.greeni)
                      }
                    }
                 }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
  static var previews: some View {
      AddReminderView { reminder in
       }
  }
}

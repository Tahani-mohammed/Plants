//
//  SetReminderDelete.swift
//  Plants
//
//  Created by Tahani Mohammed on 24/04/1446 AH.
//

import SwiftUI

struct SetReminderDelete: View {
    
@State private var plantName: String = ""
    
@State private var selectedRoom = 0
let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony","Bathroom"]
    
@State private var selectedLight = 0
let lights = ["Full Sun", "Partial Sun", "Low Light"]
    
@State private var selectedWatering = 0
let watering = ["Every day", "Every 2 days", "Every 3 days", "Once a week","Every 10 days", "Every 2 weeks"]
    
@State private var selectedWater = 0
let water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
        
@State var showShet = false

@Environment(\.dismiss) var dismiss

    var body: some View {
     
            NavigationView {
        
                VStack{
                    Form {
                        Section {
                            HStack { Text("Plant Name")
                                TextField("Pothos", text: $plantName,
                                          prompt: Text("Pothos")
                                    .foregroundColor(.whity.opacity(0.6)))
                            }
                            
                        }.listRowBackground(Color.grary)
                        
                        Section {
                            Picker(selection: $selectedRoom,
                                   label:
                                    HStack {
                                Image(systemName:"location")
                                Text("Room")
                            }) {
                                ForEach(0..<rooms.count, id: \.self) {
                                Text(rooms[$0])
                                }
                            }.pickerStyle(.menu)
                            
                                .accentColor(.whity)
                            
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
                            }.pickerStyle(.menu)
                                .accentColor(.whity)
                            
                        }.listRowBackground(Color.grary)
                        
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
                            }.pickerStyle(.menu)
                                .accentColor(.whity)
                            
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
                            }.pickerStyle(.menu)
                                .accentColor(.whity)
                        }.listRowBackground(Color.grary)
                        
                        Section {
                            HStack {
                                
                                Button(action:{
                                }, label: {
                                 Text("Delete Reminder")
                                        .foregroundColor(.redi)
                                        .padding(.leading, 100.0)
                                
                                })
                            }
                            
                        }.listRowBackground(Color.grary)
                        
                        
                    }.background(Color.lightgray)
                        .scrollContentBackground(.hidden)
                        .foregroundColor(.white)
                    
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action:{
                                    dismiss()
                                    }, label: {
                                Text("Cancel")
                              .foregroundColor(.greeni)  })
                                
                            }
                            ToolbarItem(placement: .principal) {
                                Text("Set Reminder")
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                
                                           }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action:{
                                }, label: {
                                    Text("Save")
                                    .foregroundColor(.greeni)  })
                            }
                            
                        }
                }
            }
        }
        }
    

struct SetReminderDelete_Previews: PreviewProvider {
  static var previews: some View {
      SetReminderDelete()

  }
}

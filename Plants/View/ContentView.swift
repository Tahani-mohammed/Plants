//
//  ContentView.swift
//  Plants
//
//  Created by Tahani Mohammed on 24/04/1446 AH.
//

import SwiftUI

extension Color {

static let lightgray = Color (red:28/255,green:28/255, blue:30/255)
static let grary = Color (red:44/255,green:44/255, blue:46/255)
static let whity = Color (red:142/255,green:142/255, blue:147/255)
static let redi = Color (red:234/255,green:113/255, blue:102/255)
}

struct ContentView: View {
    
    var onAddReminder: (Reminder) -> Void
    @State private var reminders = Reminder.samples
    @State private var AddReminderPresented = false
    @State private var allRemindersCompleted = false
    
private func presentAddReminderView() {
        AddReminderPresented.toggle()
    }
    
private func checkAllRemindersCompleted() {
        allRemindersCompleted = reminders.allSatisfy { $0.isCompleted }
    }
    
private func deleteReminder(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders.remove(at: index)
            checkAllRemindersCompleted()
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if allRemindersCompleted {
                    AllRemindersCompleted {_ in
                    reminders.removeAll()
                    allRemindersCompleted = false
                    }
                }
                
                else {
                    Text("My Plants 🌱")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 163.799)
                    Divider()
                        .overlay(.gray)
                    
                    Text("Today")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 249.403)
                    
                    
                List($reminders) { $reminder in
                        
                    VStack(alignment: .leading, spacing: 2){
                        HStack{
                                    Image(systemName: "location")
                                    .foregroundColor(.whity)
                                    Text(reminder.room)
                                    .foregroundColor(.whity)
                            }
                        HStack{
                                Image(systemName: reminder.isCompleted
                                      ? "largecircle.fill.circle"
                                      : "circle")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                Text(reminder.title)
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            }
                        
                            .onTapGesture {
                                reminder.isCompleted.toggle()
                                checkAllRemindersCompleted()
                            }
                        HStack{
                                Image(systemName: "sun.max")
                                .foregroundColor(.yallowy)
        .padding(5).background(Color.gray.opacity(0.2)).cornerRadius(9)
                                Text(reminder.light)
                                .foregroundColor(.yallowy)
                                .padding(5).background(Color.gray.opacity(0.2)).cornerRadius(9)
                                
                                Image(systemName: "drop")
                                .foregroundColor(.bluey)
                                .padding(5).background(Color.gray.opacity(0.2)).cornerRadius(9)
                                Text(reminder.waterAmount)
                                .foregroundColor(.bluey)
                                .padding(5).background(Color.gray.opacity(0.2)).cornerRadius(9)

                                Divider()
                            }
                            
                        }.listRowBackground(Color.black)
                        
                            .swipeActions {
                                Button(role: .destructive) {
                                deleteReminder(reminder)
                                } label: {
                                Label("Delete", systemImage: "trash")
                                }
                            }
                        
                    }.listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.black)
                    
                        .toolbar {
                            ToolbarItemGroup(placement: .bottomBar) {
                            Button(action: presentAddReminderView) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                .foregroundColor(.greeni)
                                Text("New Reminder")
                                .foregroundColor(.greeni)
                                    }
                                }
                                
                                Spacer()
                            }
                        }.scrollContentBackground(.hidden)
                        .background(Color.black)
                    
                    
                       .sheet(isPresented: $AddReminderPresented) {
                        AddReminderView { newReminder in
                        reminders.append(newReminder)
                        onAddReminder(newReminder)
                        checkAllRemindersCompleted()
                        AddReminderPresented = false
                                      }
                               }
                }
                
            }.scrollContentBackground(.hidden)
                .background(Color.black)
            
                .onAppear {
                    checkAllRemindersCompleted()
                }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(onAddReminder: { _ in }) 
        }
    }
}

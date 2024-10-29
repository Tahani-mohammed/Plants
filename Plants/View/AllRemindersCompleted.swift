////
////  AllRemindersCompleted.swift
////  Planto
////
////  Created by Tahani Mohammed on 18/04/1446 AH.
////
///
///
import SwiftUI

struct AllRemindersCompleted: View {
    
    @State var showSheet = false
    var onAddReminder: (Reminder) -> Void
    
    var body: some View {
        
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                Text("My Plants 🌱")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 163.799)
                    .padding(.top,30)
                
                  
                Divider()
                    .overlay(.gray)

                    .padding(.bottom, 700)
            }
            
            VStack{
                
                Image("plank")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 253.0, height: 244.0)
                
                Text("All Done! 🎉")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 52)
                
                Text("All Reminders Completed")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, -5)
                    .padding(.horizontal, 49.0)
            
            }
        
            HStack{

                Button(action:{ showSheet.toggle() }, label:{
                    HStack {
                   Image(systemName:"plus.circle.fill")
                      .foregroundColor(.greeni)
                        Text("New Reminder")
                    .foregroundColor(.greeni)
                    .fontWeight(.bold)
                        
                        Spacer()
                    } .padding(.top,700)
                    .padding(.horizontal, 20)
            
                   })
                
                .sheet(isPresented: $showSheet) {
                    AddReminderView { newReminder in
                        onAddReminder(newReminder) 
                        showSheet = false
                                 }
                             }
                    }
            }

            
            }
    }
        
struct AllRemindersCompleted_Previews: PreviewProvider {
    static var previews: some View {
        AllRemindersCompleted { _ in }
    }
}

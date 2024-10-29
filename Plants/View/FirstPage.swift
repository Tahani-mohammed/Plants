////
////  Untitled.swift
////  Planto
///
// Created by Tahani Mohammed on 16/04/1446 AH.
//
import SwiftUI

struct FirstPage: View {
    
@State private var showSheet = false
@State private var isNavigating = false
var onAddReminder: (Reminder) -> Void
@State var showShet = false

    var body: some View {
        
        NavigationStack {
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 163.799)
                
                Divider()
                    .overlay(.gray)
                    .padding(.bottom, 700)
            }
            
            VStack{
                
                Image("q")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 219, height: 227)
                
                
                Text("Start your plant journey!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 52)
                
                Text("Now all your plants will be in one place and we will help you take care of them 🪴.")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 25)
                    .padding(.horizontal, 49.0)
                
                
                Button(action: {
                    showSheet.toggle()},
                       label: {
                    Text("Set Plant Reminder")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 280.0, height: 40.0)
                        .background(Color.greeni)
                        .cornerRadius(10)
                        .padding(.top, 25)
                })
                
                .sheet(isPresented: $showSheet) {
                AddReminderView { newReminder in
                onAddReminder(newReminder) // إالتذكير
                    showSheet = false // إغلاق الشيت
                       isNavigating = true // تفعيل التنقل للصفحة الرئيسية
                   }
             }
                
            }.navigationDestination(isPresented: $isNavigating) {
                ContentView(onAddReminder: {_ in 
                    // Logic for adding a reminder
                })
            }
          }
      
        }
    }
}
    

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FirstPage(onAddReminder: { _ in })
        }
    }
}


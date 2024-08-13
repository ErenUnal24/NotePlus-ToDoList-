//
//  AddView.swift
//  ToDoList
//
//  Created by Eren on 9.08.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Bir şeyler yaz...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: saveButtonPressed, label: {
                    Text("Kaydet".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Yapılacak ekle 🖋️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Yeni hedefiniz en az 3 karakter uzunluğunda olmalı! 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    Group {
        NavigationStack{
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
        
    }
    
}

//
//  NewMessageView.swift
//  MessengerClone
//
//  Created by seemakus on 4/23/26.
//

import SwiftUI

struct NewMessageView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var profileName : String = ""
    @State var newMessageVM : NewMessageViewModel = NewMessageViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("To:", text: $profileName)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.1))
                    .frame(maxWidth: .infinity, minHeight: 50)
                VStack(alignment: .leading, spacing: 12) {
                    Text("CONTACTS")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                       ScrollView {
                           ForEach(newMessageVM.users) { user in
                            
                            HStack( spacing: 20 ) {
                                AppImageView(imageSource: .systemImage("person.circle.fill"), imageWidth : 40, imageHeight: 40, contentMode: .fit)
                                VStack(alignment: .leading) {
                                    Text(user.fullName)
                                    Divider()
                                }
                                Spacer()
                            }
                            
                        }
                    }
                }.padding(.horizontal, 12)
                
            }
            .navigationBarTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action : {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.footnote)
                            .foregroundColor(.black)
                    })
                    
                }
               
            }
        }.task {
            await newMessageVM.fetchAllUsers()
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView()
    }
    
}

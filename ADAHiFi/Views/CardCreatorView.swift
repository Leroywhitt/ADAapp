//
//  CardCreatorView.swift
//  ADAHiFi
//
//  Created by dmoney on 10/5/23.
//

import SwiftUI
import PhotosUI




struct CardCreatorView: View {
    @State private var showImagePicker = false
    @State private var showImagePicker2 = false
    @State private var selectedImage: UIImage?
    @State private var selectedImages: UIImage?
    
    @Binding var cards : [Card]
    @State private var name = ""
    @State private var desc = ""
    @State private var contact = ""
    @State private var note = ""
    @State private var CColor = Color.blue
    
    
    var body: some View {
        
        
        
        Form{
            TextField("Enter your name and pronouns", text: $name)
            TextField("Enter a short description", text: $desc)
            TextField("Enter your contact information", text: $contact)
            TextField("This isnt real", text: $note)
            ColorPicker("Pick the color of your card!", selection: $CColor)
            
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Add Image")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.showImagePicker2 = true
            }) {
                Text("Add Image")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: self.$selectedImage)
        }
            
                .sheet(isPresented: $showImagePicker2) {
                    ImagePicker(selectedImage: self.$selectedImages)
                    
                    
                }
            
                .onDisappear{
                    let image: Image
                    if let uiImage = selectedImage {
                        image = Image(uiImage: uiImage)
                    } else {
                        image = Image(systemName: "person.fill")
                    }
                    
                    let pimage: Image
                    if let uiImage = selectedImages {
                        pimage = Image(uiImage: uiImage)
                    } else {
                        pimage = Image(systemName: "person.fill")
                    }
                    
                    let newCard = Card(cardColor: CColor, name: name, cardDesc: desc, cardCon: contact, cardNote: note, proPic: image, cardPic: pimage)
                    cards.append(newCard)
                }
            
        }
    
}
//#Preview {
//    CardCreatorView()
//}

//
//  pinListView.swift
//  LUNA
//
//  Created by Ivan Montes on 10/12/24.
//

import SwiftUI




struct pinListView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
            NavigationView {
                if let userData = userViewModel.userPins {
                    List(userData) { pin in
                        NavigationLink(destination: pinDetailView(pin: pin)) {
                            HStack(alignment: .center) {
                                Image(systemName: "mappin.and.ellipse")
                                    .resizable()
                                //                        .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 8)
                                
                                VStack(alignment: .leading) {
                                    Text(pin.title)
                                        .font(.title)
                                    Text(pin.description)
                                        .font(.subheadline)
                                    
                                    Text(pin.creationDate.formatted(.dateTime))
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                
                                
                            }
                            .padding()
                            // TODO: make the HStack take up the width of the screen
                            //                    .background(Color.white)
                            //                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            //                    .shadow(radius: 5)
                            
                            .padding(.vertical, 4)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    .navigationTitle("Pin List")
                    .listStyle(PlainListStyle())
                }
                else {
                    Text("")
                }
                
            }.onAppear {
                userViewModel.fetchUserPins()
            }
    }
}

#Preview {
    pinListView()
}

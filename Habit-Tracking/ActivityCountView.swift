//
//  ActivityCountView.swift
//  Habit-Tracking
//
//  Created by Fernando Jurado on 29/10/24.
//

import SwiftUI


struct ActivityCountView: View {
    var activity: Activity
    var data: Activities
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    Text(activity.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .padding()
                    
                    Text("\(activity.completionCount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .padding()
                        
                    
                }
            }
            VStack{
                Text("\(activity.description)")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
            }
            .padding()
            HStack(alignment: .center, spacing: 50) {
                Button(action: {
                    var newActivity = activity
                    newActivity.completionCount += 1
                    if let index = data.place.firstIndex(of: activity) {
                        data.place [index] = newActivity
                    }
                } ,label: {
                    Image(systemName: "plus")
                        .font(.title)
                        .frame(width: 50 , height:  50)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(.gray)
                        .background(.white)
                        .clipShape(.circle)
                        .shadow(radius: 10)
                    
                    
                })
                .padding()
                
                Button(action: {
                    var newActivity = activity
                    newActivity.completionCount -= 1
                    if let index = data.place.firstIndex(of: activity) {
                        data.place [index] = newActivity
                    }
                } ,label: {
                    Image(systemName: "minus")
                        .font(.title)
                        .frame(width: 50 , height: 50)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(.gray)
                        .background(.white)
                        .clipShape(.circle)
                        .shadow(radius: 10)
                })

            }
            .navigationTitle("Activity Count")
            Spacer()

        }
       
        
    }

}
    
    
    #Preview {
        ActivityCountView(activity: .example, data: Activities())
        
    }



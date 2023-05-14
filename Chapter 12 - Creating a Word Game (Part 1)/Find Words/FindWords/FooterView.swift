//
//  FooterView.swift
//  FindWords
//
//  Created by Stephen DeStefano on 11/29/22.
//

import SwiftUI

struct FooterView: View {
    
    //MARK: - PROPERTIES
    @ObservedObject var appData = DataModel()
    @Binding var userEnteredWordsArray: [String]
    
    var foundWords: Double {
        let wordCount = userEnteredWordsArray.count
        //if theres no words in the array, return 0
        if wordCount == 0 {
            return 0
        }
        var letterAverage = 0
        //get a total of all the letters in each word
        for letterCount in userEnteredWordsArray {
            letterAverage += letterCount.count
        }
        return Double(letterAverage / wordCount)
    }
 
    var body: some View {
        VStack {
            HStack(spacing: 80) {
                ZStack {
                    Image("background").resizable()
                        .frame(width: 80, height: 50)
                        .clipShape(Capsule())
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .shadow(color: .black, radius: 1, x: -1, y: -1)
                    
                    Text("\(userEnteredWordsArray.count)")
                        .frame(width: 50, height: 20)
                        .font(.system(size: 25))
                        .padding(20)
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                    
                    Image("foundWords").resizable()
                        .aspectRatio(contentMode: .fill).frame(width: 100, height: 70)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .offset(y: 40)
                        .padding(.horizontal, -10)
                        .padding(.bottom, -10)
                }
                
                ZStack {
                    Image("background").resizable()
                        .frame(width: 80, height: 50)
                        .clipShape(Capsule())
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .shadow(color: .black, radius: 1, x: -1, y: -1)
                    
                    Text("\(foundWords, specifier: "%.0f")")
                        .frame(width: 50, height: 20)
                        .font(.system(size: 25))
                        .padding(20)
                        .foregroundColor(Color.white)
                    
                    Image("letterAverage").resizable()
                        .aspectRatio(contentMode: .fill)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .frame(width: 100, height: 70)
                        .offset(y: 40)
                        .padding(.bottom, -10)
                }
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView( userEnteredWordsArray: .constant(["0"]))
            .previewLayout(.fixed(width: 350, height: 125))
    }
}

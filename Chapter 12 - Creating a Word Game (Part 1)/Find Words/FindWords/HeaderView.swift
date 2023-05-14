//  HeaderView.swift

import SwiftUI

struct HeaderView: View {
    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack {
            Image("title").resizable()
                .frame(width: 250, height: 50)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            //info button
            Button(action: {
                self.showSettings.toggle()
            }){
                Image(systemName: "info.circle")
                    .font(.system(size: 30, weight: .medium))
                    .padding(.top, 10)
                    .accentColor(Color.black)
            }.offset(x: 160)
             .sheet(isPresented: $showSettings) {
                //show the settings view
                SettingsView()
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showSettings: .constant(false))
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

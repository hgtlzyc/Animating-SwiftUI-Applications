
import SwiftUI

struct SettingsView: View {
    @ObservedObject var appData = DataModel()
    //dismiss the SettingsView
    @Environment(\.presentationMode) var presentationMode
    
    //haptic feedback
    var hapticImpact = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        VStack {
            Text("Language Settings")
                .font(.title).bold()
                .padding(.top, 20)
            
            Form {
                Section(header: Text("Select a language")) {
                    VStack(alignment: .center, spacing: 10) {
                        HStack {
                            //english button
                            Button(action: {
                                hapticImpact.impactOccurred()
                                appData.englishIsOn = true
                                appData.spanishIsOn = false
                                appData.italianIsOn = false
                            }){
                                configureButton(buttonText: "English")
                            }.buttonStyle(ButtonFlash())
                            Spacer()
                            
                            //english - checkmark appears when englishIsOn is true
                            addCheckmark(isLanguageOn: appData.englishIsOn)
                            //english flag
                            Image("engFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        Divider()
                        
                        HStack {
                            //Spanish button
                            Button(action: {
                                hapticImpact.impactOccurred()
                                appData.englishIsOn = false
                                appData.spanishIsOn = true
                                appData.italianIsOn = false
                            }){
                                configureButton(buttonText: "Spanish")
                            }.buttonStyle(ButtonFlash())
                            Spacer()
                            
                            //spanish - checkmark appears when spanishIsOn is true
                            addCheckmark(isLanguageOn: appData.spanishIsOn)
                            //spanish flag
                            Image("esFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        
                        Divider()
                        
                        HStack {
                            //Italian button
                            Button(action: {
                                hapticImpact.impactOccurred()
                                appData.englishIsOn = false
                                appData.spanishIsOn = false
                                appData.italianIsOn = true
                            }){
                                configureButton(buttonText: "Italian")
                            }.buttonStyle(ButtonFlash())
                            Spacer()
                            
                            //italian - checkmark appears when italianIsOn is true
                            addCheckmark(isLanguageOn: appData.italianIsOn)
                            //italian flag
                            Image("itFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        
                        //MARK: - DISMISS BUTTON
                        HStack(alignment: .center) {
                            Spacer()
                            
                            Button(action: {
                                hapticImpact.impactOccurred()
                                presentationMode.wrappedValue.dismiss()
                                    
                            }){
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Done")
                                        .padding(.horizontal, 5)
                                }.padding(8)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                            }.foregroundColor(Color.white)
                                .background(Color.green)
                                .cornerRadius(20).shadow(color: .black, radius: 1, x: 1, y: 1)
                                .buttonStyle(ButtonFlash())
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

//style the button with a background and text
struct configureButton: View {
    var buttonText = ""
    var body: some View {
        ZStack {
            Image("background").resizable()
                .frame(width: 70, height: 35)
                .cornerRadius(10)
            
            Text(buttonText)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }
    }
}

struct ButtonFlash: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(color: .black, radius: 2, x: 2, y: 2)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

//add checkmark
struct addCheckmark: View {
    var isLanguageOn: Bool = false
    var body: some View {
        VStack{
            Image(systemName: "checkmark.circle")
                .imageScale(.small).foregroundColor(.green)
                .font(Font.largeTitle.weight(.regular))
                .opacity(isLanguageOn ? 1.0 : 0)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

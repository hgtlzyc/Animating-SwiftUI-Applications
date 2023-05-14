
import SwiftUI

struct ContentView: View {
    @State private var randomWord: String = ""
    @ObservedObject var appData: DataModel
    @State var wordToPlayFrom = "Click for Word"
    @State var showSettings: Bool = false
    @State private var horizontalFLip = false
    @State private var errorTitle = ""
    @State private var errorDescription = ""
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            //MARK: - HEADER
            HeaderView(showSettings: $showSettings)
            
            //MARK: - PICKER
            PickerView()
            
            //MARK: - BUTTON
            Button(action: {
                playSound(sound: "buttonClick", type: "m4a")
                hapticImpact.impactOccurred()
                appData.getRandomWord()
                wordToPlayFrom = appData.baseWord
                horizontalFLip.toggle()
            }){
                ZStack {
                    Image("background").resizable()
                        .renderingMode(.original)
                        .frame(width: 125, height: 50)
                        .cornerRadius(15)
                    Text("New Word")
                        .foregroundColor(.white)
                }
            }.padding(7)
                .shadow(color: .black, radius: 2, x: 1, y: 1)
                .shadow(color: .black, radius: 2, x: -1, y: -1)
            
            //MARK: - WORD TO PLAY FROM
            VStack {
                //word letter count string
                Text("\(appData.letterCount)")
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .foregroundColor(Color.white)
                    .bold()
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                
                HStack () {
                    //right hand image
                    Image(systemName: "hand.point.right")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    //animate the right hand with spring
                        .animation(.spring(dampingFraction:0.2),value: horizontalFLip)
                    
                    Text(wordToPlayFrom)
                        .font(.custom("HelveticaNeue-Medium", size: 38))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .scaleEffect(x: horizontalFLip ? -1 : 1, y: 1)
                        .scaleEffect(x: horizontalFLip ? -1 : 1, y: 1)
                        .animation(.spring(dampingFraction:0.8),value: horizontalFLip)
                    
                    //left hand image
                    Image(systemName:"hand.point.left")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .padding(-4)
                    //animate the left hand with spring
                        .animation(.spring(dampingFraction:0.2),value: horizontalFLip)
                }
            }
            
            //MARK: - TEXT FIELD AND LIST
            TextField("Enter your word", text: $appData.userEnteredWord)
                .textInputAutocapitalization(.never)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 55)
                .onSubmit(appData.addWordToList)
            
            ///List view to display the user input
            List(appData.userEnteredWordsArray, id: \.self) { word in
                HStack {
                    Image(systemName: "\(word.count).circle")
                    Text(word)
                }
                .foregroundColor(.black)
                .font(.system(size: 18))
            }
            .frame(width: 285, height: 190, alignment: .center)
            .cornerRadius(10)
            .foregroundColor(Color.blue)
            .font(.system(size: 50))
            
            //MARK: - FOOTER VIEW
            FooterView(userEnteredWordsArray: $appData.userEnteredWordsArray)
        }
        .background(Image("background").resizable()
            .edgesIgnoringSafeArea([.all])
            .aspectRatio(contentMode: .fill)
            .frame(width: 500, height: 800))
        .onAppear (perform: appData.getRandomWord)
        
        //add the alert popup
        .alert(isPresented: $appData.errorMessageIsShown) {
            Alert(title: Text(appData.errorTitle), message: Text(appData.errorDescription), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: DataModel())
    }
}




import Foundation
import SwiftUI

class DataModel: ObservableObject {    
    
    @Published var allWordsInFile = [String]()
    @Published var baseWord = ""
    @Published var userEnteredWord = ""
    @Published var userEnteredWordsArray = [String]()
    @Published var letterCount = ""
    @Published var showSettings: Bool = false
    
    //error properties
    @Published var errorMessageIsShown = false
    @Published var errorTitle = ""
    @Published var errorDescription = ""
    
    //haptic feedback
    @Published var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //properties to stpre in user defaults
    @AppStorage ("selectedSegment") var selectedSegment: Int = 0
    @AppStorage ("englishIsOn") var englishIsOn: Bool = false
    @AppStorage ("spanishIsOn") var spanishIsOn: Bool = false
    @AppStorage ("italianIsOn") var italianIsOn: Bool = false
    
    //splash view property
    @Published var change = false
    
    //FUNTIONS
    //starts the game off with a random word by looking in the apps bundle for the language file
    func getRandomWord() {
        guard let wordsURL = Bundle.main.url(forResource: setWordLengthAndLanguage(), withExtension: "txt"),
            let wordsConverted = try? String(contentsOf: wordsURL) else {
            assert(false, "There was a problem loading the data file from the bundle.")
            return
        }
        let allWordsInFile = wordsConverted.components(separatedBy: "\n")
        baseWord = allWordsInFile.randomElement() ?? "SwiftUI"
    }
   
    //sets the word length and language for the game
    func setWordLengthAndLanguage() -> String {
        let language = ["English": "En", "Spanish": "ES", "Italian": "It"]
        let wordLength = [1: "7", 2: "8", 3: "9"]
        var dataFile = ""
        var selectedLanguage = ""

        if englishIsOn == true {
            selectedLanguage = "English"
        } else if spanishIsOn == true {
            selectedLanguage = "Spanish"
        } else if italianIsOn == true {
            selectedLanguage = "Italian"
        }
        if let languageCode = language[selectedLanguage], let lengthCode = wordLength[selectedSegment] {
            dataFile = "\(lengthCode)LetterWords\(languageCode)"
            letterCount = "🇱🇷 \(lengthCode) letter word - \(selectedLanguage) 🇱🇷"
        }
        return dataFile
    }
    
    //adds the users word to the list view
    func addWordToList() {
        let usersWord = userEnteredWord.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        //guard against one letter words - they are too easy
        guard usersWord.count > 1 else {
            return
        }
        
        //is the word a duplicate
        if !isWordDuplicate(word: usersWord) {
        displayErrorMessage(messageTitle: "You already used this word", description: "Keep looking!")
        return
        }
        
        //is the word possible given your base word letters to work with?
        guard isWordFoundInBaseWord(userGuessWord: usersWord) else {
            displayErrorMessage(messageTitle: "This word is not possible", description: "Create only words from the letters in the given word")
            return
        }
        //is the word a real word in the dictionary? - only real words allowed
        guard isWordInDictionary(word: usersWord) else {
            displayErrorMessage(messageTitle: "This is not a valid word", description: "Use only real words")
            return
        }
        userEnteredWordsArray.insert(usersWord, at: 0)
        userEnteredWord = ""
    }
    
    //check to see if the word is a duplicate
    func isWordDuplicate(word: String) -> Bool {
        return userEnteredWordsArray.filter { $0 == word }.isEmpty
    }
    
    //check to see if the word is possible given the baseWord letters
    func isWordFoundInBaseWord(userGuessWord: String) -> Bool {
        var comparisonWord = baseWord
        return userGuessWord.allSatisfy { letter in
            guard let position = comparisonWord.firstIndex(of: letter) else {
                return false
            }
            comparisonWord.remove(at: position)
            return true
        }
    }
    
    //error message
    func displayErrorMessage(messageTitle: String, description: String) {
        errorTitle = messageTitle
        errorDescription = description
        errorMessageIsShown = true
    }
    
    //check to see if the word is a real word in the dictionary
    func isWordInDictionary(word: String) -> Bool {
        return UITextChecker().rangeOfMisspelledWord(in: word, range: NSRange(location: 0, length: word.utf16.count), startingAt: 0, wrap: false, language: "en").isNotFound
    }
   
}
extension NSRange {
    var isNotFound: Bool {
        return location == NSNotFound
    }
}

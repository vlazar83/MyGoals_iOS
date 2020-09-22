//
//  Utils.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 26..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    // age related messages, for each age group
    static let defaultAge20RelatedSentences : [String] = ["Életkorszakodra azt mondják, hogy átmenet a serdülőből a felnőtt korba. A 2000 évek eleje óta nem is annyira fiatal felnőtt kornak, hanem inkább készülődő, kezdődő felnőttkornak mondja a magyar szakirodalom.","Életszakaszod egyik jellemző élménye lehet a „kapunyitási pánik.” Komplex és sok szempontból bizonytalan felnőttkort kell megkezdeni, ami ma különösen nehéz. Posztmodern korunkban kortársaid számára nagyon nagy feladatot jelenet az önálló felnőtté válás.", "Kortársaid közül - egy 2014-es felmérés szerint - Magyarországon a korosztály kétharmada szüleivel élt.", "Az életútra egészében tekinteni, azt folyamatában szemlélni a keresztény hit olyan lényegi eleme, ami a mai modernitás értelmezésében egyáltalán nem természetes. Különleges ajándék az, hogy ez megadatik neked.", "Tudtad, hogy az érettségizettek aránya 1970 óta 18 év feletti népesség körében megháromszorozódott, a diplomások száma megötszöröződött? Mivel az oktatásban töltött idő radikálisan kitolódott, a felnőtté válás legfontosabb elemei elkezdtek egymástól elválni és a felnőtté válás folyamata akár évtizedes életszakasszá vált.", "Korosztályodnak egy több eseményből álló folyamat révén kell felnőtté válnia. Tipikusan 6 stációt kell végigjárnia mindenkinek: 1.Önálló döntéshozatal a tanulmányokat és a munkehelyet tekintve. 2.Anyagi önfenntartás elérése. 3.Önálló önfenntartó életvitel elérése. 4. Hosszú távú párkapcsolat kialakulása. Az elköteleződés megjelenése. 5.Saját otthon megteremtése. 6.Gyermek(ek) születése, ami lezárja a fiatal felnőttkor első szakaszát, és egy átmenet egy új szakaszba.", "Érdekesség: egy 15-29 évesek körében végzett felmérés szerint a megkérdezettek 64% úgy vélte, hogy a felnőttség legfontosabb ismeréve az önálló döntés és 55% gondolta úgy, hogy felnőttnek érzi magát."]
    
    static let defaultAge20RelatedSentences_en : [String] = ["It is said for your age that it is a transition from adolescence to adulthood. Since the beginning of the 2000s, the Hungarian literature says that it is not so much a young adulthood, but rather a preparatory, beginning adulthood.", "One of the typical experiences of your life phase may be the „gate-opening panic.” You have to start a complex and in many ways precarious adulthood, which is especially difficult today. In our postmodern age, becoming an independent adult is a very big task for your contemporaries. ", "According to a 2014 survey, two-thirds of your age group lived with their parents in Hungary.", "Looking at the life path as a whole, in the process of contemplating it, is an essential element of the Christian faith that is not at all natural in the interpretation of modernity today. A special gift is that it is given to you.", "Did you know that the proportion of graduates in the population over the age of 18 has tripled since 1970, and the number of graduates has quadrupled? As time spent in education has radically shifted, the key elements of adulthood have begun to separate and the process of adulthood has been decades.", "Your age group needs to become an adult through a multi-event process. Typically, everyone has to go through 6 stations: 1. Independent decision-making in terms of studies and workplace. 2. Achieving material self-sufficiency. 3. Achieving a self-sustaining lifestyle. 4. Developing a long-term relationship. The emergence of commitment. 5. Creating one's own home. 6. The birth of child (ren) that completes the first stage of young adulthood and a transition to a new stage. ", "Interestingly, according to a survey of 15-29 year olds, 64% of those surveyed thought that knowing adulthood was the most important part of self-determination and 55% thought they felt like an adult."]
    
    static let defaultAge30RelatedSentences : [String] = ["Tudtad, hogy Daniel Levinson azt az életszakaszt melyben vagy még az előzővel egy egységben látja és „Korai felnőttkornak” nevezi. Az ő szakaszai: (17 év) korai felnőttkori átmenet, belépés a felnőttkorba, 30 éves kori átmenet, megszilárdulás, középkori átmenet (45év)","A „felnőtt” kifejezés egy idealizált és statikus, már nyelvi megjelenésében is egy bizonyos befejezett és elért állapot szintje jelenik meg, ami nem fejezi ki teljesen hogy a fejlődés egy felnőtt ember életében is állandóan zajló folymat. A változás nem egy állapot, hanem egy életen át tartó folyamat, melynek megvannak a maga kisebb és nagyobb eseményei. Maga a változás sem elérendő cél, hanem a belső érlelődési folyamat eredménye...", "A felnőttkor a saját élettörténetnek a tanulás folyamata által való dinamikus és kontextuális felépítése"]
    
    static let defaultAge30RelatedSentences_en : [String] = ["Did you know that Daniel Levinson sees the stage of life in which he or she is in unity with the previous one and calls it 'Early Adulthood.' His stages: (17 years) early adult transition, entry into adulthood, 30 years transition, consolidation, medieval transition (45 years) ","The term 'adult' is an idealized and static, already in its linguistic appearance, a level of a certain completed and achieved state, which does not fully express the fact that development is a constant process in an adult's life. Change is not a state, but a a lifelong process with its own smaller and larger events. Change itself is not a goal to be achieved, but the result of an internal maturation process ... ", "The dynamic and contextual construction of one's own life story through the learning process in adulthood"]
    
    static let defaultAge40RelatedSentences : [String] = ["Ennek az életszakasznak az egyik jellemző kérdése: mi olyan tudok alkotni, ami megmarad utánam?","Ennek az életszakasznak az egyik legfontosabb változása, hogy az élet első felében szövődött kapcsolatrendszer átalakul: egy része valódi krízist jelentő folyamatok közepette felbomlik, majd újjászövődik. (315)", "A Jung-féle lélektani megközelítés szerint az életközép útján olyan változások történnek, melyek  - a szó legtágabb értelmében – vallásos kérdések. A lét, az emberi élet legmélyét kutató törekvések indulnak el. (316)", "Az életközépútján ránk köszön árnyékszemélyiségünk (vagy ahogy Gyökössy Endre nevezi: sötét felebarátunk) és arra hív, hogy tisztázzuk a vele való viszonyunkat (ez nem a teológiai értelemben vett óemberünk, hanem személyiségünk eddig – valamilyen okból – megtagadott, elnyomott része)", "Spirituális oldalról nézve az életközép egyik legfontosabb feladata, hogy mélyen átéljük, megértsük Isten Jézusban nekünk adott irgalmának igazi mélységét. Esélyt kapunk, hogy a Pállal együtt meghalljuk: „elég neked az én kegyelmem” (2Kor 12, 9)", "„Bennem voltál én meg künn (...) Velem voltál, s én nem voltam veled (...) Aztán fölharsant szózatod, megtörted lelkem siket csendjét, kigyulladt bennem ragyogó világosságod, s elűzted rólam a vakoskodó homályt. Illatod kiáradt, s nekem elállt a lélegzetem” (Szent Ágoston vallomásai 27. fej. dr. Vass József fordítása)", "Az életközép nemzedék egyfajta tükör-tengelyt alkot. Visszatükrözik a korábbi nemzedékek lehetséges értékeit, hordozva azok átkait és áldásait saját döntéseikben, de ugyanígy már láthatják saját nevelésük eredményét vagy csődjét is gyermekeik, unokáik sorsának alakulásában. (328.)", "Ebbe az életkorba jutva az élet értékei súlyozásra kerülnek. Mi mennyit ér?  Mindenki látja, hogy mindennek következménye van, s tettei nyomot hagynak környezetében. Egyre több helyzetben kerül előtérbe a „belső hang”, mely figyelmezteti saját árnyékaira. Vagy éppen kevéssé érékesnek érzi eddigi tetteit, s teljese fordulatot tesz. Ez akár a család, akár a környezet számára lehet teljesen érhetetlen Pál-fordulás.", "Ez az életszakasz nagy váltás az alkotás és az elmúlás közötti átmenet. Az előbbi még javában folyik, de az utóbbi megtapasztalása egyre valóságosabb, egyre közelibb..."]
    
    static let defaultAge40RelatedSentences_en : [String] = ["One of the characteristic questions of this stage of life is: what can I create that will remain after me?","One of the most important changes in this stage of life is that the system of relationships complicated in the first half of life is transformed: some of it disintegrates in the midst of real crisis processes and then re-weaves. (315)", "According to Jung's psychological approach, changes take place in the middle of life that are, in the broadest sense of the word, religious issues. The search for existence, the depths of human life, begins. (316)", "In the middle of his life, our shadow personality greets us (or as Endre Gyökössy calls us: our dark neighbor) and calls us to clarify our relationship with him (this is not our theologically old man, but a denied, oppressed part of our personality so far).", "From a spiritual point of view, one of the most important tasks in the middle of life is to experience deeply, to understand the true depth of God's mercy given to us in Jesus. We get a chance to hear with Paul, „My grace is sufficient for you” (2 Cor 12: 9)", "„You were in me and I was out (...) You were with me and I was not with you (...) Then your voice roared, you broke the deaf silence of my soul, your bright light shone within me, and you cast away the blinding gloom from me. Your scent was poured out, and my breath ceased” (St. Augustine's Confessions, Chapter 27, translated by Dr. József Vass)", "The middle-aged generation forms a kind of mirror axis. They reflect the possible values ​​of previous generations, carrying their curses and blessings in their own decisions, but in the same way they can already see the result or bankruptcy of their own upbringing in the evolution of the fate of their children and grandchildren. (328.)", "At this age, the values ​​of life are weighted. What is it worth? Everyone sees that everything has consequences, and his actions leave a mark on his surroundings. In more and more situations, the „inner voice”, which warns of its own shadows. Or he feels his actions so far are less valuable, and he makes a complete turn. This can be a completely incomprehensible Paul turn for either the family or the environment.", "This stage of life is a great shift in the transition between creation and passing away. The former is still in full swing, but the experience of the latter is becoming more real, closer and closer ..."]
    
    static let lastDisplayedAgeRelatedMessageKey = "LAST_DISPLAYED_AGE_RELATED_MESSAGE_KEY"
    
    static func generateLeadingIdeaCard(withIdea: String) -> SampleCardModel{
        
        return SampleCardModel(cardGoal: NSLocalizedString("Leading Idea", comment: ""),
        cardGoalDescription: withIdea,
        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/leading_idea")!),
        cardType: SampleCardModel.cardTypes.LeadingIdea)
        
    }
    
    static func loadCreatedCardsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: CreatedCardSet.createdCardSetKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let createdCards = try decoder.decode([SampleCardModel].self, from: data)
                CreatedCardSet.shared.setCardModels(NewCardModels: createdCards)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    static func storeCreatedCardsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(CreatedCardSet.shared.getCardModels())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: CreatedCardSet.createdCardSetKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func loadCardsFromUserDefaults(key: String) -> [SampleCardModel] {
        var createdCards:[SampleCardModel] = []
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                createdCards = try decoder.decode([SampleCardModel].self, from: data)

                } catch {
                    print("Unable to Decode Notes (\(error))")
                }
        }
        return createdCards
    }
    
    static func storeCardsToUserDefaults(cardSet: [SampleCardModel], key: String){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(cardSet)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func loadStatisticsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Statistics.statisticsKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let statistics = try decoder.decode([Day].self, from: data)
                Statistics.shared.setStatistics(newStatisticsArray: statistics)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    static func storeStatisticsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(Statistics.shared.getStatistics())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: Statistics.statisticsKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func storeStatisticsYearToUserDefaults(){

        let defaults = UserDefaults.standard
        defaults.set(Statistics.shared.year, forKey: Statistics.statisticsYearKey)

    }
    
    static func loadStatisticsYearFromUserDefaults() -> Int{
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: Statistics.statisticsYearKey)
    }
    
    static func getRedCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).redCardCount
            }
        }
        
        return total
    }
    
    static func getGreenCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).greenCardCount
            }
            
        }
        
        return total
    }
    
    static func getLightGreenCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).lightGreenCardCount
            }
        }
        
        return total
    }
    
    static func getBlueCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).blueCardCount
            }
        }
        
        return total
    }
    
    
    static func getDayOfYear() -> Int{
        let date = Date() // now
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)
        return day!
    }
    
    // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
    static func getDayOfWeek() -> Int {
        return Date().dayNumberOfWeek()!
    }
    
    static func getFirstDayOfWeekBasedOnToday() -> Int {
        
        let todayInYear = getDayOfYear()
        let todayInWeek = getDayOfWeekInCorrectFormat()
        
        if(todayInYear - todayInWeek + 1 <= 0){
            return 1
        } else {
            return todayInYear - todayInWeek + 1
        }
        
    }
    
    static func getLastDayOfWeekBasedOnToday() -> Int {
        
        let todayInYear = getDayOfYear()
        let todayInWeek = getDayOfWeekInCorrectFormat()
        var returnNumber = getDayOfYear()  // set to this starting point first
        
        // in case of year end coming during the week.
        if(todayInYear + 7 - todayInWeek >= 366){
            
            // Get the current year
            let year = Calendar.current.component(.year, from: Date())
            // Get the first day of next year
            if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
                // Get the last day of the current year
                let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear)
                let cal = Calendar.current
                let day = cal.ordinality(of: .day, in: .year, for: lastOfYear!)
                returnNumber = day!
            }
            
        } else {
            returnNumber = todayInYear + 7 - todayInWeek
        }
        
        return returnNumber
        
    }
    
    static func getDayOfWeekInCorrectFormat() -> Int {
        
        switch getDayOfWeek() {
        case 1:
            return 7
        case 2:
            return 1
        case 3:
            return 2
        case 4:
            return 3
        case 5:
            return 4
        case 6:
            return 5
        case 7:
            return 6
        default:
            // TODO later
            print("This should not happen..TODO Case")
        }
        
        return Date().dayNumberOfWeek()!
    }
    
    static func loadSettingsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Settings.settingsKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let settings = try decoder.decode(SettingsData.self, from: data)
                //Statistics.shared.setStatistics(newStatisticsArray: statistics)
                Settings.shared.setSettingsData(newSettings: settings)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        if(Settings.shared.getSettingsData().goldenSentences.count == 0){
            Settings.shared.addDefaultGoldenSentences()
        }
        
    }
    
    static func storeSettingsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(Settings.shared.getSettingsData())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: Settings.settingsKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func getRandomGoldenSentence() -> String?{
        let goldenSentenceCount = Settings.shared.getSettingsData().goldenSentences.count
        if(goldenSentenceCount > 0) {
            let number = Int.random(in: 0 ..< goldenSentenceCount)
            return Settings.shared.getSettingsData().goldenSentences[number]
        } else {
            return nil
        }
        
    }
    
    static func getRandomAgeRelatedMessage() -> String{
        let age = Settings.shared.getSettingsData().age
        var selectedMessage = ""
        
        let locale = NSLocale.current.languageCode
        
        if (locale == "hu"){
            
            if(age > 19 && age < 30){
                let sizeOfList = defaultAge20RelatedSentences.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge20RelatedSentences[number]
            } else if (age > 29 && age < 45){
                let sizeOfList = defaultAge30RelatedSentences.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge30RelatedSentences[number]
            } else if (age > 44){
                let sizeOfList = defaultAge40RelatedSentences.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge40RelatedSentences[number]
            }
            
        } else {
            
            if(age > 19 && age < 30){
                let sizeOfList = defaultAge20RelatedSentences_en.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge20RelatedSentences_en[number]
            } else if (age > 29 && age < 45){
                let sizeOfList = defaultAge30RelatedSentences_en.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge30RelatedSentences_en[number]
            } else if (age > 44){
                let sizeOfList = defaultAge40RelatedSentences_en.count
                let number = Int.random(in: 0 ..< sizeOfList)
                selectedMessage = defaultAge40RelatedSentences_en[number]
            }
            
        }
        
        return selectedMessage
    }
    
    static func storeDayAboutLastDisplayedAgeRelatedMessageToUserDefaults(){
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        let str = df.string(from: Date())
        UserDefaults.standard.setValue(str, forKey: lastDisplayedAgeRelatedMessageKey)

    }
    
    static func loadDayAboutLastDisplayedAgeRelatedMessageToUserDefaults() -> Date{
        
        if let strOut = UserDefaults.standard.string(forKey: lastDisplayedAgeRelatedMessageKey) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.date(from: strOut)!
            
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: "2015-04-01T11:42:00")!
        }

    }
    
    static func checkIfAgeRelatedMessageDisplayIsNeeded() ->Bool{
        if(loadDayAboutLastDisplayedAgeRelatedMessageToUserDefaults().addingTimeInterval(604800) < Date()){
            return true
        } else {
            return false
        }
    }
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

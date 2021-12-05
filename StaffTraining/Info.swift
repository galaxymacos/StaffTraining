//
//  Info.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import Foundation

struct Info: Codable, Hashable {
    var title: String
    var content: [Info]?
}

extension Info {
    static var sampleTaskForCleaner: [Info] = [
        .init(title: "The steps to clean a room", content: [.init(title: "Step 1: Go in the room; Step 2: Clean it; Step 3: Leave the room")]),
        .init(title: "What's considered a clean room", content: [.init(title: "1. No trash on the ground\n 2. No stain on the bedsheet and towel\n 3. No")])
        ]
    
    static var sampleTaskForFrontDesk: [Info] = [
        .init(title: "When customer by cash", content: [.init(title: "Step 1: Click \"Divers TX\" button on the screen")]),
        .init(title: "When customer come in for gas", content: [.init(title: "Step 1: When you hear the sound of the gas pump, click the pump icon that's popping up. Step 2: When they finish pumping the gas, if they pay outside, on the icon it will show as \"complete\", then don't worry, it is done")]),
        .init(title: "When customer come in for products", content: [.init(title: "Step 1: Scan the product's barcode on the bar code scanner, the price of that product will be on screen; Step 2: After scanning all the products, confirm with them to see if they want to pay by debit/credit or cash, if they want to pay by debit/credit, click the card button on the screen. Step 3: If they have milliplein card, help them swipe it on the machine, and then let them tap on the machine using their card to pay, Step 4: If they don't have a milliplein, just hit next to ignore the notification")]),
        .init(title: "When customer come in for both gas and products", content: [.init(title: "Step 1: When the customer finishes pumping the gas, click the gas station button to add the price to the left side, and then when they come in and select the product they want, scan it to add the price of the product to the original gas price; Step 3: Let the user pay for it")])
    ]
    
    static var exampleDatas: [JobType: [Info]] = [
        .frontDeskManager : sampleTaskForFrontDesk,
        .roomCleaner : sampleTaskForCleaner
    ]
}

// AdventureViewModel.swift
import Foundation

class AdventureViewModel: ObservableObject {
    @Published var currentStep: AdventureStep
    
    init() {
        let endSuccess = AdventureStep(description: "You have successfully completed the adventure!", choices: [])
        let endFail = AdventureStep(description: "Your adventure ended unsuccessfully.", choices: [])
        
        let step3 = AdventureStep(description: "You see a river. Do you want to cross it or follow it?", choices: [
            AdventureStep.Choice(text: "Cross it", destination: endSuccess),
            AdventureStep.Choice(text: "Follow it", destination: endFail)
        ])
        
        let step2 = AdventureStep(description: "You find a cave. Do you want to enter it or go around it?", choices: [
            AdventureStep.Choice(text: "Enter it", destination: endFail),
            AdventureStep.Choice(text: "Go around it", destination: step3)
        ])
        
        let step1 = AdventureStep(description: "You are at a crossroad. Do you want to go left or right?", choices: [
            AdventureStep.Choice(text: "Left", destination: step2),
            AdventureStep.Choice(text: "Right", destination: endFail)
        ])
        
        self.currentStep = step1
    }
    
    func choose(choice: AdventureStep.Choice) {
        if let destination = choice.destination {
            self.currentStep = destination
        }
    }
}

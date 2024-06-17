// AdventureView.swift
import SwiftUI

struct AdventureView: View {
    @ObservedObject var viewModel: AdventureViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.currentStep.description)
                .font(.title)
                .padding()
            
            ForEach(viewModel.currentStep.choices, id: \.text) { choice in
                Button(action: {
                    viewModel.choose(choice: choice)
                }) {
                    Text(choice.text)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(5)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.2))
        .edgesIgnoringSafeArea(.all)
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(viewModel: AdventureViewModel())
    }
}

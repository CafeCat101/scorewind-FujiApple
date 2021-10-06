//
//  WizardView.swift
//  WizardView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct WizardView: View {
	@State private var isCurrentView = true
	@EnvironmentObject var wizardElement: WizardElement
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("wizard start")
					.font(.title)
				Spacer()
				Text("Which instrument do you want to play?")
				Button("Guitar"){
					wizardElement.instrument = "guitar"
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Violin"){
					wizardElement.instrument = "violin"
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Piano"){
					wizardElement.instrument = "piano"
					withAnimation{
						self.isCurrentView = false
					}
				}
				Spacer()
			}
			
		}else{
			CourseTypeView()
				.transition(.scale)
		}
	}
}

struct WizardView_Previews: PreviewProvider {
	static var previews: some View {
		WizardView().environmentObject(WizardElement())
	}
}

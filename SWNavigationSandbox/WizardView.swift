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
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	@State private var toViewName:Page = .wizard
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Menu {
					Button("My courses", action: {
						self.toViewName = .learn
						withAnimation{
							self.isCurrentView = false
						}
					})
				} label: {
					Text("Start Wizard")
						.font(.title)
						.foregroundColor(Color.black)
						
				}
				Spacer()
				Text("Which instrument do you want to play?")
				Button("Guitar"){
					wizardElement.instrument = "guitar"
					self.toViewName = .courseType
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Violin"){
					wizardElement.instrument = "violin"
					self.toViewName = .courseType
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Piano"){
					wizardElement.instrument = "piano"
					self.toViewName = .courseType
					withAnimation{
						self.isCurrentView = false
					}
				}
				Spacer()
			}
			
		}else{
			if toViewName == .courseType {
				CourseTypeView()
					.transition(.scale)
			}else if toViewName == .learn {
				CourseForYouView()
					.transition(.scale)
			}else{
				WelcomeView()
			}
			
		}
	}
}

struct WizardView_Previews: PreviewProvider {
	static var previews: some View {
		WizardView().environmentObject(WizardElement())
	}
}

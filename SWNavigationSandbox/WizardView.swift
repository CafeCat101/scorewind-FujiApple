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
					.font(.headline)
				
				HStack{
					Button(action:{
						wizardElement.instrument = "guitar"
						self.toViewName = .courseType
						withAnimation{
							self.isCurrentView = false
						}
					}){
						Circle()
							.strokeBorder(Color.black,lineWidth: 1)
							.background(Circle().foregroundColor(Color.white))
							.frame(width:100,height:100)
							.overlay(
								Image("instrument-guitar-icon")
									.resizable()
									.scaleEffect(0.6)
							)
					}
					
					Button(action:{
						wizardElement.instrument = "violin"
						self.toViewName = .courseType
						withAnimation{
							self.isCurrentView = false
						}
					}){
						Circle()
							.strokeBorder(Color.black,lineWidth: 1)
							.background(Circle().foregroundColor(Color.white))
							.frame(width:100,height:100)
							.overlay(
								Image("instrument-violin-icon")
									.resizable()
									.scaleEffect(0.6)
							)
					}
				}
				
				
				Button(action:{
					wizardElement.instrument = "piano"
					self.toViewName = .courseType
					withAnimation{
						self.isCurrentView = false
					}
				}){
					Circle()
						.strokeBorder(Color.black,lineWidth: 1)
						.background(Circle().foregroundColor(Color.white))
						.frame(width:100,height:100)
						.overlay(
							Image("instrument-piano-icon")
								.resizable()
								.scaleEffect(0.6)
						)
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

//
//  CourseTypeView.swift
//  CourseTypeView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct CourseTypeView: View {
	@State private var isCurrentView = true
	@State private var toViewName:Page = .wizard
	@EnvironmentObject var wizardElement: WizardElement
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Menu {
					Button("Start wizard", action: {
						self.toViewName = .wizard
						withAnimation{
							self.isCurrentView = false
						}
					})
					Button("My courses", action: {
						self.toViewName = .learn
						withAnimation{
							self.isCurrentView = false
						}
					})
				} label: {
					Text("Choose course type")
						.font(.title2)
						.foregroundColor(Color.black)
						
				}
				Text("[\(wizardElement.instrument)]")
				Spacer()
				Button("Path"){
					wizardElement.courseType = .path
					self.toViewName = .readScoreAbility
					withAnimation{
						self.isCurrentView = false
					}
					
				}
				Button("Setp by Step"){
					wizardElement.courseType = .setByStep
					self.toViewName = .readScoreAbility
					withAnimation{
						self.isCurrentView = false
					}
				}
				Spacer()
			}
		}else{
			if self.toViewName == .wizard{
				WizardView()
					.transition(.scale)
			}else{
				ReadScoreAbilityView()
					.transition(.scale)
			}
			
		}
		
	}
}

struct CourseTypeView_Previews: PreviewProvider {
	static var previews: some View {
		CourseTypeView().environmentObject(WizardElement())
	}
}

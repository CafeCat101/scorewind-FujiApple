//
//  ReadScoreAbilityView.swift
//  ReadScoreAbilityView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct ReadScoreAbilityView: View {
	@State private var isCurrentView = true
	@EnvironmentObject var wizardElement: WizardElement
	@State private var toViewName:Page = .wizard
	
	var body: some View {
		if self.isCurrentView == true{
			VStack{
				/*Text("Is this score difficult to understand?")
					.font(.title2)*/
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
					Text("Is this score difficult to understand?")
						.font(.title2)
						.foregroundColor(Color.black)
						
				}
				Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))]")
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.overlay(Text("Score viewer + player")
										.foregroundColor(Color.white))
				HStack{
					Button("Yes"){
						wizardElement.yesNoType = .readScoreAbilityYes
						toViewName = .yesNoResult
						withAnimation{
							self.isCurrentView = false
						}
						
					}
					Button("No"){
						wizardElement.yesNoType = .readScoreAbilityNo
						toViewName = .yesNoResult
						withAnimation{
							self.isCurrentView = false
						}
						
					}
				}
			}
		}else{
			if toViewName == .wizard {
				WizardView().transition(.scale)
			}else if toViewName == .learn {
				CourseForYouView().transition(.scale)
			}else{
				YesNoResultView()
					.transition(.scale)
			}
		}
	}
	
	/*func getPrettyCourseTypeName(courseType: CourseType)->String {
		if courseType == .path{
			return "Path"
		}else{
			return "Step by step"
		}
	}*/
}

struct ReadScoreAbilityView_Previews: PreviewProvider {
	static var previews: some View {
		ReadScoreAbilityView().environmentObject(WizardElement())
	}
}

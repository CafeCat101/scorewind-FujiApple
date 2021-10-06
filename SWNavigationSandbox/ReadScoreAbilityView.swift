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
	
	var body: some View {
		if self.isCurrentView == true{
			VStack{
				Text("Is this score difficult to understand?")
					.font(.title2)
				Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))]")
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.overlay(Text("Score viewer + player")
										.foregroundColor(Color.white))
				HStack{
					Button("Yes"){
						wizardElement.yesNoType = .readScoreAbilityYes
						withAnimation{
							self.isCurrentView = false
						}
						
					}
					Button("No"){
						wizardElement.yesNoType = .readScoreAbilityNo
						withAnimation{
							self.isCurrentView = false
						}
						
					}
				}
			}
		}else{
			YesNoResultView()
				.transition(.scale)
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

//
//  YesNoResultView.swift
//  YesNoResultView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct OptionObject:Identifiable{
	var id = UUID()
	var optionLabel:String
	var viewName: Page
}

struct YesNoResultView: View {
	@State private var isCurrentView = true
	@State private var toViewName: Page = .courseType
	@State private var options = [OptionObject(optionLabel: "Back to the beginning", viewName: .courseType)]
	@EnvironmentObject var wizardElement: WizardElement
	let screenSize: CGRect = UIScreen.main.bounds
	
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				/*Text("yes no result")
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
					Text("yes no result")
						.font(.title2)
						.foregroundColor(Color.black)
						
				}
				Rectangle()
					.frame(height: screenSize.height/2.5)
					.overlay(Text("Score viewer")
										.foregroundColor(Color.white))
				Spacer()
					.frame(height:10)
				if wizardElement.yesNoType == .readScoreAbilityYes || wizardElement.yesNoType == .songChoiceYes {
					Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))][yes]")
				}else{
					Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))][no]")
				}
				
				Spacer()
					.frame(height:10)
				ScrollView{
					ForEach(options, id: \.self.id) { option in
						Button(option.optionLabel){
							withAnimation{
								self.isCurrentView = false
								self.toViewName = option.viewName
							}
						}
						.padding(.all,20)
						.frame(width: screenSize.width*0.8)
						.overlay(
							RoundedRectangle(cornerRadius: 5)
								.stroke(Color.gray, lineWidth: 2)
						)
					}
					
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				/*Button("Got to course view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .course
					}
				}
				
				Button("Go to lesson view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .lesson
					}
				}
				
				Button("Got to course type"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .courseType
					}
				}
				
				Button("Go to song choice"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .SongChoice
					}
					
				}
				
				Button("Go to read score ability"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .readScoreAbility
					}
				}
				
				Spacer()*/
				.onAppear{
					self.options = generateOptions()
				}
			}
		}else{
			switch self.toViewName{
			case .course:
				CourseView()
					.transition(.scale)
			case .lesson:
				LessonView()
					.transition(.scale)
			case .courseType:
				CourseTypeView()
					.transition(.scale)
			case .songChoice:
				SongChoiceView()
					.transition(.scale)
			case .readScoreAbility:
				ReadScoreAbilityView()
					.transition(.scale)
			case .learn:
				CourseForYouView()
					.transition(.scale)
			case .wizard:
				WizardView()
					.transition(.scale)
			default:
				WizardView()
					.transition(.scale)
			}
		}
	}
	
	func generateOptions()->Array<OptionObject>{
		if wizardElement.courseType == .path {
			if wizardElement.yesNoType == .readScoreAbilityYes {
				return [
					OptionObject(optionLabel: "Show me simpler score", viewName: .readScoreAbility),
					OptionObject(optionLabel: "Show me other song like this", viewName: .songChoice),
					OptionObject(optionLabel: "Back to the beginning", viewName: .courseType)]
			}else if wizardElement.yesNoType == .readScoreAbilityNo {
				return [
					OptionObject(optionLabel: "Jump into the lesson about this song!", viewName: .lesson),
					OptionObject(optionLabel: "I want to learn more about this course.", viewName: .course),
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice)]
			}else if wizardElement.yesNoType == .songChoiceYes {
				return [
					OptionObject(optionLabel: "Jump into the lesson about this song!", viewName: .lesson),
					OptionObject(optionLabel: "I want to learn more about this course.", viewName: .course),
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice)]
			}else if wizardElement.yesNoType == .songChoiceNo {
				return [
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice),
					OptionObject(optionLabel: "I want to learn more about this lesson.", viewName: .lesson),
					OptionObject(optionLabel: "Go back to the beginning", viewName: .courseType)]
			}else{
				return defaultOptions()
			}
		}else if wizardElement.courseType == .setByStep {
			if wizardElement.yesNoType == .readScoreAbilityYes {
				return [
					OptionObject(optionLabel: "Show me simpler score", viewName: .readScoreAbility),
					OptionObject(optionLabel: "Show me other song like this", viewName: .songChoice),
					OptionObject(optionLabel: "Back to the beginning", viewName: .courseType)]
			}else if wizardElement.yesNoType == .readScoreAbilityNo {
				return [
					OptionObject(optionLabel: "Check out this course!", viewName: .course),
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice)]
			}else if wizardElement.yesNoType == .songChoiceYes {
				return [
					OptionObject(optionLabel: "Check out this course!", viewName: .course),
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice)]
			}else if wizardElement.yesNoType == .songChoiceNo{
				return [
					OptionObject(optionLabel: "Show me another song like this.", viewName: .songChoice),
					OptionObject(optionLabel: "What is this course about?", viewName: .course),
					OptionObject(optionLabel: "Go back to the beginning", viewName: .courseType)]
			}else {
				return defaultOptions()
			}
			
		}else{
			return defaultOptions()
		}

	}
	
	func defaultOptions()->Array<OptionObject>{
		return [OptionObject(optionLabel: "Back to the beginning", viewName: .courseType)]
	}
}

struct YesNoResultView_Previews: PreviewProvider {
	static var previews: some View {
		YesNoResultView().environmentObject(WizardElement())
	}
}

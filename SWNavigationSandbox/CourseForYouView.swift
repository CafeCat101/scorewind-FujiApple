//
//  CourseForYouView.swift
//  CourseForYouView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct CourseForYouView: View {
	@State private var isCurrentView = true
	@State private var toViewName:Page = .learn
	
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
				} label: {
					Text("My courses")
						.font(.title)
						.foregroundColor(Color.black)
						
				}
				Spacer()
				Group{
					Text("Resume")
						.font(.headline)
					Button("To course view"){
						self.toViewName = .course
						withAnimation{
							self.isCurrentView = false
						}
					}.padding(.all,20)
						.frame(width: 300.0)
						.overlay(
							RoundedRectangle(cornerRadius: 5)
								.stroke(Color.gray, lineWidth: 2)
						)
					
					Button("To lesson view"){
						self.toViewName = .lesson
						withAnimation{
							self.isCurrentView = false
						}
					}.padding(.all,20)
						.frame(width: 300.0)
						.overlay(
							RoundedRectangle(cornerRadius: 5)
								.stroke(Color.gray, lineWidth: 2)
						)
				}
				Spacer()
				Group{
					Text("Skill to explore")
						.font(.headline)
					
					Button("Course 1"){
						self.toViewName = .course
						withAnimation{
							self.isCurrentView = false
						}
					}.padding(.all,20)
						.frame(width: 300.0)
						.overlay(
							RoundedRectangle(cornerRadius: 5)
								.stroke(Color.gray, lineWidth: 2)
						)
					
					Button("Course 2"){
						self.toViewName = .course
						withAnimation{
							self.isCurrentView = false
						}
					}.padding(.all,20)
						.frame(width: 300.0)
						.overlay(
							RoundedRectangle(cornerRadius: 5)
								.stroke(Color.gray, lineWidth: 2)
						)
				}
				
				
				Spacer()
			}
		}else{
			switch self.toViewName{
			case .course:
				CourseView()
					.transition(.scale)
			case .lesson:
				LessonView()
					.transition(.scale)
			default:
				WizardView()
					.transition(.scale)
			}
		}
		
	}
}

struct CourseForYouView_Previews: PreviewProvider {
	static var previews: some View {
		CourseForYouView()
	}
}

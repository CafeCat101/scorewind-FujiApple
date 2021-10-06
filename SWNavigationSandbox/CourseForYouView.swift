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
				Button("To course view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .course
					}
				}
				
				Button("To lesson view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = .lesson
					}
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

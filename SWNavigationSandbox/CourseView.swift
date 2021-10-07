//
//  CourseView.swift
//  CourseView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct CourseView: View {
	@State private var isCurrentView = true
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	@State private var toViewName:Page = .course
	let screenSize: CGRect = UIScreen.main.bounds
	@State private var courseName:String = "Dotted Rhythm of the Classical Era for Guitar – Part 1"
	
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
					Button("Previous course", action: {
						withAnimation{
							self.courseName = "Course 1"
						}
					})
					Group{
						Button("Lesson 1", action: {
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						})
						Button("Lesson 2", action: {
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						})
						Button("Lesson 3", action: {
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						})
						Button("Lesson 4", action: {
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						})
						Button("Lesson 5", action: {
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						})
					}
					Button("Start wizard", action: {
						self.toViewName = .wizard
						withAnimation{
							self.isCurrentView = false
						}
					})
				} label: {
					Text(self.courseName)
						.font(.title2)
						.foregroundColor(Color.black)
				}
				
				Rectangle()
					.frame(height: screenSize.height/2.5)
					.overlay(Text("Introduction video")
										.foregroundColor(Color.white))
				Text("Introduction")
					.fontWeight(.bold)
				Text("The part 1 of this course will progressively lead you to perfect the art of dotted rhythm through mid-beginner to intermediate levels pieces of the Classical-Romantic era of the classical guitar.  With each one of the following ten etudes you will be practicing dotted rhythm in various musical contexts, which come with their unique challenges. Sometimes you will find a piece where you will be playing a dotted rhythm ....")
					.padding(15)
					
				
				Spacer()
			}.gesture(
				DragGesture()
					.onChanged { gesture in
						if self.isSwipping {
							self.startPos = gesture.location
							self.isSwipping.toggle()
						}
					}
					.onEnded { gesture in
						let xDist =  abs(gesture.location.x - self.startPos.x)
						let yDist =  abs(gesture.location.y - self.startPos.y)
						if self.startPos.y <  gesture.location.y && yDist > xDist {
							//down
						}
						else if self.startPos.y >  gesture.location.y && yDist > xDist {
							//up
							//to next lesson
							self.toViewName = .lesson
							withAnimation{
								self.isCurrentView = false
							}
						}
						else if self.startPos.x > gesture.location.x && yDist < xDist {
							//left
						}
						else if self.startPos.x < gesture.location.x && yDist < xDist {
							//right
						}
						self.isSwipping.toggle()
					}
			)
		}else{
			switch self.toViewName{
			case .wizard:
				WizardView()
					.transition(.scale)
			case .lesson:
				if self.isSwipping == true {
					LessonView()
						.transition(AnyTransition.move(edge: .top))
				}else{
					LessonView()
						.transition(.scale)
				}
			case .learn:
				CourseForYouView()
					.transition(.scale)
			default:
				CourseView()
					.transition(.scale)
			}
		}
		
	}
}

struct CourseView_Previews: PreviewProvider {
	static var previews: some View {
		CourseView()
	}
}

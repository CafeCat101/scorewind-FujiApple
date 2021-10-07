//
//  LessonView.swift
//  LessonView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct LessonView: View {
	@State private var isCurrentView = true
	@State private var lessonName = "24 Etudes, Op. 35 – Etude No. 3 Larghetto"
	@State private var toViewName:Page = .lesson
	let screenSize: CGRect = UIScreen.main.bounds
	@State private var isLessonFrontPage = true
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	
	var body: some View {
		if self.isCurrentView == true{
			VStack{
				Menu {
					Button("Previous course", action: {
						self.toViewName = .course
						withAnimation{
							self.isCurrentView = false
						}
					})
					Button("Le Papillon, Op. 50 – No. 21, Andantino", action: {
						withAnimation{
							self.lessonName = "Le Papillon, Op. 50 – No. 21, Andantino"
						}
					})
					Button("Le Papillon, Op. 50 – No. 31, Alegretto", action: {
						withAnimation{
							self.lessonName = "Le Papillon, Op. 50 – No. 31, Alegretto"
						}
					})
					Button("24 Short Progressive Pieces, Op. 44 – Etude No. 18, Marcha", action: {
						withAnimation{
							self.lessonName = "24 Short Progressive Pieces, Op. 44 – Etude No. 18, Marcha"
						}
					})
					Button("Next course", action: {
						self.toViewName = .course
						withAnimation{
							self.isCurrentView = false
						}
					})
					Menu{
						Button("My courses", action: {
							self.toViewName = .learn
							withAnimation{
								self.isCurrentView = false
							}
						})
						Button("Start wizard", action: {
							self.toViewName = .wizard
							withAnimation{
								self.isCurrentView = false
							}
						})
					} label: {
						Text("Jump to")
							.font(.title2)
							.foregroundColor(Color.black)
					}
				} label: {
					Text(self.lessonName)
						.font(.title2)
						.foregroundColor(Color.black)
				}
				if self.isLessonFrontPage == true {
					Rectangle()
						.frame(height: screenSize.height/2.5)
						.overlay(Text("Lesson video")
											.foregroundColor(Color.white))
					Text("24 Etudes, Op. 35 – Etude No. 3 Larghetto")
						.fontWeight(.bold)
					Text("In this first etude you will be mostly playing close position thirds and sixths in first position, but search for the position changes by the end of the etude and be careful with the legato. Of accessible difficulty, this piece is ideal to start exploring dotted rhythm playing. If you want to explore more about dotted rhythm check out our method specially made to practice dotted figures.")
						.padding(15)
					Spacer()
				}else{
					Rectangle()
						.frame(maxWidth: .infinity, maxHeight: .infinity)
						.overlay(Text("Score viewer + player")
											.foregroundColor(Color.white))
				}
				
			}
			.frame(maxWidth:.infinity)
			.gesture(
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
						}
						else if self.startPos.x > gesture.location.x && yDist < xDist {
							//left
							withAnimation{
								self.isLessonFrontPage = false
							}
						}
						else if self.startPos.x < gesture.location.x && yDist < xDist {
							//right
							withAnimation{
								self.isLessonFrontPage = true
							}
						}
						self.isSwipping.toggle()
					}
			)
			//.transition(.scale)
			
		}else{
			switch self.toViewName{
			case .course:
				CourseView().transition(.scale)
					//.transition(AnyTransition.move(edge: .bottom))
			case .wizard:
				WizardView().transition(.scale)
			case .learn:
				CourseForYouView().transition(.scale)
			default:
				LessonView()
			}
			
		}
			
	}
}

struct LessonView_Previews: PreviewProvider {
	static var previews: some View {
		LessonView()
	}
}

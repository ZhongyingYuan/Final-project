//
//  CalendarView.swift
//  TODOLIST
//
//  Created by grace cen on 12/5/2025.
//

import SwiftUI

struct CalendarView: View {
    //set variable for colour
    @State private var color: Color = .blue
    //set variable for date and initialise it
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    //variable for columns and to set the days
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    //variable for days and put into an array
    @State private var days: [Date] = []

    // Pass tasks to CalendarView
    var tasks: [Task]

    var body: some View {
        VStack { //colourpicker to pick out a colour for your calendar
            LabeledContent("Calendar Color") {
                ColorPicker("", selection: $color, supportsOpacity: false)
                }
            HStack { //button for the previous month
                Button(action: previousMonth) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(color)
                        .font(.title2)
                }
                Spacer()
                
                Text(date.formatted(.dateTime.month().year()))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
                
                Spacer()
                //button for the next month
                Button(action: nextMonth) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(color)
                        .font(.title2)
                }
            }
            .padding(.horizontal)

            HStack { //show days of the week
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .fontWeight(.black)
                        .foregroundStyle(color)
                        .frame(maxWidth: .infinity)
                }
            }
            //A grid to showcase the month with days
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(days, id: \.self) { day in
                    if day.monthInt != date.monthInt {
                        Text("")
                            .frame(maxWidth: .infinity, minHeight: 40)
                    } else {
                        VStack { //the layout of the grid to show the days
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    Rectangle()
                                        .foregroundStyle(
                                            Date.now.startOfDay == day.startOfDay
                                                ? .red.opacity(0.3)
                                                : color.opacity(0.3)
                                        )
                                )
                            // Add a red dot for days with tasks
                            if hasTask(on: day) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 5, height: 5)
                                    .offset(y: -10)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) { _ in
            days = date.calendarDisplayDays
        }
    }

    // Function to navigate to previous month
    private func previousMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: date) {
            date = newDate
        }
    }

    // Function to navigate to next month
    private func nextMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: date) {
            date = newDate
        }
    }

    // Check if a task exists for a specific day
    private func hasTask(on day: Date) -> Bool {
        tasks.contains { $0.dateAdded.startOfDay == day.startOfDay }
    }
}



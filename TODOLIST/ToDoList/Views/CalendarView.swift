//
//  CalendarView.swift
//  ToDoList
//
//  Created by grace cen on 8/5/2025.
//
import SwiftUI

struct CalendarView: View {
    @State private var color: Color = .blue

    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    @State private var days: [Date] = []
    
    var body: some View {
        VStack {
            LabeledContent("Calendar Color") {
                ColorPicker("", selection: $color, supportsOpacity: false)
            }
            LabeledContent("Time") {
                DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                }
            HStack {
                Button(action: previousMonth) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(color)
                        .font(.title2)
                    }
                    Spacer()
                            
                    // Display current month and year
                    Text(date.formatted(.dateTime.month().year()))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(color)
                            
                    Spacer()
                            
                    Button(action: nextMonth) {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(color)
                            .font(.title2)
                            }
                        }
                        .padding(.horizontal)
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                Text(daysOfWeek[index])
                        .fontWeight(.black)
                        .foregroundStyle(color)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(days, id: \.self) { day in
                    if day.monthInt != date.monthInt {
                        Text("")
                        .frame(maxWidth: .infinity, minHeight: 40)
                    } else {
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
                               }
                           }
                       }
        }
        .padding()
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) {
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
}

#Preview {
    CalendarView()
}

//
//  CalendarView.swift
//  Calendar example
//
//  Created by grace cen on 2/5/2025.
//

import SwiftUI

//struct CalendarView: View {
//    @Binding var selectedDate: Date
//    @Binding var color: Color
//    
////    @State private var color: Color = .blue
////    @State private var date = Date.now
//    @State private var previewDate = Date.now
//    
//    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
//    let columns = Array(repeating: GridItem(.flexible()), count: 7)
//    @State private var days: [Date] = []
//    @State private var displayMonth: Date
//    
//    init(selectedDate: Binding<Date>, color: Binding<Color>) {
//            self._selectedDate = selectedDate
//            self._color = color
//            self._displayMonth = State(initialValue: selectedDate.wrappedValue)
//        }
//    
//    var body: some View {
//        VStack {
//            LabeledContent("Date/Time") {
//                            DatePicker("", selection: $selectedDate)
//                        }
//                        HStack {
//                            ForEach(daysOfWeek.indices, id: \.self) { index in
//                            Text(daysOfWeek[index])
//                                    .fontWeight(.black)
//                                    .foregroundStyle(color)
//                                    .frame(maxWidth: .infinity)
//                            }
//                        }
//                        LazyVGrid(columns: columns) {
//                            ForEach(days, id: \.self) { day in
//                                if day.monthInt != selectedDate.monthInt {
//                                    Text("")
//                                } else {
//                                    Text(day.formatted(.dateTime.day()))
//                                        .fontWeight(.bold)
//                                        .foregroundStyle(.secondary)
//                                        .frame(maxWidth: .infinity, minHeight: 40)
//                                        .background(
//                                            Circle()
//                                                .foregroundStyle(
//                                                    Date.now.startOfDay == day.startOfDay
//                                                    ? .red.opacity(0.3)
//                                                    :  color.opacity(0.3)
//                                                )
//                                        )
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                    .onAppear {
//                        days = selectedDate.calendarDisplayDays
//                    }
//                    .onChange(of: selectedDate) {
//                        days = selectedDate.calendarDisplayDays
//                    }
//                }
//    
//}
//
////#Preview {
////     // Create a State variable for preview
////
////    CalendarView(selectedDate: <#Binding<Date>#>, color: <#Binding<Color>#>)
////}
//
//#Preview {
//    struct PreviewWrapper: View {
//        @State private var selectedDate = Date()
//        @State private var color: Color = .blue
//        
//        var body: some View {
//            CalendarView(selectedDate: $selectedDate, color: $color)
//        }
//    }
//    
//    return PreviewWrapper()
//}
struct CalendarView: View {
    @Binding var selectedDate: Date
    @State private var color: Color = .blue
    @State private var days: [Date] = []
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            LabeledContent("Calendar Color") {
                ColorPicker("", selection: $color, supportsOpacity: false)
                        }
            LabeledContent("Date/Time") {
                DatePicker("", selection: $date)
                        }
            // Days of the Week
//            HStack {
//                ForEach(daysOfWeek.indices, id: \.self) { index in
//                    Text(daysOfWeek[index])
//                        .fontWeight(.black)
//                        .foregroundStyle(color)
//                        .frame(maxWidth: .infinity)
//                }
//            }
            
             //Calendar Grid
//            LazyVGrid(columns: columns) {
//                ForEach(days, id: \.self) { day in
//                    if day.monthInt != selectedDate.monthInt {
//                        Text("")
//                    } else {
//                        Text(day.formatted(.dateTime.day()))
//                            .fontWeight(.bold)
//                            .foregroundStyle(day == selectedDate.startOfDay ? .primary : .secondary)
//                            .frame(maxWidth: .infinity, minHeight: 40)
//                            .background(
//                                Circle()
//                                    .foregroundStyle(
////                                        day == selectedDate.startOfDay
////                                        ? color.opacity(0.5)
////                                        : .clear
//                                        Date.now.startOfDay == day.startOfDay
//                                        ? .red.opacity(0.3)
//                                        :  color.opacity(0.3)
//                                    )
//                            )
//                            .onTapGesture {
//                                selectedDate = day
//                            }
//                    }
                }
            }
        }
//        .padding()
//        .onAppear {
//            days = selectedDate.calendarDisplayDays
//        }
//        .onChange(of: selectedDate) { _ in
//            days = selectedDate.calendarDisplayDays
//        }
//    }
//}


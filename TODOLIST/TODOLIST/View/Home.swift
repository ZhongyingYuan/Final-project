//
//  Home.swift
//  TODOLIST
//
//  Created by 袁钟盈 on 2025/5/12.
//

import SwiftUI

struct Home: View {
    
    @State private var currentDay: Date = .init()
    @State private var tasks: [Task] = sampleTasks
    @State private var addNewTask: Bool = false
    @State private var taskToDelete: Task? = nil
    @State private var showDeleteConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TimelineView()
                    .padding(15)
            }
            .safeAreaInset(edge: .top,spacing: 0) {
                HeaderView()
            }
            .fullScreenCover(isPresented: $addNewTask) {
                AddTaskView { task in
                    tasks.append(task)
                }
            
            }
            .alert("Delete Task", isPresented: $showDeleteConfirmation, actions: {
                Button("Cancel", role: .cancel) {}
                Button("Delete", role: .destructive) {
                    if let taskToDelete = taskToDelete, let index = tasks.firstIndex(where: { $0.id == taskToDelete.id }) {
                        withAnimation {
                            tasks.remove(at: index)
                        }
                    }
                }
            }, message: {
                Text("Are you sure you want to delete this task?")
            })
        }
    }
   
    @ViewBuilder
    func TimelineView() -> some View {
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            VStack {
                ForEach(hours, id: \.self) { hour in
                    TimelineViewRow(hour)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
    }
    
    @ViewBuilder
    func TimelineViewRow(_ date: Date) -> some View {
        HStack(alignment: .top) {
            Text(date.toString("h a"))
                .ubuntu(14, .regular)
                .frame(width: 45, alignment: .leading)
            
            let calendar = Calendar.current
            let filteredTasks = tasks.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let taskHour = calendar.dateComponents([.hour], from: $0.dateAdded).hour,
                   hour == taskHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay) {
                    return true
                }
                return false
            }
            
            if filteredTasks.isEmpty {
                Rectangle()
                    .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            } else {
                VStack(spacing: 10) {
                    ForEach(filteredTasks) { task in
                        TaskRowWithDelete(task)
                    }
                }
            }
        }
        .hAlign(.leading)
        .padding(.vertical, 15)
    }
    
    // Task row with delete button
    @ViewBuilder
    func TaskRowWithDelete(_ task: Task) -> some View {
        ZStack(alignment: .topTrailing) {
            // Task content
            TaskRow(task)
            
            // Delete button
            Button {
                // Set the task to delete and show confirmation
                taskToDelete = task
                showDeleteConfirmation = true
            } label: {
                Image(systemName: "trash.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Circle().fill(Color.white))
                    .shadow(radius: 2)
            }
            .offset(x: 5, y: -5)
        }
    }

    @ViewBuilder
    func TaskRow(_ task: Task) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(task.taskName.uppercased())
                .ubuntu(16, .regular)
                .foregroundColor(task.taskCategory.color)
                .lineLimit(1)
            
            if task.taskDescription != "" {
                Text(task.taskDescription)
                    .ubuntu(14, .light)
                    .foregroundColor(task.taskCategory.color.opacity(0.8))
                    .lineLimit(6)
            }
        }
        .hAlign(.leading)
        .padding(12)
        .background {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(task.taskCategory.color)
                    .frame(width: 4)
                
                Rectangle()
                    .fill(task.taskCategory.color.opacity(0.25))
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Today")
                        .ubuntu(30, .light)
                    
                    Text("Welcome, start your schedule!")
                        .ubuntu(14, .light)
                }
                .hAlign(.leading)
                
                Button {
                    addNewTask.toggle()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                        Text("Add Task")
                            .ubuntu(15, .regular)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        Capsule()
                            .fill(Color("Blue").gradient)
                    }
                    .foregroundColor(.white)
                }
                
                NavigationLink(destination: CalendarView(tasks: tasks)) {
                    Text("Calendar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            
            Text(Date().toString("MMM YYYY"))
                .ubuntu(16, .medium)
                .hAlign(.leading)
                .padding(.top, 15)
            
            WeekRow()
        }
        .padding(15)
        .background {
            VStack(spacing: 0) {
                Color.white
                
                Rectangle()
                    .fill(.linearGradient(colors: [
                        .white,
                        .clear
                    ], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func WeekRow() -> some View {
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek) { weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .ubuntu(12, .medium)
                    Text(weekDay.date.toString("dd"))
                        .ubuntu(16, status ? .medium : .regular)
                }
                .overlay(alignment: .bottom, content: {
                    if weekDay.isToday {
                        Circle()
                            .frame(width: 6, height: 6)
                            .offset(y: 12)
                    }
                })
                .foregroundColor(status ? Color("Blue") : .gray)
                .hAlign(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


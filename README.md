names, student  IDs:
- Zhongying Yuan - 
- Grace Cen - 25345859
- Margarita Dowd - 24829095

  
- why we deserve marks:
Code on Github (15 marks)

◦ ﻿﻿Data modeling: Do the data structures reflect the problem domain? (2 mark) 

our Task model accurately captures all relevant attributes of a task in the to-do app. such as taskName, taskDescription, taskDate, and taskCategory. These directly reflect how users interact with and organize tasks in the real world. By  separating concerns using data structures like Task and Category, we've made the code both intuitive and aligned with the actual problem domain of a task manager.


◦ ﻿﻿Immutable data and idempotent methods: Is the type system used to prevent incorrect code from being written? (2 mark)

We used Swift’s strong type system to prevent incorrect code being written. For example, taskDate is explicitly typed as Date, and taskCategory uses an enum to limit it to predefined options. This reduces the risk of bugs or invalid values being assigned.


◦ ﻿﻿Functional separation: Is the problem broken down into meaning parts? (3 mark)

We broke down our app into clear, modular components. For instance, task creation is handled in AddTaskView, calendar display in CalendarView, and task visualization in Home. We also created helper functions like TimelineView() and TaskRowWithDelete() to keep logic isolated and readable. This separation of concerns makes the code more maintainable and demonstrates thoughtful functional decomposition.


◦ ﻿﻿Loose coupling: Can parts be changed in isolation of each other? (2 mark)

Yes, our architecture allows different components to evolve independently. For example, we can modify CalendarView's appearance or behavior without affecting how tasks are added in AddTaskView. The onAdd closure pattern in AddTaskView further reinforces this, as it decouples the view from its parent logic.


◦ ﻿﻿Extensibility: How easy would it be to add, remove, or change functionality?

Could a new mechanic or new content be added by changing data instead of changing code? (2 mark)
Within the code, the use of adding categories and adjusting the tasks is simple and does not change the code at all. For example, adding new task categories can be done simply by updating the Category enum without needing to rewrite any logic elsewhere.


◦ ﻿﻿Error handling: Are errors detected at appropriate places? Is the user prevented from entering invalid input and guided toward valid input? (2 mark)

Warning messages are displayed in order to prevent the user from entering invalid inputs and errors and guides them in putting valid inputs. 
The Button logic validates whether the task names and task Description are empty before allowing task creation. The user is prevented from continuing if inputs are invalid, there will be a warning that displays an error message to guide users. The delete button will show a warning to confirm if user really wants to delete. This will prevent the user from making an incorrect decision. 

◦ ﻿﻿Demonstration of collaborative work on Github. (2 mark)

Each member has contributed to their part of the project.

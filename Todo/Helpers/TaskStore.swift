//
//  TaskStore.swift
//  Todo
//
//  Created by Dorota Łata on 23/03/2020.
//  Copyright © 2020 Dorota Łata. All rights reserved.
//

import Foundation

class TaskStore {

    var tasks = [[Task](), [Task]()]

    func add(_ task: Task, at index: Int, isDone: Bool = false) {

        let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
    }

    @discardableResult func remove(at index: Int, isDone: Bool = false) -> Task {
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}

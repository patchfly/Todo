//
//  TasksUtility.swift
//  Todo
//
//  Created by Dorota Łata on 23/03/2020.
//  Copyright © 2020 Dorota Łata. All rights reserved.
//

import Foundation

class TasksUtility {

    private static let key = "tasks"

    private static func archive(_ tasks: [[Task]]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
    }

    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedData) as? [[Task]] ?? [[]]
    }

    static func save(_ tasks: [[Task]]) {
        let archivedTasks = archive(tasks)
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

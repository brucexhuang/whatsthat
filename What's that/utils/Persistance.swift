//
//  Persistance.swift
//  What's that
//
//  Created by brucexhuang on 12/11/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation

class Persistance{
    static let sharedInstance = Persistance()
    
    
//    let workoutsKey = "workouts"
//
//
//    func fetchWorkouts() -> [Workout] {
//        let userDefaults = UserDefaults.standard
//
//        let data = userDefaults.object(forKey: workoutsKey) as? Data
//
//        if let data = data {
//            //data is not nil, so use it
//            return NSKeyedUnarchiver.unarchiveObject(with: data) as? [Workout] ?? [Workout]()
//        }
//        else {
//            //data is nil
//            return [Workout]()
//        }
//    }
//
//    func saveWorkout(_ workout: Workout) {
//        let userDefaults = UserDefaults.standard
//
//        var workouts = fetchWorkouts()
//        workouts.append(workout)
//
//        let data = NSKeyedArchiver.archivedData(withRootObject: workouts)
//
//        userDefaults.set(data, forKey: workoutsKey)
//    }
    
}

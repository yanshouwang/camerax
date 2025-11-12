//
//  TimeUnit.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

import Foundation

public class TimeUnit: NSObject, TimeUnitProtocol {
    public static let days = Days()
    public static let hours = Hours()
    public static let minutes = Minutes()
    public static let seconds = Seconds()
    public static let milliseconds = Milliseconds()
    public static let microseconds = Microseconds()
    public static let nanoseconds = Nanoseconds()
    
    static let c0: Int64 = 1
    static let c1: Int64 = c0 * 1000
    static let c2: Int64 = c1 * 1000
    static let c3: Int64 = c2 * 1000
    static let c4: Int64 = c3 * 60
    static let c5: Int64 = c4 * 60
    static let c6: Int64 = c5 * 24
    
    private static func x(_ d: Int64, _ m: Int64, _ over: Int64) -> Int64 {
        if d > +over {
            return Int64.max
        }
        if d < -over {
            return Int64.min
        }
        return d * m
    }
    
    public func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
        fatalError()
    }
    
    public func toNanos(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toMicros(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toMillis(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toSeconds(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toMinutes(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toHours(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func toDays(_ duration: Int64) -> Int64 {
        fatalError()
    }
    
    public func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
        fatalError()
    }
    
    public class Nanoseconds: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toNanos(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c1 / TimeUnit.c0)
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c2 / TimeUnit.c0)
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c3 / TimeUnit.c0)
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c4 / TimeUnit.c0)
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c5 / TimeUnit.c0)
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c0)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return d - m * TimeUnit.c2
        }
    }
    
    public class Microseconds: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toMicros(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c1 / TimeUnit.c0, Int64.max / (TimeUnit.c1 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c2 / TimeUnit.c1)
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c3 / TimeUnit.c1)
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c4 / TimeUnit.c1)
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c5 / TimeUnit.c1)
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c1)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return d * TimeUnit.c1 - m * TimeUnit.c2
        }
    }
    
    public class Milliseconds: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toMillis(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c2 / TimeUnit.c0, Int64.max / (TimeUnit.c2 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c2 / TimeUnit.c1, Int64.max / (TimeUnit.c2 / TimeUnit.c1))
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c3 / TimeUnit.c2)
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c4 / TimeUnit.c2)
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c5 / TimeUnit.c2)
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c2)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return 0
        }
    }
    
    public class Seconds: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toSeconds(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c3 / TimeUnit.c0, Int64.max / (TimeUnit.c3 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c3 / TimeUnit.c1, Int64.max / (TimeUnit.c3 / TimeUnit.c1))
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c3 / TimeUnit.c2, Int64.max / (TimeUnit.c3 / TimeUnit.c2))
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c4 / TimeUnit.c3)
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c5 / TimeUnit.c3)
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c3)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return 0
        }
    }
    
    public class Minutes: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toMinutes(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c4 / TimeUnit.c0, Int64.max / (TimeUnit.c4 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c4 / TimeUnit.c1, Int64.max / (TimeUnit.c4 / TimeUnit.c1))
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c4 / TimeUnit.c2, Int64.max / (TimeUnit.c4 / TimeUnit.c2))
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c4 / TimeUnit.c3, Int64.max / (TimeUnit.c4 / TimeUnit.c3))
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c5 / TimeUnit.c4)
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c4)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return 0
        }
    }
    
    public class Hours: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toHours(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c5 / TimeUnit.c0, Int64.max / (TimeUnit.c5 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c5 / TimeUnit.c1, Int64.max / (TimeUnit.c5 / TimeUnit.c1))
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c5 / TimeUnit.c2, Int64.max / (TimeUnit.c5 / TimeUnit.c2))
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c5 / TimeUnit.c3, Int64.max / (TimeUnit.c5 / TimeUnit.c3))
        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c5 / TimeUnit.c4, Int64.max / (TimeUnit.c5 / TimeUnit.c4))
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration / (TimeUnit.c6 / TimeUnit.c5)
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return 0
        }
    }
    
    public class Days: TimeUnit {
        public override func convert(_ sourceDuration: Int64, _ sourceUnit: any TimeUnit & TimeUnitProtocol) -> Int64 {
            return sourceUnit.toDays(sourceDuration)
        }
        
        public override func toNanos(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c0, Int64.max / (TimeUnit.c6 / TimeUnit.c0))
        }
        
        public override func toMicros(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c1, Int64.max / (TimeUnit.c6 / TimeUnit.c1))
        }
        
        public override func toMillis(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c2, Int64.max / (TimeUnit.c6 / TimeUnit.c2))
        }
        
        public override func toSeconds(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c3, Int64.max / (TimeUnit.c6 / TimeUnit.c3))        }
        
        public override func toMinutes(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c4, Int64.max / (TimeUnit.c6 / TimeUnit.c4))
        }
        
        public override func toHours(_ duration: Int64) -> Int64 {
            return TimeUnit.x(duration, TimeUnit.c6 / TimeUnit.c5, Int64.max / (TimeUnit.c6 / TimeUnit.c5))
        }
        
        public override func toDays(_ duration: Int64) -> Int64 {
            return duration
        }
        
        public override func excessNanos(_ d: Int64, _ m: Int64) -> Int64 {
            return 0
        }
    }
}

public protocol TimeUnitProtocol: NSObjectProtocol {
    func convert(_ sourceDuration: Int64, _ sourceUnit: TimeUnit & TimeUnitProtocol) -> Int64
    func toNanos(_ duration: Int64) -> Int64
    func toMicros(_ duration: Int64) -> Int64
    func toMillis(_ duration: Int64) -> Int64
    func toSeconds(_ duration: Int64) -> Int64
    func toMinutes(_ duration: Int64) -> Int64
    func toHours(_ duration: Int64) -> Int64
    func toDays(_ duration: Int64) -> Int64
    func excessNanos(_ d: Int64, _ m: Int64) -> Int64
}

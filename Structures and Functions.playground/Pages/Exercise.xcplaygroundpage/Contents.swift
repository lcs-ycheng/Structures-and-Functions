/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a **Line** structure.
 
 Recall that the shortest distance from a point to a line is the perpendicular distance.

*/

// Begin here... once you teach the computer to do this, you will never need to do it by hand again! :)
//create a new point and a line
struct Point{
var start = Point()
var end = Line(fromX4, fromY: 5, toX: 9, toY: 10 )
}
//Query the point here to find the x and y values separatly.
start.x
start.y
end.x
end.y

func distance(from: Point, to: Line) -> Double{
    return sqrt(pow(start.x - end.x, 2)+pow(start.y - end.y, 2))
}
distance(from: start, to: end)

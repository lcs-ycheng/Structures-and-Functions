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
//the line function is y = -1/2x+7
//the orginial points are (2,6)and (6,4), the new point is (1,3)
//struct the point
struct Point{
    var x : Double = 0.0
    var y : Double = 0.0
}
//create new points
var cabinSite = Point(x: 85, y: 90)

//define the slope
struct Slope {
    var rise : Double = 1.0
    var run : Double = 1.0
}

//struct the line
struct Line {
    var slope : Slope = Slope(rise: 1.0, run: 1.0)
    var yIntersept : Double = 0.0
}

//draw the line
var slopeOfGivenLine = Slope(rise: -1, run: 2)
var givenline = Line(slope: slopeOfGivenLine, yIntersept : 9.5)

/// Returns the slope of a perpendicular line
///
/// - Parameter givenLine: the line that we are starting from
/// - Returns: the slope of the perpendicular line
func slopeOfPerpendicularLine(from givenLine: Line) -> Slope{
    return Slope(rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
}
//get the perpendicular slope
let perpendiuclarSlope  = slopeOfPerpendicularLine(from: givenline)

//get the perpendicular yIntersept
func yInterseptOfLine(from slope: Slope, and point : Point) -> Double {
    return point.y - slope.rise / slope.run * point.x
}
let verticalIntersept = yInterseptOfLine(from: perpendiuclarSlope, and: cabinSite)

//draw the line
var perpendicularLine = Line(slope: slopeOfPerpendicularLine(from: givenline), yIntersept: yInterseptOfLine(from: perpendiuclarSlope, and: cabinSite))

//get the meeting point of two line
func theMeetingPointX(from line1: Line, and line2: Line) -> Double
{
    return (line1.yIntersept - line2.yIntersept)/(line1.slope.rise / line1.slope.run - line2.slope.rise/line2.slope.run) * (-1)
}
var xInterceptValue = theMeetingPointX(from: givenline, and: perpendicularLine)


//get the meeting point y
func theMeetingPointY(from line1 : Line, and xValue: Double) -> Double
{
    return xValue * (line1.slope.rise/line1.slope.run) + line1.yIntersept
}
var yInterceptValue = theMeetingPointY(from: givenline, and: xInterceptValue)

// Create the intercept point
var pointOfIntercept = Point(x: xInterceptValue, y: yInterceptValue)

//create the distance
func distance(from: Point, to: Point) -> Double{
    return sqrt(pow((cabinSite.x - xInterceptValue), 2) + pow((cabinSite.y - yInterceptValue), 2))
}
var distanceOfthePerpendicularLine = distance(from: cabinSite, to: pointOfIntercept)

//get the finial distance
func finaldistance(from: Double) -> Double {
    return distanceOfthePerpendicularLine * 0.5
}
var final = finaldistance(from: distanceOfthePerpendicularLine)

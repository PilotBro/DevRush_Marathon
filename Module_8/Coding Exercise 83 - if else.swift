//Don't change this
var aYear =  Int(readLine()!)! 

func isLeap(year: Int) {
    var leap = "\(year) is not a leap year"
    
    if year % 4 == 0 {
        leap = "\(year) is a leap year"
    }
    if year % 100 == 0 {
        leap = "\(year) is not a leap year"
    }
    if year % 400 == 0{
        leap = "\(year) is a leap year"
    }
    
    print(leap)
}

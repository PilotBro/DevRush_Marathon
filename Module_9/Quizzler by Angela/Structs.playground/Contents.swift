struct  Airport {
    var name: String
    var airlines: [String]
    var facilities: [String: Int]
    var runwaysInUse: Int
    var gatesInUse: Int
    
    mutating func stormWarning() {
        print("Take-off and landing are prohibited!")
        runwaysInUse = 0
        gatesInUse = 0
    }
    
    func getRunwaysInUse() -> Int {
        return runwaysInUse
    }
    
    func getGatesInUse() -> Int {
        return gatesInUse
    }
}

var airlines = ["RED WINGS", "IRAERO", "GAZPROMAVIA", "YAMAL", "BUTA AIRWAYS", "S7 AIRLINES", "RUSSIA", "AZAL", "AEROFLOT"]
var sochiFacilities = ["terminal": 2, "gates": 23, "runway": 2, "tower": 1]

var sochiAirport = Airport(name: "Sochi", airlines: airlines, facilities: sochiFacilities, runwaysInUse: 2, gatesInUse: 23)

print(sochiAirport.airlines)
print("\(sochiAirport.name) has \(sochiAirport.facilities["gates"]! ) gates.")

sochiAirport.airlines.append("Delta")
print(sochiAirport.airlines)

sochiAirport.stormWarning()
sochiAirport.getGatesInUse()
sochiAirport.getRunwaysInUse()

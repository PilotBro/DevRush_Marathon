//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
    var score = 0
      
      let arrayNames = scores.keys
      
      for name in arrayNames {
          if scores[name] ?? 0 > score {
              score = scores[name] ?? 0
          }
      }
}

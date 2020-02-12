import Foundation

var semaphore = DispatchSemaphore (value: 0)

var request = URLRequest(url: URL(string: "https://api.growflux.com/v1/aps")!,timeoutInterval: Double.infinity)
request.addValue("application/json", forHTTPHeaderField: "Accept")
request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjIxM2QyMzE2OWIzNTNiOWNmNTUwNDFjYTIxZmMwOWFiOTQ4MDYyZWIwZjgxYjkxNTg4YjVlMThjMWQ1MjVlOWNmNDY1OGNkMGM3MjFmMzQ2In0.eyJhdWQiOiIyIiwianRpIjoiMjEzZDIzMTY5YjM1M2I5Y2Y1NTA0MWNhMjFmYzA5YWI5NDgwNjJlYjBmODFiOTE1ODhiNWUxOGMxZDUyNWU5Y2Y0NjU4Y2QwYzcyMWYzNDYiLCJpYXQiOjE1ODE1NDM5NDcsIm5iZiI6MTU4MTU0Mzk0NywiZXhwIjoxNjEzMTY2MzQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.cfaRcss9AvUEqGEGd7mA0E7dvLIS4NEN27e0uj5yBNU5zA-3FXt4rCGTCwSVycca27RkUOZFnwndFpA148HL-Cx1FFOwjpZhtwiQeaAavLIJHlJdd2jnx6MT5auc9pJsSb1RuLvzcORLy7x_2abmKsvnJ0Su9Vhnjo4EW55aYuCKRqtJK_Ahaqhn-XOOO3XOHJ-dpEzC_Aek0zA9oj9Np1GyWP-zCuz4QlI66uLhh1NflJp66Sp823s5lkNhu8tfO1x8oslbGYdhUc1qoOezutTIqX61PSe1RpecZh3FFVoiUE5kwFPqNsiTnMckYHntR8yQ6KQ5pJ1HVikRdVeIVTqYSAPHHuoVHDq0Wm7-9oy7mX9ie-ESFGqGMMAm5h30n7rviC_0TT8s3Z84_q-gcd_dJA4QlyNaywueIqTwinj9a7GSu3Ukqx6eA2bPVbw5iGAYzD4ocFAZTsjai9aqrdFafxGFMljrztt3o63kdgkeo7QMQhlCCwOyMCpuS2mTXNoWu_VV3t7JW0ke0cTMvv90loup4M096LWQScXyTlg3e5dxDflCsvYMpVZ9OBi9Py05OGUxFNyNJ4MMAJbYtZn26MWJqM5YdAdsBr9QzoL3Oww8X9tcYMdEfh9Z0Ko8Iqm1_vsQ_XluT-ep6mherY3kH8ehDeuWccCKaYDrI9A", forHTTPHeaderField: "Authorization")

request.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: request) { data, response, error in 
  guard let data = data else {
    print(String(describing: error))
    return
  }
  print(String(data: data, encoding: .utf8)!)
  semaphore.signal()
}

task.resume()
semaphore.wait()

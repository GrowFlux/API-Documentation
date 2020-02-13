import requests
import json

url = "https://api.growflux.com"
token = ""
payload = {}
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer ' + token
}



# get all APs
resource = "/v1/aps"
response = requests.request("GET", url + resource, headers=headers, data = payload)
response_parsed = json.loads(response.text)
aps = response_parsed["message"]["aps"]

for ap in aps:

    # get all CO2 sensors per AP
    resource = "/v1/ap/" + ap["id"] + "/co2_sensors"
    response = requests.request("GET", url + resource, headers=headers, data = payload)
    response_parsed = json.loads(response.text)

    co2_sensors = response_parsed["message"]["co2_sensors"]
    
    # for each sensor, print out its values
    for sensor in co2_sensors:
      print("CO2: " + str(co2_sensors[sensor]["latest_values"]["co2"]))
      print("Temperature: " + str(co2_sensors[sensor]["latest_values"]["temperature"]))
      print("Humidity: " + str(co2_sensors[sensor]["latest_values"]["humidity"]))
      print("Pressure: " + str(co2_sensors[sensor]["latest_values"]["pressure"]))
      print("Voltage: " + str(co2_sensors[sensor]["latest_values"]["voltage"]))

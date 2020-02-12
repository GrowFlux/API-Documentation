import requests

url = "https://api.growflux.com/v1/aps"

payload = {}
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {{ insert token here }}'
}

response = requests.request("GET", url, headers=headers, data = payload)

print(response.text.encode('utf8'))

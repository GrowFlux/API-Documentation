var client = new RestClient("https://api.growflux.com/v1/aps");
client.Timeout = -1;
var request = new RestRequest(Method.GET);
request.AddHeader("Accept", "application/json");
request.AddHeader("Authorization", "Bearer {{ insert token here }}");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
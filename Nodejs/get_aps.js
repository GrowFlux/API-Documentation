var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://api.growflux.com/v1/aps',
  'headers': {
    'Accept': 'application/json',
    'Authorization': 'Bearer {{ insert token here }}'
  }
};
request(options, function (error, response) { 
  if (error) throw new Error(error);
  console.log(response.body);
});

var settings = {
    "url": "https://api.growflux.com/v1/aps",
    "method": "GET",
    "timeout": 0,
    "headers": {
      "Accept": "application/json",
      "Authorization": "Bearer {{ insert token here }}"
    },
  };
  
  $.ajax(settings).done(function (response) {
    console.log(response);
  });
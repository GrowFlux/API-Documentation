OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
Request request = new Request.Builder()
  .url("https://api.growflux.com/v1/aps")
  .method("GET", null)
  .addHeader("Accept", "application/json")
  .addHeader("Authorization", "Bearer {{ insert token here }}")
  .build();
Response response = client.newCall(request).execute();
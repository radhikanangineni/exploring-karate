function fn(){
    var config = {
        url : 'https://reqres.in/api/users',
        clientCredentials : 'client_credentials',
        urlForRegistration : 'http://dummy.restapiexample.com/api/v1/create',
        updateUserUrl : 'https://reqres.in/api/users/'
    }
    var env = karate.env
    karate.log("Environment variable value is : ", karate.env)
    karate.log("Environment variable value is : ", env)
    if (env == 'qa'){
        config.url = 'https://reqresqa.in/api/users';
    }
    else if (env == 'dev'){
            config.url = 'https://reqresdev.in/api/users';
        }
    return config;
}
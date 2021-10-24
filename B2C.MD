### Command to create blazor web assembly with .NET backend with Azure AD
```cmd
dotnet new blazorwasm -au IndividualB2C --aad-b2c-instance "https://techblue.b2clogin.com/" --api-client-id "5c7ebc6c-9556-4514-b45d-fc58da6822e0" --app-id-uri "https://localhost:5001/authentication/login-callback" --client-id "5c7ebc6c-9556-4514-b45d-fc58da6822e0" --default-scope "API.Access" --domain "techblue.onmicrosoft.com" -ho -ssp "https://localhost:5001" --tenant-id "21e788e5-7c27-4553-bc5e-ea9ff90c0886" -o BlazorApp3
```

[source](https://medium.com/marcus-tee-anytime/azure-ad-b2c-quickstart-with-visual-studio-blazor-563efdff6fdd)
[source](https://codemilltech.com/xamarin-authentication-with-azure-active-directory-b2c/?utm_campaign=blog&utm_medium=ad-b2c-tutorial)
[source](https://codemilltech.com/azure-ad-b2c-application-fundamentals/)

### Some concepts
tenant -> 
	app(mobile/native/web/api resource) -> 
	each app will have scopes (permissions)
providers
    - Google/Microsoft/Facebook
policies
    - signup policies (how the user creates an account for app)
        - lists providers
        - what to collect
    - each policy gets its own http end point
    Policies are the gatekeeper - the rules - of how users can authenticate and manage their accounts with your apps
users
    
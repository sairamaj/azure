### Authentication
* Legacy
    * Basic (user + password)
    * NTLM (point to point)
    * Kerborose (ticketed system, Domain based)
* Modern
    * WS* and SAML
        * WS-Federation
        * SAML (Security Assertion Markup Language)
            * Exchange authentication & authorization across parties
            * SSOs
    * OAuth
        * Standard for delegation
        * Not authenticated protocol
        * Pseudo authentication ( side effect as it will know who i am)
    * Open Id connect
        * Adds strict standard so OAuth can be used as Authentication protocol
        * Identity layer built on top of OAuth 2.0
        * Flows
            * Implicit 
            * PKCE Proof Key for Code Exchange
            * Auth Code 
                * Token exchange
                    * ID token 
                    * Access token (allows to do something)
            * Client credentials
* Azure
    * ADAL (before open id connect) / MSAL (after openid connect)

## Az without subscription
```cmd
    az login --allow-no-subscriptions
    az ad sp create-for-rbac --skip-assignment
```

* Service principles are under app registrations. Service principle and App registration are joined at the hip :)
* Service principles can be added to group
* Az login will work with service princples
* Az login will work with VM identities

* Service principles without Apps is common , but Apps without service principle is not becuase as soon as permission is givent to app, a service principle is created.
* Every app created gets default __Users.Read__ (of __Microsoft.Graph__ api)

* Application Types
    * Single Tenant (used in single AD)
    * Multi tenant (used across AD)

    * Native
    * Web

    * Public Client (canot store secrets - SPA)
    * Confidential Client (web servers)

* Registering App
    * Portal
    * Cli
    * Powershell
    * Microsoft Graph API

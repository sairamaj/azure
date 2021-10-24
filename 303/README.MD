# Key Vault
[Key Vault](https://www.youtube.com/watch?v=PgujSug1ZbI&ab_channel=AdamMarczak-AzureforEveryone)
## Demo
### Using in Logic app
* Created key vault
* Added secret

* Created logic app 
* Added system identity

* Added Get policy in key vault for this system identity
* In Logic app added Get secret from key vault using managed identity
* Ran the logic app to see the secret.

### VM data encryption
* Enabled "Azure disk encryption for volume encryption"
* In Virtual machine -> disks -> Advanced settings enabled disck encryption
* In key vault it created a new secret.

# Managed Applications in Azure AD
* Permissions
  * Delegated - for physical users (signed in user)
    * Effective permissions - intersection of permissions defined in app registration + end user
    * i.e if delegated permission is given for this app (say delete AD users) but end user does not have permission then user will not have permission and the app using this id may not work as expected.
  * Application - for background permissions
    * Effective permissions - permissions given here.

You cannot have system identity and user identity at the same time on given resource.



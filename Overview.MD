Tenant Id (1) ----> (\*) Subscriptions  
Subscription(1) ----> (\*) Resource Groups  
Resource Group(1) -----> (\*) Resource


### Role
   * describe set of permissions
   * role assignment
        * user/group  --> subscription/resourcegroup/resource

    * Platform roles
        * Owner (can manage everything, including access)
        * Contributor (can manage everything except access)
        * Reader (can view everything, but can't make changes)
        * User Access Administrator (can manage user access to Azure resources)  
    * Service Principles
        * In some cases, you want to run code or script that accesses resources, but you don't want to run it under a user’s credentials. Instead, you want to create an identity called a service principal for the application and assign the appropriate role for the service principal.



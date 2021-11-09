* Azure MFA can be enforced in multiple ways (Security Administrator,Conditional Access Administrator, Global Administrator)
  * Through conditional access policy
    * Signal
      * User and location
      * Application
      * Device
      * Real-time risk
    * Access
      * Block
      * Grant (with MFA)
  * Through security defaults
  * By instituting per-user MFA
  * Through Azure identity protection
    * Automate the detection and remediation of identity-based risks
    * Investigate risks using data in the portal.
    * Export risk detection to third party tools for further analysis.

* MFA can also be trigged by
  * Requring MFA for device registration on your tenant device settings
  * To complete self-service password reset.
  * Per request by the application,such as federation IDP like ADFS requring MFA be performed.
  [mfa-video](https://www.youtube.com/watch?v=qNndxl7gqVM&ab_channel=MicrosoftSecurity)
# Least Privilege and Access Control Schemes

Least privilege is granting access that is limited to what is only necessary for a user to complete their work

## Access Control Schemes

### DAC - Discretionary Access Control
 - The least restrictive scheme.  In DAC every object has an owner who has total control over that object.  The owner has the discretion (the choice) as to who can access their object and can grant permissions to other objects over these objects.  This scheme is used on major OS's.  
 - The problem with this is embedded in the whole scheme itself. it relies on the user to set the proper level of security.  This could result in incorrect permission settings.  As well as permissions will be "inherited" by programs and may act as an attack vector.

### MAC - Mandatory Access Control
 - The most restrictive scheme.  MAC assigns users access controls strictly according to the custodian's desires.  A user has no freedom to set any controls or distribute access to other subjects.
 - Key Elements
    - Labels - every entity is assigned a label.  The labels represent the relative importance of an object, such as confidential, secret, and top secret.  Subjects are assigned a privilege label, sometimes called a clearance.
    - Levels - A hierarchy based on the labels is used for objects and subjects.
 - MAC grants permission by matching Object Labels Levels
 - MS Windows uses a MAC implementation called Mandatory Integrity Control (MIC). A Security Identifier (SID) is a unique number issued to a user, group or session.  When a user logs in, the SID is retrieved from a DB and is used in all actions with the system.  The SID is linked to an Integrity Level.  Objects are assigned integrity levels, low, medium, high or system.  MIC works in addition to Windows DAC. 
 
### RBAC - Role-Based Access Control
 - Sometimes called Non-Discretionary Access Control.  RBAC is considered a more "real-world" access control than other schemes because the access under RBAC is based on a user's job function within an organization.  Instead of assigning persmissions to certain users or groups, it assigns permissions by roles.  Objects are set to a certain type to which subjects of a certain role have access.



### RB-RBAC - Rule-Based Role Based Access Control 

 - Sometimes called Rule-based Access Control scheme or "automated provisioning".
 - Can dynamically assign roles to subjects bnased on a set of rules.  Each resource object contains a set of access properties based on the rules.
 - Often used for managijng user access to one or more systems, where business changes may trigger the application of the rules that specify accecss changes.
 - All access permissions are controlled based on rules established by the custodian or system administrator.

### ABAC - Attribute-Based Access Control 
 - Uses flexible policies that can combine attributes.  These policies can take advantage of many different types of attributes, such as object, subject and environment attributes.
 - ABAC can also enforce DAC and MAC schemes.
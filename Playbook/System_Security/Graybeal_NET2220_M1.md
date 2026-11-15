# Milestone 1 student evidence template

NET 2220  |  One evidence record  |  Due November 15 at 6 pm Eastern

**Student name:**
Andy Graybeal

| Field                | Windows                                              | Linux                                                    |
| -------------------- | ---------------------------------------------------- | -------------------------------------------------------- |
| **Host**             | EC2AMAZ-I8650VH                                      | ip-172-31-31-229.ec2.internal                            |
| **Operating system** | Windows Server 2022                                  | Amazon Linux 2023                                        |
| **Account scope**    | Local accounts; no domain or central user directory  | Local accounts; no domain or central user directory      |
| **Tools**            | Remmina/RDP and PowerShell                           | SSH, Bash, and sudo                                      |
| **Folders**          | `C:\CourseLab\Published`  <br>`C:\CourseLab\Working` | `/srv/courselab/published`  <br>`/srv/courselab/working` |

**Recovery access and rollback method:**
Clobber and recreate EC2 instances and run the relevant scripts:
m1_linux_baseline.sh
m1_windows_baseline.ps1

## Role and configuration record

| Role         | Windows account and groups                                            | Linux account and groups                                                  | Required access                            |
| ------------ | --------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------ |
| Reader       | **Account:** m1reader<br>**Groups:** M1-Readers, Users                | **Account:** m1reader<br>**Groups:** m1reader, m1readers                  | Published read only; Working denied        |
| Operator     | **Account:** m1operator<br>**Group:** M1-Readers, M1-Operators, Users | **Account:** m1operator<br>**Groups:** m1operator, m1readers, m1operators | Published read only; Working create/modify |
| Retired user | **Account:** m1retired<br>**Group:** Users                            | **Account:** m1retired<br>**Groups:** m1retired                           | Designated sign-in disabled                |

**Explain how the configured permissions implement these jobs. Add readable configuration evidence here:**

**Linux Explanation:**
Overview:
We have work to do! We have some roles to fill. We have three roles: one implicit role and two explicit roles. The latter two are the roles we explicitly configure in our example. Our implicit role consists of a writer, who appears to be the owner. We have a reader role and an operator role. We also have someone who is retired; their former role is not mentioned.

To accomplish this work, we will be using a modern computing system with a multi-user operating system and a file system that is up to the task. I assume we all will be happily SSH’ing into the system to do our work.

Now the owner apparently is using the superuser account, `root`, to work within our system. This person writes the things for our reader to read. These written things are saved as files on the computer, which is run by an operating system that stores things in a file system.

A file system contains files and directories (also called folders). Directories help us organize our files. They can have owners and attributes called permissions that control what users can do with them and their contents. These permissions can apply to individual user accounts and groups of users, allowing actions such as accessing, viewing, creating, modifying, or deleting files and directories.

Depending on the file system and its features, directories can have lots of fun behaviors. One such behavior is called group ownership inheritance, meaning that new files and subdirectories created within a directory inherit its group ownership.

When using file systems such as ext3 or Btrfs, without group ownership inheritance enabled, a new file or directory normally receives the primary group of the user creating it. On many Linux systems, this group has the same name as the user account and is created alongside the user.

Without group ownership inheritance, new files created by `root` would normally belong to `root:root`. Whether readers could read those files would depend on the files’ other permissions. Enabling group ownership inheritance ensures that newly created files belong to the directory’s Reader group.

We will have two directories: a Published directory and a Working directory.  
Published will live here: `/srv/courselab/published`  
Working will live here: `/srv/courselab/working`

The Writer role has permission to access, read, create, and modify files in all the directories, but for this example, we are focusing on the Published directory.

The Reader role and the Operators role both have permission to access and read  the Published directory.

The Operator role has permission to access, read, create and modify files in the Working directory.


**Outline Overview**
1. Roles are established: Reader, Operator, and Writer (inferred and performed using the superuser account, root).
2. Each role is given space on the file system, with user accounts, group membership, and directory permissions arranged so it can carry out its job.
3. Each directory’s group permissions determine what members of its assigned group can do within it.
4. User accounts are added to the appropriate groups and receive access through those groups’ permissions.
5. The account belonging to someone who has retired is disabled.

	Relevent to this scenario, there are two directories, two groups. three user accounts.
1. **Directories**
    a. Published - `/srv/courselab/published`
    - Is accessible and readable by the group `m1readers`.
    - Has group ownership inheritance enabled with setgid - the leading `2` in `2750` from the command: `sudo chmod 2750 /srv/courselab/published`.
    b. Working - `/srv/courselab/working`
     - Is accessible, writable, and readable by the group `m1operators`.
     - Has group ownership inheritance enabled with setgid - the leading `2` in  2770 from the command: `sudo chmod 2770 /srv/courselab/working`
2. **Groups**
    a. `m1readers`
     - Implements the “Reader Role,” giving its members read and access permissions to `/srv/courselab/published`.
    b. `m1operators`
    - Implements the “Operator Role,” giving its members read, write, and access permissions to `/srv/courselab/working`.
    - Operator accounts also belong to `m1readers`, giving them read and access permissions to `/srv/courselab/published`.
3. **Users**
    a. `m1reader`
    - Belongs to the group `m1readers`.
    b. `m1operator`
    - Belongs to both groups, `m1readers` and `m1operators`.
    c. `m1retired`
    - A disabled account.

**Linux Configuration Evidence:**
1. **Proof Line**
```
[ec2-user@ip-172-31-31-229 ~]$ id; hostname; date
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sat Nov 14 20:23:43 UTC 2026
```

2. **Directory, Account and Group Info**
```
[ec2-user@ip-172-31-31-229 ~]$ ls -ld /srv/courselab/published/ /srv/courselab/working/
drwxr-s---. 2 root m1readers   24 Nov 14 17:37 /srv/courselab/published/
drwxrws---. 2 root m1operators  6 Nov 14 17:37 /srv/courselab/working/

[ec2-user@ip-172-31-31-229 ~]$ id m1reader
uid=1001(m1reader) gid=1003(m1reader) groups=1003(m1reader),1001(m1readers)

[ec2-user@ip-172-31-31-229 ~]$ id m1operator
uid=1002(m1operator) gid=1004(m1operator) groups=1004(m1operator),1001(m1readers),1002(m1operators)
```

3.  **Retired Account Check:**
```
[ec2-user@ip-172-31-31-229 ~]$ getent passwd m1retired
m1retired:x:1003:1005::/home/m1retired:/sbin/nologin

[ec2-user@ip-172-31-31-229 ~]$ sudo passwd -S m1retired 
m1retired LK 2026-11-14 0 99999 7 -1 (Password locked.)

[ec2-user@ip-172-31-31-229 ~]$ sudo chage -l m1retired
Last password change					: Nov 14, 2026
Password expires					: never
Password inactive					: never
Account expires						: Jan 02, 1970
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7
```

**Windows Explaination:**
The reader account belongs to `M1-Readers`, and the operator account belongs to both `M1-Readers` and `M1-Operators`. Both can read files in Published, but neither can change them.

The operator can also create, read, edit, and delete files in Working. The reader is not given access to Working.

Inherited permissions are removed from both folders, and the assigned permissions are configured to pass down to files and subfolders.

The retired account is disabled to prevent sign-in. All three test accounts belong to the built-in Users group, and none is added to Administrators.

**Outline:**
1. **Accounts and group membership** 
	- m1reader belongs to M1-Readers.
	- m1operator belongs to both M1-Readers and M1-Operators.
	- All three test accounts belong to the built-in Users group.
2. **Folder ownership and permissions**
    - **Published:** M1-Readers receives **Read and Execute (RX)**, allowing both active users to read files and list and enter the folder, without changing its contents.
    - **Working:** M1-Operators receives **Modify (M)**, allowing the operator to read, create, edit, and delete files. The reader receives no access.
    - /inheritance:r removes inherited permissions from each folder.
    - (OI)(CI) makes the assigned permissions inherit to files and subfolders.
3. **Sign-in restrictions and administrative access**
    - m1retired is disabled with Disable-LocalUser, preventing sign-in.
    - None of the three test accounts is added to Administrators.


**Windows Command Line Evidence:**
```
PS C:\Users\Administrator> whoami; hostname; Get-Date
>> icacls C:\CourseLab\Published
>> icacls C:\CourseLab\Working
>> Get-LocalUser m1*
>> Get-LocalGroupMember M1-Readers
>> Get-LocalGroupMember M1-Operators
ec2amaz-toecnjs\administrator
EC2AMAZ-TOECNJS

Sunday, November 15, 2026 6:38:53 AM
C:\CourseLab\Published EC2AMAZ-TOECNJS\M1-Readers:(OI)(CI)(RX)
                       NT AUTHORITY\SYSTEM:(OI)(CI)(F)
                       BUILTIN\Administrators:(OI)(CI)(F)

Successfully processed 1 files; Failed processing 0 files
C:\CourseLab\Working EC2AMAZ-TOECNJS\M1-Operators:(OI)(CI)(M)
                     NT AUTHORITY\SYSTEM:(OI)(CI)(F)
                     BUILTIN\Administrators:(OI)(CI)(F)

Successfully processed 1 files; Failed processing 0 files

AccountExpires         :
Description            :
Enabled                : True
FullName               :
PasswordChangeableDate : 11/15/2026 6:07:32 AM
PasswordExpires        : 12/27/2026 6:07:32 AM
UserMayChangePassword  : True
PasswordRequired       : False
PasswordLastSet        : 11/15/2026 6:07:32 AM
LastLogon              :
Name                   : m1operator
SID                    : S-1-5-21-379965801-1080363049-125441216-1003
PrincipalSource        : Local
ObjectClass            : User


AccountExpires         :
Description            :
Enabled                : True
FullName               :
PasswordChangeableDate : 11/15/2026 6:07:32 AM
PasswordExpires        : 12/27/2026 6:07:32 AM
UserMayChangePassword  : True
PasswordRequired       : False
PasswordLastSet        : 11/15/2026 6:07:32 AM
LastLogon              :
Name                   : m1reader
SID                    : S-1-5-21-379965801-1080363049-125441216-1002
PrincipalSource        : Local
ObjectClass            : User


AccountExpires         :
Description            :
Enabled                : False
FullName               :
PasswordChangeableDate : 11/15/2026 6:07:32 AM
PasswordExpires        : 12/27/2026 6:07:32 AM
UserMayChangePassword  : True
PasswordRequired       : False
PasswordLastSet        : 11/15/2026 6:07:32 AM
LastLogon              :
Name                   : m1retired
SID                    : S-1-5-21-379965801-1080363049-125441216-1004
PrincipalSource        : Local
ObjectClass            : User


Name            : EC2AMAZ-TOECNJS\m1operator
SID             : S-1-5-21-379965801-1080363049-125441216-1003
PrincipalSource : Local
ObjectClass     : User


Name            : EC2AMAZ-TOECNJS\m1reader
SID             : S-1-5-21-379965801-1080363049-125441216-1002
PrincipalSource : Local
ObjectClass     : User


Name            : EC2AMAZ-TOECNJS\m1operator
SID             : S-1-5-21-379965801-1080363049-125441216-1003
PrincipalSource : Local
ObjectClass     : User
```


## Identity specific access tests

| System and role      | Test                         | Expected                        | Actual result and evidence                                                                                                                                                                               |
| -------------------- | ---------------------------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Windows Reader       | Read Published file          | Allowed                         | `m1reader`,<br>read succeeded,<br>See W1.                                                                                                                                                                |
| Windows Reader       | Create/modify Published file | Denied                          | `m1reader`,<br>write failed,<br>see W2.                                                                                                                                                                  |
| Windows Reader       | Access Working folder        | Denied                          | `m1reader`,<br>access failed,<br>see W3.                                                                                                                                                                 |
| Windows Operator     | Create/modify Working file   | Allowed                         | `m1operator`,<br>write & list succeeded,<br>see W4.                                                                                                                                                      |
| Windows Retired user | Designated sign-in           | Denied because account disabled | `m1retired` / `Administrator` ,<br>sign-in failed,<br>see W5.                                                                                                                                            |
| Linux Reader         | Read Published file          | Allowed                         | `m1reader`,<br>read succeeded,<br>see L1.                                                                                                                                                                |
| Linux Reader         | Create/modify Published file | Denied                          | `m1reader`,<br>write failed,<br>see L2.                                                                                                                                                                  |
| Linux Reader         | Access Working folder        | Denied                          | `m1reader`,<br>read failed,<br>see L3.                                                                                                                                                                   |
| Linux Operator       | Create/modify Working file   | Allowed                         | `m1operator`,<br>write & read succeeded,<br>see L4.                                                                                                                                                      |
| Linux Retired user   | Designated sign-in           | Denied because account disabled | `m1retired` (technically it is the `admin` account failing to login to the `m1retired` account - but I think you are fishing for the `m1retired` account for this answer),<br>sign-in failed,<br>see L5. |

L1:
```
[ec2-user@ip-172-31-31-229 ~]$ sudo -u m1reader bash -c 'id; hostname; date; cat /srv/courselab/published/notice.txt'
uid=1001(m1reader) gid=1003(m1reader) groups=1003(m1reader),1001(m1readers) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sun Nov 15 02:25:35 UTC 2026
Team notice
```

L2:
```
[ec2-user@ip-172-31-31-229 ~]$ sudo -u m1reader bash -c 'id; hostname; date; touch /srv/courselab/published/test.txt'
uid=1001(m1reader) gid=1003(m1reader) groups=1003(m1reader),1001(m1readers) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sun Nov 15 02:34:41 UTC 2026
touch: cannot touch '/srv/courselab/published/test.txt': Permission denied
```

L3:
```
[ec2-user@ip-172-31-31-229 ~]$ sudo -u m1reader bash -c 'id; hostname; date; ls /srv/courselab/working'
uid=1001(m1reader) gid=1003(m1reader) groups=1003(m1reader),1001(m1readers) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sun Nov 15 02:38:27 UTC 2026
ls: cannot open directory '/srv/courselab/working': Permission denied
```

L4:
```
[ec2-user@ip-172-31-31-229 ~]$ sudo -u m1operator bash -c 'id; hostname; date; echo draft > /srv/courselab/working/draft.txt; ls -l /srv/courselab/working'
uid=1002(m1operator) gid=1004(m1operator) groups=1004(m1operator),1001(m1readers),1002(m1operators) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sun Nov 15 02:40:58 UTC 2026
total 4
-rw-r--r--. 1 m1operator m1operators 6 Nov 15 02:40 draft.txt
```

L5:
```
[ec2-user@ip-172-31-31-229 ~]$ sudo su - m1retired
This account is currently not available.
```

W0:
```
PS C:\Users\Administrator> whoami; hostname; Get-Date
ec2amaz-i8650vh\m1reader
EC2AMAZ-I8650VH

Sunday, November 15, 2026 4:22:22 AM
```

W1:
```
PS C:\Users\Administrator> Get-Content C:\CourseLab\Published\notice.txt
Team notice
```

W2:
```
PS C:\Users\Administrator> Set-Content C:\CourseLab\Published\test.txt "test"
Set-Content : Access to the path 'C:\CourseLab\Published\test.txt' is denied.

```

W3:
```
PS C:\Users\Administrator> Get-ChildItem C:\CourseLab\Working
Get-ChildItem : Access to the path 'C:\CourseLab\Working' is denied.

```

W4:
```
PS C:\Users\Administrator> whoami; hostname; Get-Date
>> Set-Content C:\CourseLab\Working\draft.txt "draft"
>> Get-ChildItem C:\CourseLab\Working
ec2amaz-i8650vh\m1operator
EC2AMAZ-I8650VH

Sunday, November 15, 2026 4:40:45 AM

LastWriteTime : 11/15/2026 4:40:45 AM
Length        : 7
Name          : draft.txt
```

W5:
```
PS C:\Users\Administrator> Start-Process powershell -Credential (Get-Credential m1retired)
Start-Process : This command cannot be run due to the error: Account restrictions are preventing this user from signing in.
For example: blank passwords aren't allowed, sign-in times are limited, or a policy restriction has been enforced.

```


## Troubleshooting AI use and handoff

### One troubleshooting or change record

I didn't have an issue with the directories, groups, users or any of the permissions.

I emailed the instructors early Sunday morning for an assignment and haven't received anything.

I am intentionally leaving this section incomplete. I understand that omitting it may reduce my grade.

### Applied AI during administration

**Administrator task and tool:**  
I used ChatGPT to help explain the Linux directory permissions and group ownership inheritance used in this lab.

**Useful task-specific prompt or concise prompt summary:**  
I asked whether `sudo chmod 2750 /srv/courselab/published` enables group ownership inheritance and how that affects newly created files.

**Suggestion, command or procedure used or corrected:**  
ChatGPT explained that the leading `2` enables setgid, causing new files and subdirectories to inherit the directory’s group ownership.

**What I actually ran, actual result and final decision:**  
I ran `ls -ld /srv/courselab/published/ /srv/courselab/working/`. Published showed `2750` permissions with ownership `root:m1readers`. Working showed `2770` permissions with ownership `root:m1operators`. Both had setgid enabled. The configuration matched the intended permissions and group ownership, so I left it unchanged.

**Relevant limitation, mistaken suggestion or data-handling risk:**  
ChatGPT could explain the command, but it could not verify my system’s configuration. Group ownership inheritance also does not automatically grant group read permission.

### AWS IAM comparison

| Concept                            | Local or directory environment                                                                                    | AWS IAM comparison                                                                                                                                                                                                              |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Identity                           | Accounts such as `m1reader` and `m1operator` identify users on the system.                                        | IAM users identify people or applications. IAM roles are identities that can be assumed to obtain temporary credentials, rather than ordinary local login accounts.                                                             |
| Group or role permissions          | Group membership and directory permissions implement our Reader and Operator roles.                               | Policies attached to IAM groups grant permissions to their members. An IAM role has its own policies and is assumed, rather than joined like a group.                                                                           |
| Least privilege and responsibility | Readers can read Published without changing it. The administrator manages accounts, memberships, and permissions. | A similar policy could allow reading objects in a particular S3 bucket without allowing changes. AWS protects its underlying infrastructure; the customer is responsible for configuring appropriate access to their resources. |

## Individual demonstration and project link

I missed the demonstration in the lab.

GitHub documentation link and submitted version: [enter accessible link/version]. Attached scripts, if used: [list file names].

Before submitting: both systems included; all ten tests have actual results; correction/retest/rollback documented; applied AI contribution explained; AWS comparison completed; supporting evidence readable; no secrets. Save as Lastname_NET2220_M1.docx.

**AI usage statement:** I used ChatGPT to help clarify assignment instructions, understand permissions, and edit my explanations while keeping my own wording and voice. I also used it to help draft the AWS IAM comparison. I ran the commands and checked the actual results myself.

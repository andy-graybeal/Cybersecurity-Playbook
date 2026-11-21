# Milestone 2 | Services and Cloud Operation

## Part 1. Milestone 1 feedback applied

| Feedback received | Change I made | Command or capture showing the change |
|---|---|---|
| [Enter actual feedback] | [Enter] | [Insert evidence] |



## Part 2. Publish a web page on Linux with ngnix
```
ec2-user@ip-172-31-31-229 html]$ id; hostname; date; curl http://localhost
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Mon Nov 16 17:24:08 UTC 2026
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>

	<h1>graybeal-linux: TEAM SERVICE PAGE</h1>


	<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.
Further configuration is required for the web server, reverse proxy, 
API gateway, load balancer, content cache, or other features.</p>

<p>For online documentation and support please refer to
<a href="https://nginx.org/">nginx.org</a>.<br/>
To engage with the community please visit
<a href="https://community.nginx.org/">community.nginx.org</a>.<br/>
For enterprise grade support, professional services, additional 
security features and capabilities please refer to
<a href="https://f5.com/nginx">f5.com/nginx</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
[ec2-user@ip-172-31-31-229 html]$ 
```

## Part 3.a Publish a web page on Windows with IIS
```
PS C:\inetpub\wwwroot> whoami; hostname; Get-Date; (Invoke-WebRequest http://localhost -UseBasicParsing).Content
ec2amaz-toecnjs\administrator
EC2AMAZ-TOECNJS                                                                                                                                                                                                                                                                       Monday, November 16, 2026 5:51:31 PM                                                                                                       <h1>graybeal-windows: TEAM SERVICE PAGE</h1>


PS C:\inetpub\wwwroot>
```

## Part 3.b Share the Published folder on Windows
```
PS C:\Users\Administrator> Get-SmbShareAccess -name Published

Name      ScopeName AccountName                AccessControlType AccessRight
----      --------- -----------                ----------------- -----------
Published *         EC2AMAZ-TOECNJS\M1-Readers Allow             Read


PS C:\Users\Administrator>
```
### Read Test as `m1reader`
```
PS C:\Users\Administrator> whoami; hostname; Get-Date; Get-Content \\localhost\Published\notice.txt
ec2amaz-toecnjs\m1reader
EC2AMAZ-TOECNJS

Monday, November 16, 2026 6:33:01 PM
Team notice
```
### Write Test as `m1reader`
```
PS C:\Users\Administrator> Set-Content \\localhost\Published\test.txt "text"
Set-Content : Access to the path '\\localhost\Published\test.txt' is denied.
At line:1 char:1
+ Set-Content \\localhost\Published\test.txt "text"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : PermissionDenied: (\\localhost\Published\test.txt:String) [Set-Content], UnauthorizedAccessException
    + FullyQualifiedErrorId : GetContentWriterUnauthorizedAccessError,Microsoft.PowerShell.Commands.SetContentCommand

PS C:\Users\Administrator>
```
### Read Test as m1operator
```
PS C:\Users\Administrator> whoami; hostname; Get-Date; Get-Content \\localhost\Published\notice.txt
ec2amaz-toecnjs\m1operator
EC2AMAZ-TOECNJS

Monday, November 16, 2026 7:13:21 PM
Team notice
```
### Write Test as m1operator
```
PS C:\Users\Administrator> Set-Content \\localhost\Published\test.txt "test"
Set-Content : Access to the path '\\localhost\Published\test.txt' is denied.
At line:1 char:1
+ Set-Content \\localhost\Published\test.txt "test"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : PermissionDenied: (\\localhost\Published\test.txt:String) [Set-Content], UnauthorizedAccessException
    + FullyQualifiedErrorId : GetContentWriterUnauthorizedAccessError,Microsoft.PowerShell.Commands.SetContentCommand
```

**Explanation of the `m1operators` access:**
1. `m1operator` is a user inside the `M1-Readers` group.
2. The NTFS filesystem permission grants only read and execute access to the `Published` folder for the `M1-Readers` group.
3. The SMB share permission grants only read access  to the `Published` share for the `M1Readers` group.
4. The result of this is there is no write access in either the NTFS filesystem or the SMB share for `m1operator`.

## Part 4. Add a storage volume to each server

#### LInux
```
[ec2-user@ip-172-31-31-229 ~]$ echo "storage test" | sudo tee /srv/data/test.txt ; id; hostname; date; df -h /srv/data; cat /srv/data/test.txt 
storage test
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Fri Nov 20 13:23:49 UTC 2026
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme1n1    960M   40M  921M   5% /srv/data
storage test
[ec2-user@ip-172-31-31-229 ~]$ 
```

#### Windows
```
PS C:\Users\Administrator> whoami; hostname; Get-Date; Get-Volume -FileSystemLabel Data
ec2amaz-toecnjs\administrator
EC2AMAZ-TOECNJS

Friday, November 20, 2026 3:30:14 PM

ObjectId             : {1}\\EC2AMAZ-TOECNJS\root/Microsoft/Windows/Storage/Providers_v2\WSP_Volume.ObjectId="{c358a362-e0b5-
                       11f1-bb8a-806e6f6e6963}:VO:\\?\Volume{9ebc6b38-4c9c-4f63-8c40-04fdbd4d08e0}\"
PassThroughClass     :
PassThroughIds       :
PassThroughNamespace :
PassThroughServer    :
UniqueId             : \\?\Volume{9ebc6b38-4c9c-4f63-8c40-04fdbd4d08e0}\
AllocationUnitSize   : 4096
DedupMode            : NotAvailable
DriveLetter          : D
DriveType            : Fixed
FileSystem           : NTFS
FileSystemLabel      : Data
FileSystemType       : NTFS
HealthStatus         : Healthy
OperationalStatus    : OK
Path                 : \\?\Volume{9ebc6b38-4c9c-4f63-8c40-04fdbd4d08e0}\
Size                 : 1056894976
SizeRemaining        : 1041604608
PSComputerName       :


PS C:\Users\Administrator> Set-Content D:\test.txt "storage test"
PS C:\Users\Administrator> Get-Content D:\test.txt
storage test
PS C:\Users\Administrator>
```

## Part 5. Allow web traffic only from your IP with security groups

### Add HTTP/port 80 (allow) to AWS Security Group and test from my own machine
#### Windows Security Group![[screenshot-2026-11-20_10-49-21-chromium.png]]

#### Windows IIS response from my browser
![[screenshot-2026-11-20_10-53-46-chromium.png]]

#### Linux Security Group![[screenshot-2026-11-20_10-51-34-chromium.png]]

#### Linux ngnix response from my browser
![[screenshot-2026-11-20_10-54-49-chromium.png]]


## Part 6. Turn on the host firewalls and prove a denied path
#### Linux
HTTP not allowed
```
[ec2-user@ip-172-31-31-229 ~]$ sudo firewall-cmd --remove-service=http
success
[ec2-user@ip-172-31-31-229 ~]$ id; hostname; date
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Fri Nov 20 16:18:29 UTC 2026
[ec2-user@ip-172-31-31-229 ~]$ 
```
![[screenshot-2026-11-20_11-15-07-chromium.png]]

HTTP allowed
```
[ec2-user@ip-172-31-31-229 ~]$ sudo firewall-cmd --reload
success
[ec2-user@ip-172-31-31-229 ~]$ id; hostname; date
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Fri Nov 20 16:22:56 UTC 2026
[ec2-user@ip-172-31-31-229 ~]$ 
```

![[screenshot-2026-11-20_11-22-48-chromium.png]]


#### Windows
```
PS C:\Users\Administrator> Get-NetFirewallRule -DisplayGroup "World Wide Web Services (HTTP)" | Select-Object DisplayName, Enabled, Direction

DisplayName                               Enabled Direction
-----------                               ------- ---------
World Wide Web Services (HTTP Traffic-In)    True   Inbound


PS C:\Users\Administrator> whoami; hostname; Get-Date
ec2amaz-toecnjs\administrator
EC2AMAZ-TOECNJS

Friday, November 20, 2026 5:00:41 PM


PS C:\Users\Administrator>
```


Screenshot of the now deleted HTTP Rule:![[screenshot-2026-11-20_13-15-13-chromium.png]]

And the my browser screenshot:![[screenshot-2026-11-20_13-17-19-chromium.png]]

**Name of the control that allowed or blocked the sites**:
Linux: Local Firewall 
Windows: AWS Security Group

## PART 7.  Applied AI: read-only health checks

### Linux

**AI prompt for Linux check script:**
"I am a junior administrator. Write a read-only bash script for Amazon Linux 2023 that reports whether nginx and sshd are running, the free space on / and /srv/data, and the listening TCP ports. Do not change anything on the server."

**Linux Script: `m2_health.sh`**
```
#!/usr/bin/env bash

echo "=== Service status ==="
for service in nginx sshd; do
    if systemctl is-active --quiet "$service"; then
        echo "$service: running"
    else
        echo "$service: not running"
    fi
done

echo
echo "=== Free space ==="
df -h / /srv/data

echo
echo "=== Listening TCP ports ==="
ss -ltn
```

**Script output on Linux**
```
[ec2-user@ip-172-31-31-229 ~]$ vim m2_health.sh
[ec2-user@ip-172-31-31-229 ~]$ chmod +x m2_health.sh 
[ec2-user@ip-172-31-31-229 ~]$ ./m2_health.sh 
=== Service status ===
nginx: running
sshd: running

=== Free space ===
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p1  8.0G  1.7G  6.3G  22% /
/dev/nvme1n1    960M   40M  921M   5% /srv/data

=== Listening TCP ports ===
State          Recv-Q          Send-Q                   Local Address:Port                   Peer Address:Port         
LISTEN         0               511                            0.0.0.0:80                          0.0.0.0:*            
LISTEN         0               128                            0.0.0.0:22                          0.0.0.0:*            
LISTEN         0               511                               [::]:80                             [::]:*            
LISTEN         0               128                               [::]:22                             [::]:*            
[ec2-user@ip-172-31-31-229 ~]$ id; hostname; date
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Fri Nov 20 18:47:23 UTC 2026
[ec2-user@ip-172-31-31-229 ~]$ 
```

**Health Check Report Output:**
Everything aligns with what it should be.

### Windows

**AI prompt for Windows check script:** 
"I need the same thing in PowerShell for Windows Server 2022, checking W3SVC and LanmanServer, free space on each volume, and listening TCP ports."

**Windows Script: m2_health.ps**
```
# Read-only report for Windows Server 2022

Write-Host "=== Service status ==="
foreach ($name in 'W3SVC', 'LanmanServer') {
    $service = Get-Service -Name $name -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        Write-Host "${name}: not installed"
    } else {
        Write-Host "${name}: $($service.Status)"
    }
}

Write-Host "`n=== Free space on each volume ==="
Get-Volume |
    Select-Object DriveLetter, FileSystemLabel, FileSystem,
        @{Name='SizeGB'; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name='FreeGB'; Expression={[math]::Round($_.SizeRemaining / 1GB, 2)}} |
    Format-Table -AutoSize

Write-Host "`n=== Listening TCP ports ==="
Get-NetTCPConnection -State Listen |
    Sort-Object LocalPort, LocalAddress |
    Select-Object LocalAddress, LocalPort |
    Format-Table -AutoSize
```

**Script output on Windows:**
```
PS C:\Users\Administrator> powershell -ExecutionPolicy Bypass -File .\m2_health.ps1
=== Service status ===
W3SVC: Running
LanmanServer: Running

=== Free space on each volume ===

DriveLetter FileSystemLabel FileSystem SizeGB FreeGB
----------- --------------- ---------- ------ ------
          C                 NTFS           30    9.7
          D Data            NTFS         0.98   0.97



=== Listening TCP ports ===

LocalAddress LocalPort
------------ ---------
::                  80
::                 135
0.0.0.0            135
172.31.28.61       139
::                 445
::                3389
0.0.0.0           3389
::                5985
::               47001
::               49664
0.0.0.0          49664
::               49665
0.0.0.0          49665
::               49666
0.0.0.0          49666
::               49667
0.0.0.0          49667
::               49668
0.0.0.0          49668
::               49669
0.0.0.0          49669
::               49671
0.0.0.0          49671

```

**Health Check Report Output:**
Everything aligns with what it should be.

## Part 8. Diagnose a service problem

### The Linux data volume is missing after a restart

**For my scenario**
Let's pretend that I got the FSTAB information wrong, say I missed a number in the UUID.
The five things recorded:
	**1. The symptom:**
		The drive isn't being mounted after reboot, but it exists otherwise.
	**2. The evidence:**
		We can see the evidence with the command `findmnt /srv/data`; the share doesn't show up.
	**3. The cause:**
		We `cat`'d the `fstab` to see if I recorded everything correctly and found an error.
	**4. The fix:**
		I fixed it by editing fstab: `sudo vim /etc/fstab`
	**5. The retest:**
		**A.** I tested my edit with `sudo mount -a`, which mounts the things that exist in fstab if they already aren't mounted.
		**B.** Then looked to see if that ran okay with `findmnt /srv/data`.
		**C.** For the final test, I rebooted, `sudo reboot` and ran `findmnt /srv/data` one more time.

These are the commands used to troubleshoot and fix the issue:
```
ls -al /srv/data
findmnt /srv/data
lsblk -f
cat /etc/fstab

vim /etc/fstab

sudo mount -a
findmnt /srv/data
sudo reboot
findmnt /srv/data
```

Here is the commands and the output as I typed them in the shell, and I added the '"proof line" at the end for posterity.  
```
[ec2-user@ip-172-31-31-229 ~]$ ls -al /srv/data
total 0
drwxr-xr-x. 2 root root  6 Nov 20 13:14 .
drwxr-xr-x. 4 root root 35 Nov 20 13:14 ..
[ec2-user@ip-172-31-31-229 ~]$ findmnt /srv/data
[ec2-user@ip-172-31-31-229 ~]$ lsblk -f
NAME          FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
nvme0n1                                                                              
├─nvme0n1p1   xfs          /     c54fc015-74db-4bfb-8911-83c336aabf73    6.2G    21% /
├─nvme0n1p127                                                                    
└─nvme0n1p128 vfat   FAT16       320B-02C8                               8.7M    13% /boot/efi
nvme1n1       xfs                7be6f671-b58a-4071-b211-ab1b19006176                
[ec2-user@ip-172-31-31-229 ~]$ cat /etc/fstab

UUID=c54fc015-74db-4bfb-8911-83c336aabf73     /           xfs    defaults,noatime  1   1
UUID=320B-02C8        /boot/efi       vfat    defaults,noatime,uid=0,gid=0,umask=0077,shortname=winnt,x-systemd.automount 0 2
UUID=7be6f671-b58a-4071-b211-ab1b19006166 /srv/data xfs defaults,nofail 0 2 

[ec2-user@ip-172-31-31-229 ~]$ sudo vim /etc/fstab
[ec2-user@ip-172-31-31-229 ~]$ sudo mount -a
[ec2-user@ip-172-31-31-229 ~]$ findmnt /srv/data
TARGET    SOURCE       FSTYPE OPTIONS
/srv/data /dev/nvme1n1 xfs    rw,relatime,seclabel,inode64,logbufs=8,logbsize=32k,sunit=8,swidth=8,noquota
[ec2-user@ip-172-31-31-229 ~]$ sudo rebooot

Broadcast message from root@ip-172-31-31-229.ec2.internal on pts/1 (Sat 2026-11-21 15:35:09 UTC):

The system will reboot now!

[ec2-user@ip-172-31-31-229 ~]$ Read from remote host 54.144.124.199: Connection reset by peer
Connection to 54.144.124.199 closed.
client_loop: send disconnect: Broken pipe
Connection lost. Reconnecting (Ctrl-C to stop)...
ssh: connect to host 54.144.124.199 port 22: Connection refused
Connection lost. Reconnecting (Ctrl-C to stop)...
ssh: connect to host 54.144.124.199 port 22: Connection refused
Connection lost. Reconnecting (Ctrl-C to stop)...
ssh: connect to host 54.144.124.199 port 22: Connection refused
Connection lost. Reconnecting (Ctrl-C to stop)...
ssh: connect to host 54.144.124.199 port 22: Connection refused
Connection lost. Reconnecting (Ctrl-C to stop)...
** WARNING: connection is not using a post-quantum key exchange algorithm.
** This session may be vulnerable to "store now, decrypt later" attacks.
** The server may need to be upgraded. See https://openssh.com/pq.html

A newer release of "Amazon Linux" is available.
  Version 2023.12.20261112:
  Version 2023.12.20261117:
  Version 2023.12.20261118:
  Version 2023.12.20261119:
  Version 2023.12.20261120:
Run "/usr/bin/dnf check-release-update" for full release and version update info
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
Last login: Sat Nov 21 15:26:42 2026 from 179.64.127.32
[ec2-user@ip-172-31-31-229 ~]$ findmnt /srv/data
TARGET    SOURCE       FSTYPE OPTIONS
/srv/data /dev/nvme1n1 xfs    rw,relatime,seclabel,inode64,logbufs=8,logbsize=32k,sunit=8,swidth=8,noquota
[ec2-user@ip-172-31-31-229 ~]$ 
[ec2-user@ip-172-31-31-229 ~]$ id; hostname; date
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
ip-172-31-31-229.ec2.internal
Sat Nov 21 15:40:31 UTC 2026
[ec2-user@ip-172-31-31-229 ~]$ 
```

## Part 9. Explain in a short table what AWS secures and what you secure for these services.
| What AWS secures                                        | What I secure                                                                    |
| ------------------------------------------------------- | -------------------------------------------------------------------------------- |
| The physical data center and the hardware inside it.    | The files and data I store on my EBS volume.                                     |
| The hypervisor that runs my virtual servers.            | Operating system patches on my Windows and Linux servers.                        |
| The underlying AWS network infrastructure.              | My EC2 security group rules and host firewall rules.                             |
| The physical storage infrastructure that supports EBS.  | The SMB share and NTFS folder permissions that control access to my files.       |
| The infrastructure that keeps my EC2 instances running. | My nginx and IIS configurations, including what each web server makes available. |

## Part 10. Explain in writing one service result that works from your IP and one that fails from a blocked path, and which control caused each.

**Linux**
One service that worked was the SSH, one that was blocked was the HTTP.  In this case it was because we turned off access to the HTTP/80 service in the hosts firewall.

Refer to Part 6, in the Linux section.  It shows the removal of the HTTP service from the host firewall, and the outcome in a browser on my own computer.


**Windows**
So the same thing happened for the Windows example, port RDP worked but the HTTP was blocked.  The HTTP in this example was blocked using AWS's Security Groups though, and not on the Local Host.

Refer to Part 6, in the Windows section.  You can see that we removed the HTTP service from the AWS Security Group and the outcome of doing so in my computer's browser.

**Both Linux and Windows**
Think about it as having two firewalls, one inside of the other.  The first firewall you come across is AWS's EC2's "Security Groups", and then the host running inside EC2 has it's own "Host Firewall".  Both have to be set to "Allow" to allow whatever specific traffic for the connections to work. 

In our Linux example, we allowed HTTP traffic in from the Security Group but not in from the Host Firewall.  
In our Windows example, we removed the HTTP allow rule from the Security Group, but allowed it from the Host Firewall.
Both actions had the same overall outcome (blocked HTTP traffic), but the HTTP traffic to the Linux machine was blocked at the second layer (Host Firewall), and the HTTP traffic to the WIndows machine was blocked at the first layer (Security Group).

## Part 11. Add this work to your Playbook







## Part 11. Add this work to your Playbook

This milestone is a strong Playbook artifact because it shows an employer that you can deploy services and control exactly who can reach them, with layered cloud and host controls.

- Knowledge area: Connection Security (playbook/connection-security.md). It belongs here because the core of this milestone is controlling network access to services with security groups and host firewalls.
- Crosscutting concepts: Availability (services answer for the right people), Confidentiality (blocked paths), Adversarial Thinking (the denied tests), Responsible AI (your reviewed script).
- Title: Secured Web and File Services on Windows Server and Linux.

1. Open playbook/connection-security.md in your GitHub repository and select the pencil icon.
2. Copy the block from the Artifact Template page and paste it under Artifacts.
3. Fill in every field. Under Evidence, use two or three sanitized screenshots: one security group rule list, one allowed test and one denied test.
4. Sanitize first: crop out public IP addresses, instance IDs and your AWS account number.
5. Commit, open the live page, and copy its address into your Word file.













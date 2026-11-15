# m1_windows_baseline.ps1

# Create the role groups.
New-LocalGroup -Name "M1-Readers"
New-LocalGroup -Name "M1-Operators"

# Prompt for a test password without storing it in this script.
$pw = Read-Host -AsSecureString "Test password"

# Create the three test accounts.
New-LocalUser -Name "m1reader" -Password $pw
New-LocalUser -Name "m1operator" -Password $pw
New-LocalUser -Name "m1retired" -Password $pw

# Assign role-group memberships.
Add-LocalGroupMember -Group "M1-Readers" -Member "m1reader","m1operator"
Add-LocalGroupMember -Group "M1-Operators" -Member "m1operator"

# Add the test accounts to the built-in Users group.
Add-LocalGroupMember -Group "Users" -Member "m1reader","m1operator","m1retired"

# Disable the retired test account.
Disable-LocalUser -Name "m1retired"

# Create the Published and Working directories.
New-Item -ItemType Directory C:\CourseLab\Published, C:\CourseLab\Working

# Create a sample published file.
Set-Content C:\CourseLab\Published\notice.txt "Team notice"

# Remove inherited permissions and grant Published access.
icacls C:\CourseLab\Published\ /inheritance:r /grant "Administrators:(OI)(CI)F" "SYSTEM:(OI)(CI)F" "M1-Readers:(OI)(CI)RX"

# Remove inherited permissions and grant Working access.
icacls C:\CourseLab\Working\ /inheritance:r /grant "Administrators:(OI)(CI)F" "SYSTEM:(OI)(CI)F" "M1-Operators:(OI)(CI)M"

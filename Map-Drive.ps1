<#
This script is my latest Powershell script. As I've written more the overall formatting for me is much more organized.
I've got different tasks relegated as functions because functions are great. This script also uses Write-Verbose as it's a better practice instead of Write-Host.
This script was placed on all remote workings machines but I wanted to note that Windows does not natively let powershell scripts run.
What I did is self signed the script for all remote laptops and set the execution policy on said machines to "Signed"

This was to prevent any malicious scripts from running.
#>

Function Check-VPS{

Write-Verbose -Verbose "================================="
Write-Verbose -Verbose "Checking VPN Connection..."
Write-Verbose -Verbose "================================="

Start-Sleep -s 1

try{
$test = (nslookup org.com | Select-String Address | Where-Object LineNumber -eq 5).ToString().Split(' ')[-1]
}

catch{

Write-Verbose -Verbose ""
Write-Verbose -Verbose ""
Write-Verbose -Verbose ""
Write-Verbose -Verbose "==========================================================================="
Write-Verbose -Verbose "CONNECTION FAILED: You are not connected."
Write-Verbose -Verbose "Please double check the SonicWall NetExtender and launch the script again. "
Write-Verbose -Verbose "==========================================================================="
Write-Verbose -Verbose  ""
Write-Verbose -Verbose  ""
Start-Sleep -s 5
Write-Verbose -Verbose "Closing script..."
Start-Sleep -s 5
exit

}

if ($test -eq "serverip"){

Start-Sleep -s 1
Write-Verbose -Verbose "======================"
Write-Verbose -Verbose "Connection Successful!"
Write-Verbose -Verbose "======================"
#Start-Sleep -s 3

}
}

Function Connect-Drives{

Write-Verbose -Verbose "========================================="
Write-Verbose -Verbose "      Choose a Department Option.....    "
Write-Verbose -Verbose "========================================="
Write-Verbose -Verbose "       1. Dept1                          "
Write-Verbose -Verbose "       2. Dept2                          "
Write-Verbose -Verbose "       3. Dept3                          "
Write-Verbose -Verbose "       4. Dept4                          "
Write-Verbose -Verbose "       5. Dept5                          "
Write-Verbose -Verbose "       6. Dept6                          "
Write-Verbose -Verbose "       7. Dept7                          "
Write-Verbose -Verbose "========================================="

try{[uint16]$number = Read-Host "Choose the number based on your department (example: 1)"}
catch{ Write-Verbose -Verbose "ERROR: The value you entered is not a valid choice. Closing the script, please relaunch..." ;sleep -s 3; exit}

#Dept1 Option
if ($number -eq 1){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)
$ErrMsg = Write-Verbose -Verbose "Something went wrong while mapping your drives. Make sure you enter the correct username/password. If you still can't login, contact Patrick" ; sleep -s 5; exit

try{
net use * /delete /y
net use U: "\\server\dept1\share" /user:"$UDomain" $Pass
net use G: "\\server\dept1\groupshare" /user:$UDomain $Pass
}
catch{ 
$ErrMsg
}}

#Dept2 Option
elseif($number -eq 2){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\dept2\share" /user:"$UDomain" $Pass
net use G: "\\server\dept2\groupshare" /user:$UDomain $Pass
}
catch{
$ErrMsg
}}

#Dept3 Option
elseif($number -eq 3){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\dept3\share" /user:"$UDomain" $Pass
net use G: "\\server\dept4\groupshare" /user:$UDomain $Pass
}
catch{
$ErrMsg
}}

#Dept4
elseif($number -eq 4){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\dept4\share" /user:"$UDomain" $Pass
net use G: "\\server\dept4\groupshare" /user:$UDomain $Pass
}
catch{
$ErrMsg
}}

#Dept5
elseif($number -eq 5){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\Dept5\share" /user:"$UDomain" $Pass
}
catch{
$ErrMsg
}}

#Dept6 Option
elseif($number -eq 6){

Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\Dept6\share" /user:"$UDomain" $Pass
net use G: "\\server\Dept6\groupshare" /user:$UDomain $Pass
}
catch{
$ErrMsg
}}

#Dept7 Option
elseif($number -eq 7){
Write-Verbose -Verbose "Please input your credentials"
Write-Verbose -Verbose "Example user: org\user"
Write-Verbose -Verbose "Password is your computer login password."

$UDomain = Read-Host "Please enter your username" 
$Pass = Read-Host  "Please enter your password" 
$User = $UDomain.Substring(5)

try{
net use * /delete /y
net use U: "\\server\dept7\share" /user:"$UDomain" $Pass
}
catch{
$ErrMsg
}}
}

Check-VPS; Start-Sleep -s 2; Connect-Drives




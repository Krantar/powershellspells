<#
This was a script that I wrote before I had my Asset Management system setup. What I would do so that I wouldn't forget what changes I made was store text files of system changes in a dated file.
It would list anything I would change on the backend that might cause issues so I could reference it after the fact. 

Quick and very dirty but it's what I had when I started.

Sends contents of Daily Change folder

#>

$Changes = Get-ChildItem -Path 'C:\Users\admin\Daily System Changes' | select @{name='System Settings Change Date';e={$_.Name}} | Out-String

Send-MailMessage -from "info@org.com" -to "sysadmin@org.com" -Subject "Days Systems Settings Were Changed" -Body "$Changes" -SmtpServer ip
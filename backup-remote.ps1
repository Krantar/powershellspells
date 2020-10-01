<#
This script is used to back up my Remote office local file storage. It does a quick copy from a directory to my server. It is usually setup in Windows "Task Manager" and is run with the users credentials.
The network storage is segregated in a way that the area this copies to does not endager the rest of the organizations file structure with a combination of share and ntfs permissions. #>


<# Computer Name Variable#>

$CompName = $env:COMPUTERNAME

<# Email Variables #>

$from = 'info@org.com'
$to = 'sysadmin@org.com'
$subjectpass = 'Remote Backup Completed'
$subjectfail = 'Remote Backup Completed with Errors'

<#Email HTML Body#>

$bodyf = "The remote backup has completed."
$bodyf += "<p></p>"
$bodyf +="==============================="
$bodyf += "<h1>Error Output:</h1>"
$bodyf +="==============================="
$bodyf += "<p></p>"
$bodyf += $err | Select CategoryInfo

$bodyp = "The remote backup has completed."

<#All paths options edited outright for show-and-tell#>

<#Commands#>

copy-item -path filepath -destination server -recurse -force -ErrorVariable err


if($Err.Count -ge 1){

Send-MailMessage -from $from -to $to -Subject $subjectfail -Body $bodyf -BodyAsHtml -SmtpServer ip

}
else{

Send-MailMessage -from $from -to $to -Subject $subjectpass -Body $bodyp -BodyAsHtml -SmtpServer ip

}
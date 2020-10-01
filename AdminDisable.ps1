<#
Used to disable local admin accounts based on expected accounts configured on the server whether by imaging or manual configuration

I used this script to help an intern at the time verify that he local admin of the machine was disabled and a newly created GPO admin was setup. This was part of an RBAC project we completed to better secure AD credentials.
#>




param(
    [string]$Name
)

#change admin to pcadmin when done testing
$LocalAdmin = get-localuser -Name $Name | where -property Name -eq "$Name"

#If statement to disable account if the Name property is $true

if($LocalAdmin.Enabled -eq $True){

Disable-LocalUser -Name 'pcadmin'

Write-Host 
'=============================='
"'$LocalAdmin' has been disabled. Verify 'Disabled' status below"
'=============================='

}

else{

write-host "
========================================================================
$LocalAdmin does not exist or is disabled. Verify 'Disabled' status below
========================================================================"
}

#After if/else statement runs, check local users status
Get-LocalUser | select 'Name','Enabled'



<#
Removes Veeam backups older than 4 days
#>

Get-ChildItem -Path "D:\Veeam Backups" -Recurse -File | Where CreationTime -lt  (Get-Date).AddDays(-7)  | Remove-Item -Force

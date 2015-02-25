[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

ForEach ($FolderItem in $FolderFile.Folders.Folder)
{
    #New-ADGroup Variables
    $ADGroupName = $FolderItem + ' Document Shared Folder Administrators'
    $ADGroupSAMAccountName = $FolderItem + 'DocsAdmins'
    $ADGroupDisplayName = $FolderItem + ' Document Shared Folder Administrators'
    $ADGroupDescription = 'Members of this group are ' + $FolderItem + ' Document Shared Folder Administrators'

    New-ADGroup -Name  $ADGroupName -SamAccountName $ADGroupSAMAccountName -GroupCategory Security -GroupScope Global -DisplayName $ADGroupDisplayName -Path "OU=SharedFolders,DC=Domain,DC=Local" -Description $ADGroupDescription -Verbose
}
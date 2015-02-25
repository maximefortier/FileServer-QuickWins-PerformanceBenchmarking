$MemberList = 'SampleUser'
[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

ForEach ($FolderItem in $FolderFile.Folders.Folder)
{
    #New-ADGroup Variables
    $ADGroupSAMAccountName = $FolderItem + 'DocsAdmins'
    Add-ADGroupMember $ADGroupSAMAccountName $MemberList -Verbose
}
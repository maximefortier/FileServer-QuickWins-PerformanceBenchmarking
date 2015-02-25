[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

ForEach ($FolderItem in $FolderFile.Folders.Folder)
{
    $ADGroupSAMAccountName = $FolderItem + 'DocsAdmins'

    Remove-ADGroup $ADGroupSAMAccountName
}
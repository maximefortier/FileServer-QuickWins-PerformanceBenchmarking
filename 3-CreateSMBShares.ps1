$RootFoldername = "D:\SharedFolders"
[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

ForEach ($FolderItem in $FolderFile.Folders.Folder)
{
    #New-ADGroup Variables
    $ADGroupSAMAccountName = $FolderItem + 'DocsAdmins'

    #New-SmbShare Variables
    $SmbName = $FolderItem + 'Documents'
    $SmbPath = $RootFoldername + '\' + $FolderItem + 'Documents'
    $SmbFullAccess = 'Domain\' + $ADGroupSAMAccountName
    $SmbDescription =  'This shared folder contains ' + $FolderItem + ' documents'

    New-SmbShare –Name $SmbName –Path $SmbPath -FullAccess $SmbFullAccess -Description $SmbDescription -Verbose | ft -AutoSize

}
$RootFoldername = "D:\SharedFolders"
[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

ForEach ($FolderItem in $FolderFile.Folders.Folder)
{
    $SmbName = $FolderItem + 'Documents'

    Remove-SmbShare -Name $SmbName
}
$RootFoldername = "D:\SharedFolders"
[xml]$FolderFile = Get-Content "C:\Scripts\Folders.xml"

foreach ($FolderItem in $FolderFile.Folders.Folder)
{
    $NewFolder = $RootFoldername + '\' + $FolderItem + 'Documents'
    New-Item -ItemType directory -Path $NewFolder -Verbose
}
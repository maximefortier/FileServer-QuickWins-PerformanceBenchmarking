$Foldername = "D:\SharedFolders"
If ((Test-Path $Foldername)) 
{
	Remove-Item $Foldername -Force
}

$RandomText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt, leo quis dapibus cursus, ex augue tempus dolor, non posuere nisl nisl id quam. Donec quis elit ante. In finibus felis nunc, sed ornare tortor egestas ac. In viverra in leo quis ultrices. Nunc et vestibulum mauris. Ut interdum orci vel tortor iaculis semper. Cras auctor lobortis erat, in faucibus orci pulvinar ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer tempus in purus ac malesuada. Etiam quam tortor, lacinia lobortis sem ac, tristique faucibus eros. Fusce scelerisque magna a mauris tempor, quis molestie justo semper. Donec sollicitudin arcu facilisis massa auctor, nec sagittis nisi convallis."
$DestinationFolder = '\\FILESSERVERA\ClassifiedDocuments\'
$RemoteFolderToDelete = $DestinationFolder + 'Temp'

New-Item "C:\Temp" -Type Directory

$File = "C:\Temp\DummyFile1.txt"
$Stream = [System.IO.StreamWriter] $File
$NumberOfLines = 150000
$NumberOfFileCopies = 10

1..$NumberOfLines | % {
      $Stream.WriteLine($RandomText)
}
$Stream.close()
If($NumberOfFileCopies -gt 1)
{
    while($i -ne $NumberOfFileCopies)
     {
        $i++
        $DestinationFile = $File + $i
        Copy-Item $File $DestinationFile
        
     }
}
$sw = [Diagnostics.Stopwatch]::StartNew()
Copy-Item 'C:\Temp' $DestinationFolder -Recurse
$sw.Stop()

Remove-Item 'C:\Temp' -Recurse -Force
Write-Host 'Upload from' $env:computername  'to' $DestinationFolder
Write-Host 'Upload Tx time'
Write-Host $sw.Elapsed


New-Item "C:\TempReturned" -Type Directory
$sw2 = [Diagnostics.Stopwatch]::StartNew()
Copy-Item $RemoteFolderToDelete 'C:\TempReturned\' -Recurse
$sw2.Stop()
Write-Host 'Download from' $DestinationFolder  'to' $env:computername
Write-Host 'Download Tx time'
Write-Host $sw2.Elapsed

Remove-Item 'C:\TempReturned' -Recurse -Force

Remove-Item $RemoteFolderToDelete -Recurse -Force
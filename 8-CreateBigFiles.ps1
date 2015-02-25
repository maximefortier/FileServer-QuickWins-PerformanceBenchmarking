$RandomText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt, leo quis dapibus cursus, ex augue tempus dolor, non posuere nisl nisl id quam. Donec quis elit ante. In finibus felis nunc, sed ornare tortor egestas ac. In viverra in leo quis ultrices. Nunc et vestibulum mauris. Ut interdum orci vel tortor iaculis semper. Cras auctor lobortis erat, in faucibus orci pulvinar ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer tempus in purus ac malesuada. Etiam quam tortor, lacinia lobortis sem ac, tristique faucibus eros. Fusce scelerisque magna a mauris tempor, quis molestie justo semper. Donec sollicitudin arcu facilisis massa auctor, nec sagittis nisi convallis."
$File = "\\FILESSERVERB\ClassifiedDocuments\DummyFile1.txt"
$Stream = [System.IO.StreamWriter] $File
$NumberOfLines = 150000
$NumberOfFileCopies = 10
$sw = [Diagnostics.Stopwatch]::StartNew()
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
$sw.Stop()
Write-Host $sw.Elapsed
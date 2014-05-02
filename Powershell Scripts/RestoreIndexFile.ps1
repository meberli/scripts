#iterate over all filenames in directory
foreach($fileName in Get-ChildItem .\tmp1 -name) 
{ 
    Write-Host "processing file $fileName ... "
    
    #read first lines until keyword from file 1 and write them to output file
    $linenumber = (Select-String ".\tmp1\$fileName" -pattern "\[KEYS\]").LineNumber
    Write-Host "line number in file 1: $linenumber"
    (Get-Content ".\tmp1\$fileName")[0 .. ($linenumber-1)] | Add-Content ".\tmp3\$fileName"
    
    
    #read lines from file 2, starting from keyword and write them to output file     
    $linenumber = (Select-String ".\tmp2\$fileName" -pattern "\[KEYS\]").LineNumber
    Write-Host "line number in file 2: $linenumber"
    (Get-Content ".\tmp2\$fileName")[$linenumber .. 999] | Add-Content ".\tmp3\$fileName"
}         



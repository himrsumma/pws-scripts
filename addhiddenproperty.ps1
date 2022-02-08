#bestanden en directory's in de home folder die starten met een . verbergen


$files = Get-ChildItem -path $home -Filter ".*" -Attributes !Directory

$fattribute = [io.fileattributes]::Hidden


foreach ($f in $files){
  If ((Get-ItemProperty -Path $f.fullname).Attributes -band $fattribute){
        write-output $f.fullname "is hidden"
        }
    else{
        write-output "not hidden, setting hidden property"
        Set-ItemProperty -Path $f.fullname -Name attributes -Value ((Get-ItemProperty $f.fullname).Attributes -BXOR $fattribute)
        
        write-output "New value of $f attributes"

        (Get-ItemProperty -Path $f.fullname).attributes
    }
        

}

<#
$dirs = Get-ChildItem -path $home -Filter ".*" -Attributes Directory
$dattribute = [io.fileattributes]::Hidden

foreach ($d in $dirs){
    If ((Get-ItemProperty -Path $d.name).Attributes -band $dattribute){
          write-output $d.fullname "is hidden"
          }
      else{
          write-output "not hidden, setting hidden property"
          #Set-ItemProperty -Path $d.fullname -Name attributes -Value ((Get-ItemProperty $d.fullname).Attributes -BXOR $dattribute)
           
          write-output "New value of $d attributes"
  
          (Get-ItemProperty -Path $d.fullname).attributes
      }
          
  
  }
#>


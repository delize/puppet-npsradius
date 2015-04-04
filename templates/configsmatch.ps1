#$ErrorActionPreference = "Stop";

#Set-StrictMode -Version Latest;

function ExportNPSConfig
{
  Param
  (
    [string] $path
  )
  Write-Host "Exporting config to $path";
  Export-NpsConfiguration -Path $path;
}

function FilesMatch
{
  # Compares two file hashes and returns true if they are the same
  Param
  (
    [string] $refFile,
    [string] $compFile
  )

  $returnval =  ((Get-FileHash -Path $refFile -Algorithm MD5) -eq (Get-FileHash -Path $compFile -Algorithm MD5));
  Write-Host "Return value: $returnval";
  return $returnval;
}

try
{
ExportNPSConfig -path "<%= scope['npsradius::exportfile'] %>";

Write-Host "Returned from Exporting config";

Write-Host "Testing <%= scope['npsradius::configfile'] %> against <%= scope['npsradius::exportfile'] %>"
$res = (FilesMatch -refFile "<%= scope['npsradius::configfile'] %>" -compFile "<%= scope['npsradius::exportfile'] %>");

Write-Host "Result = $res";

Write-Host "After result";


  if ($res)
  {
    Write-Host "Configurations match, no changes required";
    exit 0;
  }
  else
  {
    Write-Host "Configurations do not match, update required";
    exit 1;
  }
}
catch
{
    Write-Host "Exception occured: $_";
    exit 0;
}
finally
{
  Write-Host "finally block reached";
  exit 0;

}

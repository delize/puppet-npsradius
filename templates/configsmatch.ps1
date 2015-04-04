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


ExportNPSConfig -path "<%= scope['npsradius::exportfile'] %>";

Write-Host "Testing <%= scope['npsradius::configfile'] %> against <%= scope['npsradius::exportfile'] %>"
$res = (FilesMatch -refFile "<%= scope['npsradius::configfile'] %>" -compFile "<%= scope['npsradius::exportfile'] %>");


if ($res) { exit 0; } else { exit 1; }

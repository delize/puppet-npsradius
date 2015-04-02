$ErrorActionPreference = "Stop";

Set-StrictMode -Version Latest;

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

  return ((Get-FileHash -Path $refFile -Algorithm MD5) -eq (Get-FileHash -Path $compFile -Algorithm MD5));
}

ExportNPSConfig -path "<%= scope['npsradius::exportfile'] %>";

if (FilesMatch -refFile "<%= scope['npsradius::configfile'] %>" -compFile "<%= scope['npsradius::exportfile'] %>")
{
  exit 0;
}
else
{
  exit 1;
}

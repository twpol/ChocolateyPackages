$ErrorActionPreference = 'Stop';

$packageName= 'xna31'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/5/9/1/5912526C-B950-4662-99B6-119A83E60E5C/xnafx31_redist.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Microsoft XNA Framework Redistributable 3.1'
  checksum      = 'bdd33b677c9576a63ff2a6f65e12c0563cc116e6'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs

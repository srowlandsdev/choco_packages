$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ark-vcs.com/versions/Ark-Vcs-0_6_5.zip'
$version = '0.6.5'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ark-vcs*'
  checksum      = 'A55E49D12F1620A18F1F535A92F65805D436668FB2340A51575C44D83CBF9531'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyZipPackage @packageArgs
$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ark-vcs.com/versions/Ark-Vcs-0_6_3.zip'
$version = '0.6.3'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ark-vcs*'
  checksum      = '8CCE1C15C2CE62CC6E09D4DD9C3EF4ED6F97DAA2D8AE4B5BEE1C09EAABC260CE'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyZipPackage @packageArgs
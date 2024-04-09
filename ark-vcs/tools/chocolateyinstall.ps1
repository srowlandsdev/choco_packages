$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ark-vcs.com/versions/Ark-Vcs-0_6_2.zip'
$version = '0.6.2'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ark-vcs*'
  checksum      = '301CBD37F59BC06FD06B098A457E86E39737F68A48F07413517DBED60015B3AC'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyZipPackage @packageArgs
$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ark-vcs.com/versions/Ark-Vcs-0_7_2.zip'
$version = '0.7.2'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ark-vcs*'
  checksum      = 'F0864E6055C2F476C2F5378A9AA577687EADE13443E0CFB875D5B29843338D1A'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyZipPackage @packageArgs
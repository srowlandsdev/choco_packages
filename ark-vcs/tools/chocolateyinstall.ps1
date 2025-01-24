$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ark-vcs.com/versions/Ark-Vcs_0_9_10_win.zip'
$version = '0.9.10'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ark-vcs*'
  checksum      = 'AF077FB016380F909A399732752AF22CFEB6075EEADD552AF2F78D2688177A1D'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyZipPackage @packageArgs
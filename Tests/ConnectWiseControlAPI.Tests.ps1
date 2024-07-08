$ModuleName = 'ConnectWiser'
$Verbose = @{}
if ($env:APPVEYOR_REPO_BRANCH -and $env:APPVEYOR_REPO_BRANCH -notlike "master") {
  $Verbose.add("Verbose", $True)
}

$PSVersion = $PSVersionTable.PSVersion.Major
Import-Module $PSScriptRoot\..\ConnectWiser\$($ModuleName).psm1 -Force

#Integration test example
Describe "Basic Pester Tests for PS version $PSVersion" {
  It 'Do you need to write tests?' {
    $true | Should -Be $true
  }
}

<h1 align="center">
  <br>
  <img src=".\Media\control-horiz-master.webp" alt="logo" width = 75% ></a>
  <br>
  ConnectWise Control API
  <br>
</h1>

<h4 align="center">

This is a PowerShell wrapper for ConnectWise Control, based on the ConnectWiseControlAPI written by Chris Taylor.

</h4>

<div align="center">

</div>
<p align="center">
    <a href="ConnectWiser_Functions.md">List of Functions</a> •
    <a href="./Examples">Examples</a>
</p>

<!-- Summary -->

This module makes it easy to leverage PowerShell to automate tasks in Control.

<!-- Summary -->

## [Install](https://www.powershellgallery.com/packages/ConnectWiser)
The module can be easily installed from the [PowerShellGallery](https://www.powershellgallery.com/packages/ConnectWiser)

```powershell
Install-Module ConnectWiser
```

## Requirements
* Requires your Control server to use https.

## Quickstart
You can begin using ConnectWiser in less than 2 minutes without any hacks that make you question your security mind:

```posh
Install-Module ConnectWiser
Connect-CWC -Server contoso.screenconnect.com -Credentials (Get-Credential)
Get-CWCSession -Type Access -Limit 1
```

## Contributing
To contribute or build the module yourself, clone the repo and run Invoke-Build. Then look at the repo issues, roadmap, or PRs to figure out how you can help.

## Roadmap
Things that I want to do:

* ~~Allow OTP at invocation (remove the need for interactive prompt)~~ (via: [77e9ee](https://github.com/Szeraax/ConnectWiser/commit/77e9ee31e9829f5e1af3f9102c00c55bf1ee73e0))
* ~~Support "Trust this device for 7 days" feature~~ (via: [4b2c03](https://github.com/Szeraax/ConnectWiser/commit/4b2c030157f138534adcf65c8e448e8cbb37ff13))
* ~~Make Connect-CWC reuse WebSession~~ (via: [4e3bb0](https://github.com/Szeraax/ConnectWiser/commit/4e3bb078bc9caf75faaf20eed159abe841e5d703))
* ~~Export/Import WebSession out of the module so that you can reuse the session across powershell windows (reduce MFA prompting)~~ (via: [b6b1bb](https://github.com/Szeraax/ConnectWiser/commit/b6b1bb05c531a26e01b9991028b48aaeb4d0a089))
* Complete help docs so that Invoke-Build doesn't yell
* Merge CWCServerConnection and CwOption into 1 single object
* Change all noun prefixes from `CWC` to `Cw`

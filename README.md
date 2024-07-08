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

## Roadmap

Things that I want to do:

* Allow OTP at invocation (remove the need for interactive prompt)
* Support "Trust this device for 7 days" feature
* Make Connect-CWC reuse WebSession
* Export/Import WebSession out of the module so that you can reuse the session across powershell windows (reduce MFA prompting)

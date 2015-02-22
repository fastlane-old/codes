<h3 align="center">
  <a href="https://github.com/KrauseFx/fastlane">
    <img src="assets/fastlane.png" width="150" />
    <br />
    fastlane
  </a>
</h3>
<p align="center">
  <a href="https://github.com/KrauseFx/deliver">deliver</a> &bull; 
  <a href="https://github.com/KrauseFx/snapshot">snapshot</a> &bull; 
  <a href="https://github.com/KrauseFx/frameit">frameit</a> &bull; 
  <a href="https://github.com/KrauseFx/pem">PEM</a> &bull; 
  <a href="https://github.com/KrauseFx/sigh">sigh</a> &bull; 
  <a href="https://github.com/KrauseFx/produce">produce</a> &bull;
  <a href="https://github.com/KrauseFx/cert">cert</a> &bull;
  <b>codes</b>
</p>
-------

<p align="center">
    <img src="assets/codes.png">
</p>

codes
============

[![Twitter: @KauseFx](https://img.shields.io/badge/contact-@KrauseFx-blue.svg?style=flat)](https://twitter.com/KrauseFx)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/KrauseFx/cert/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/codes.svg?style=flat)](http://rubygems.org/gems/codes)

###### Create promo codes for iOS Apps using the command line
or
###### Automatically lose money by giving away your app for free...


##### This tool was sponsored by [Max Bäumle](http://maxbaeumle.com) and [Textastic Code Editor](http://www.textasticapp.com)

Get in contact with the developers of `codes` on Twitter: [@KrauseFx](https://twitter.com/KrauseFx), [@acrooow](https://twitter.com/acrooow)

-------
<p align="center">
    <a href="#installation">Installation</a> &bull; 
    <a href="#why">Why?</a> &bull; 
    <a href="#usage">Usage</a> &bull; 
    <a href="#tips">Tips</a> &bull; 
    <a href="#considerations">Considerations</a> &bull; 
    <a href="#need-help">Need help?</a>
</p>

-------

<h5 align="center"><code>codes</code> is part of <a href="http://fastlane.tools">fastlane</a>: connect all deployment tools into one streamlined workflow.</h5>



# Installation
    sudo gem install codes

# Why?

`codes` can help you automate sending promo codes to journalists and create promo codes for tons of apps with the press of a button.

# Usage

    code [num] [-a app_identifier] [-u user_name] [-i app_id] [-o output_file]

All parameters are optional.

`code` will print out the promo codes and store them in a file called `codes_[your app identifier].txt` in the current directory by default.

Example:

    code 3 -a com.example.myApp

Will generate 3 promo codes for the the App with the Bundle Identifier `com.example.myApp`. 

If you don't pass any paramaters, `code` will generate a single promo code and print it on the command line.

##### [Like this tool? Be the first to know about updates and new fastlane tools](https://tinyletter.com/krausefx)

## Environment Variables
In case you prefer environment variables:

- ```CODES_USERNAME``` (Your iTunes Connect username)
- ```CODES_APP_IDENTIFIER``` (Your App's Bundle ID)
- ```CODES_APP_ID```(Your App's internal iTunes Connect App ID)

# Tips

## [`fastlane`](http://fastlane.tools) Toolchain

- [`fastlane`](http://fastlane.tools): Connect all deployment tools into one streamlined workflow
- [`deliver`](https://github.com/KrauseFx/deliver): Upload screenshots, metadata and your app to the App Store using a single command
- [`snapshot`](https://github.com/KrauseFx/snapshot): Automate taking localized screenshots of your iOS app on every device
- [`frameit`](https://github.com/KrauseFx/frameit): Quickly put your screenshots into the right device frames
- [`PEM`](https://github.com/KrauseFx/pem): Automatically generate and renew your push notification profiles
- [`sigh`](https://github.com/KrauseFx/sigh): Because you would rather spend your time building stuff than fighting provisioning
- [`produce`](https://github.com/KrauseFx/produce): Create new iOS apps on iTunes Connect and Dev Portal using the command line
- [`cert`](https://github.com/KrauseFx/cert): Create new iOS signing certificates

##### [Like this tool? Be the first to know about updates and new fastlane tools](https://tinyletter.com/krausefx)

# Considerations
As part of the process of downloading promo codes from iTunes Connect, the user would normally have to accept a contract every single time. Since there is no way to check with iTunes if this contract was accepted manually before, `codes` agrees to this contract automatically. Before using `codes` for the first time, we advise you to go to iTunes Connect and go through the process of creating promo codes manually at least once and to read the contract when it comes up.

# Need help?
- If there is a technical problem with ```codes```, submit an issue.
- I'm available for contract work - drop me an email: codes@krausefx.com

# License
This project is licensed under the terms of the MIT license. See the LICENSE file.

# Contributing

1. Create an issue to discuss about your idea
2. Fork it (https://github.com/KrauseFx/codes/fork)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

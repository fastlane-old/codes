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

codes - Download promo codes from iTunes Connect
============

[![Twitter: @KauseFx](https://img.shields.io/badge/contact-@KrauseFx-blue.svg?style=flat)](https://twitter.com/KrauseFx)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/KrauseFx/cert/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/codes.svg?style=flat)](http://rubygems.org/gems/codes)

###### Automagically generate new Promo codes for your Apps

##### This tool was sponsored by Max Bäumle and Alexander Blach

Get in contact with the developer on Twitter: [@KrauseFx](https://twitter.com/KrauseFx)

-------
<p align="center">
    <a href="#installation">Installation</a> &bull; 
    <a href="#why">Why?</a> &bull; 
    <a href="#usage">Usage</a> &bull; 
    <a href="#tips">Tips</a> &bull; 
    <a href="#need-help">Need help?</a>
</p>

-------

<h5 align="center"><code>codes</code> is part of <a href="http://fastlane.tools">fastlane</a>: connect all deployment tools into one streamlined workflow.</h5>



# Installation
    sudo gem install codes

# Why?

This tool is aimed as a working replacement for the itc.cli promo codes functionality. 
`codes` can help you automate sending promo codes to journalists, create promo codes for tons of apps with the press of a button, and much more!

# Usage

    code [num] [-a app_identifier] [-u user_name] [-i app_id]

e.g. 

    code 3 -a com.example.myApp

Will generate 3 promo codes for the the App with the Bundle Identifier "com.example.myApp". 
By default, if you don't specify any other options, `code` will generate a single promo code and print it on the command line.


## Environment Variables
In case you prefer environment variables:

- ```CODES_USERNAME``` - Your iTunes Connect username
- ```CODES_APP_IDENTIFIER``` - Your App's Bundle ID
- ```CODES_APPLE_ID```- Your App's internal iTunes Connect ID

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

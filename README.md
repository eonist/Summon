![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-watchOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift-orange.svg) 

# **Summon** 

<img width="234" alt="img" src="https://rawgit.com/stylekit/img/master/summon_logo.svg">

### **What is it**:
Summon is an Apple-watch app that let's a person summon another person to an exact location within a building. 

### **How does it work**: 
- Bluetooth near-field detection exchange (UUID) between two watches
- CloudKit sends Notification to the summoned user (UUID)
- Altimeter detect stair flight change and altitude (Z)
- GPS detect X/Y long/lat coordinates
- Building and Room data is provided through a BIM service API
- Through a Basic UI, the Summoned user are guided to the summoner
- Subtle vibrations let's both users know about progression


### **UX-flow**:

<img width="682" alt="img" src="https://rawgit.com/stylekit/img/master/summon_deck_dark_4.png">  

### **How to get it**: 
[App store (coming soon)](https://www.google.com/comingsoon) 

### **Research**:
- In-depth Apple-watch CoreBluetooth tutorial: https://www.raywenderlich.com/336-core-bluetooth-in-watchos-tutorial
- Detecting BT signal strength: https://stackoverflow.com/questions/33394740/watch-os-2-is-it-possible-to-get-bluetooth-signal-strength-of-connectivity-betw
- Notifications via CloudKit: https://www.hackingwithswift.com/read/33/8/delivering-notifications-with-cloudkit-push-messages-ckquerysubscription
- Floor level in a building: https://developer.apple.com/documentation/corelocation/cllocation/1616762-floor
- Altitude: https://developer.apple.com/documentation/corelocation/cllocation/1423820-altitude
- GPS long/lat: https://github.com/eonist/WeatherApp/blob/master/Weather/lib/LocManager.swift
- CURL API to BIM services:  http://bim-web.jotne.com/docs/api/  and https://home.bimsync.com/api  (The former requires no registration 👌)

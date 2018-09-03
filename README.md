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
- Through a Basic UI, the Summoned user is guided to the summoner
- Subtle vibrations let's both users know about progression 


### **UX-flow**:

<img width="682" alt="img" src="https://rawgit.com/stylekit/img/master/summon_deck_dark_5.png">  

### **How to get it**: 
[App store (coming soon)](https://www.google.com/comingsoon) 

### Q & A:

**Q:** How do you do room detection and routing?  
**A:** BIM service API. Basically it's the worldwide industry standard for getting building data. You can ask the service for building name and room name for your lat/long/alt. You can also get boundary box, room centre etc. To calc entering and exiting rooms. GPS inside buildings are sometimes difficult, but more and more buildings are adding GPS repeaters. And apples CoreLocation relies on GPS, CellTower, wifi so should be fine for simple stuff. Routing is going to be really simple. `if same building`: 1. go to correct floor 2. go to correct room. `else if in other building`: 1. Go to street-level 2. Go to building entrance. 3. go to correct floor. 4. Go to correct room

### Use-cases:
- Airport: Airports are expanding beyond their initial design and thus become complicated to navigate. 
- Hospitals: Your wife is expecting and you rush to make it to the birth of your first-born.
- Construction sites: Navigate construction sites while looking on a phone can be dangerouse. 
- Office buildings: Your going to a meeting somewhere in a new building you have never been to.
- Shopping malls: Your husband gets lost while looking for the perfect pair of jeans.
- Concert arenas: Your trying to find your friends after going to the toilet.
- Guiding humans with vision disabilities to their destinations through subtle vibrations on the rist

### **Research**:
- In-depth Apple-watch CoreBluetooth tutorial: https://www.raywenderlich.com/336-core-bluetooth-in-watchos-tutorial
- Detecting BT signal strength: https://stackoverflow.com/questions/33394740/watch-os-2-is-it-possible-to-get-bluetooth-signal-strength-of-connectivity-betw
- Notifications via CloudKit: https://www.hackingwithswift.com/read/33/8/delivering-notifications-with-cloudkit-push-messages-ckquerysubscription
- Floor level in a building: https://developer.apple.com/documentation/corelocation/cllocation/1616762-floor
- Altitude: https://developer.apple.com/documentation/corelocation/cllocation/1423820-altitude
- GPS long/lat: https://github.com/eonist/WeatherApp/blob/master/Weather/lib/LocManager.swift
- CURL API to BIM services:  http://bim-web.jotne.com/docs/api/  and https://home.bimsync.com/api  (The former requires no registration 👌)

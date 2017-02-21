# headphone-bluetooth-spotify
This is a small mac agent application that runs in background. It is my attempt to fix the broken bluetooth headphone controls disptacher. I bought a Plantronics BackBeat Pro and they are awesome, but I could not control my Spotify mac client using them. 
So when the application is running it will listen any bluetooth headphones events and dispatch it to spotify.
I decided to support the most important events such as: play/pause track and the controls to go for the next and previous track. 
#Installation
<a href="https://github.com/dayvson/headphone-bluetooth-spotify/raw/master/dist/HeadphoneBluetoothSpotify.zip">Download</a> the zip extract it and move the .app file to your application folder.
I also recommend you to add the application to login items so you do not need to open it everytime.


#Play Button iTunes patch
This is a <a href="https://github.com/thebitguru/play-button-itunes-patch">patch for removing the default OS X behavior of always starting iTunes when the play button on the keyboard is pressed</a>. 

##Hacking Spotify Client (the latest version of Spotify does not provide a script bridge, do this until Spotify fix it):
1. Go to /Applications/Spotify.app/Contents and open the Info.plist file in a text editor.
2. Scroll down to the bottom of the file.
3. Change the string "Spotify.sdef" to "applescript/Spotify.sdef" and save the file.
4. Open spotify

#Preview
<img src="https://raw.githubusercontent.com/dayvson/headphone-bluetooth-spotify/master/app-screenshot.png" />




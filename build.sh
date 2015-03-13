#!/bin/bash

xcodebuild -project HeadphoneBluetoothSpotify.xcodeproj

mkdir dist

cd build/Release

zip -r HeadphoneBluetoothSpotify.zip HeadphoneBluetoothSpotify.app

mv HeadphoneBluetoothSpotify.zip ../../dist
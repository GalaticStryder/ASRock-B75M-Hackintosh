#!/bin/bash
#
# This script will clean all the bad assigned values in your apple services cache.
# It's important to run it as root because those files are hidden and read-only for users.
#

cd /Users/galatic/Library/Caches/
# Change from galatic to your name!

echo "Deleting Apple caches for iMessage related services..."
sudo rm -rf com.apple.iCloudHelper*
sudo rm -rf com.apple.Messages*
sudo rm -rf com.apple.imfoundation.IMRemoteURLConnectionAgent*
echo "Deleted Apple caches."

cd /Users/galatic/Library/Preferences/
# Change from galatic to your name as well.

echo "Deleting Apple preferences for iMessage related services..."
sudo rm -rf com.apple.iChat.*
sudo rm -rf com.apple.icloud.*
sudo rm -rf com.apple.imagent.*
sudo rm -rf com.apple.imessage.*
sudo rm -rf com.apple.imservice.*
sudo rm -rf com.apple.ids.service*
sudo rm -rf com.apple.identityserviced*
sudo rm -rf com.apple.security.*
echo "Deleted Apple preferences."

echo ''

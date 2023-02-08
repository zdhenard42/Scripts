@echo off
color 0F
mkdir "%userprofile%\Documents\Bookmark_Backup"


echo Backing up %username%'s Edge Bookmarks...
:: Bookmarks on edge
mkdir "%userprofile%\Documents\Bookmark_Backup\%username%_Edge_Bookmarks\"
xcopy "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks*" "%userprofile%\Documents\Bookmark_Backup\%username%_EDGE_BOOKMARKS\" /C /H /R /K /Y > nul
echo Done!
 
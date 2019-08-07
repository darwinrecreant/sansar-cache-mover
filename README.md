# Sansar Cache Mover

Move the sansar cache to another folder or drive.

This windows script will set a new location to store Sansar cache that is normally located under AppData\Local\LindenLab. The cache can bloat above 30 GB which can consume precious space on the system drive, this script is meant to solve that problem.

1. Download `sansar-cache-mover.bat` from this repository
2. Create a folder where ever you want the new location to be, can be differnt drive as well
3. Double click `sansar-cache-mover.bat`
4. Follow the instructions and paste the path of the new folder when it asks you.

The script will delete your existing sansar cache. If you do not want it to be deleted, then copy the contents of the old cache folder to your new folder before running this script.

If you want to use the old folder location again, go back to AppData\Local and delete `LindenLab` folder link (it will have a shortuct icon on it). Next time Sansar is opened it will create a new cache folder in the old place.

This script basically creates a symbolic link where Sansar expects the folder to be. This is a common method to redirect folder locations in windows, and within AppData\Local windows already has some symbolic folders in place (noticeable by the shortcut icon on them).

It is not recommended to move the entire AppData folder using symbolic links because some programs may not be expecting this behavior, but Sansar's folder alone handles this linking fine.
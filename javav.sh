# Switch Java Version on Mac
# Switch JDK version on development machine when multiple JDKs are installed

#!/bin/bash
 
echo
echo "Active version information"
echo "-------------------------"
java -version
echo "-------------------------"
echo
 
library=/Library/Java/JavaVirtualMachines
cd $library
 
echo "Select Java version"
select opt in */;
 
do
    test -n "$opt" && break;
        echo ">> Invalid Selection $REPLY";
done
 
echo
echo "Disabling Java version..."
for d in */ ; do
    if test -f "${library}/${d}Contents/Info.plist"; then
       echo ${d}   
       mv ${library}/${d}Contents/Info.plist ${library}/${d}Contents/Info.plist.disabled
    fi
done
 
echo
echo "Enabling [$REPLY] $opt"
 
mv $library/$opt/Contents/Info.plist.disabled $library/$opt/Contents/Info.plist
 
echo
echo "Active versio information"
echo "-------------------------"
java -version
echo "-------------------------"

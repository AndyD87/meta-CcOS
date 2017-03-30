# top level directory of your yocto project
POKYROOTDIR=$PWD/../..

echo "Images:"
for i in `ls $POKYROOTDIR/meta*/recipes-*/images/*.bb 2>/dev/null`;do
    i=`basename $i`;i=`echo $i |sed -e 's,^\(.*\)\.bb,\1,'`
    echo "    $i";
done

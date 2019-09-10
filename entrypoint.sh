#!/bin/bash

mkdir -p ~/.sbt/1.0/plugins/

touch ~/.sbt/1.0/sonatype.sbt
cat /dev/null > ~/.sbt/1.0/sonatype.sbt
{
  echo 'credentials += Credentials("Sonatype Nexus Repository Manager",';
  echo '        "oss.sonatype.org",';
  echo '        "'"$NEXUS_USER"'",'
  echo '        "'"$NEXUS_PASSWORD"'")'
} >> ~/.sbt/1.0/sonatype.sbt
sha1sum ~/.sbt/1.0/sonatype.sbt

touch ~/.private.key
cat /dev/null > ~/.private.key
echo -e "$GPG_PK" > ~/.private.key
gpg --import --batch ~/.private.key
rm -rf ~/.private.key

touch ~/.sbt/1.0/plugins/plugins.sbt
cat /dev/null > ~/.sbt/1.0/plugins/plugins.sbt
{
  echo 'addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "2.5")'
} >> ~/.sbt/1.0/plugins/plugins.sbt

sbt +publish

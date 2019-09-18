#!/bin/bash

mkdir -p /github/home/.sbt/1.0/plugins/

touch /github/home/.sbt/1.0/sonatype.sbt
cat /dev/null > /github/home/.sbt/1.0/sonatype.sbt
{
  echo 'credentials += Credentials("Sonatype Nexus Repository Manager",';
  echo '        "oss.sonatype.org",';
  echo '        "'"$NEXUS_USER"'",'
  echo '        "'"$NEXUS_PASSWORD"'")'
} >> /github/home/.sbt/1.0/sonatype.sbt
sha1sum /github/home/.sbt/1.0/sonatype.sbt

touch /github/home/.private.key
cat /dev/null > /github/home/.private.key
echo -e "$GPG_PK" > /github/home/.private.key
gpg --import --batch /github/home/.private.key
rm -rf /github/home/.private.key

touch /github/home/.sbt/1.0/plugins/plugins.sbt
cat /dev/null > /github/home/.sbt/1.0/plugins/plugins.sbt
{
  echo 'addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "2.3")'
} >> /github/home/.sbt/1.0/plugins/plugins.sbt

sbt +publish

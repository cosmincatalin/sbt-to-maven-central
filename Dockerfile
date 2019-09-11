FROM mozilla/sbt:8u212_1.2.8

LABEL "com.github.actions.name"="sbt to Maven Central"
LABEL "com.github.actions.description"="Publish libraries to Maven Central using Scala's sbt"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.4"
LABEL repository="https://github.com/cosmincatalin/sbt-to-maven-central"
LABEL homepage="https://github.com/cosmincatalin/sbt-to-maven-central"
LABEL maintainer="Cosmin Catalin Sanda <cosmincatalini@gmail.com>"

USER root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
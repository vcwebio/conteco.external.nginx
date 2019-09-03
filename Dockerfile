##### BEGIN external/Dockerfile/iamge-header #####
FROM ${CONTECO_NAME}:${CONTECO_TAG}
##### END external/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/build-instructions #####
USER root
RUN apt-get update && apt-get install -y gettext && apt-get install -y jq && rm -rf /var/cache/apt/*
##### END image/Dockerfile/build-instructions #####

##### BEGIN external/Dockerfile/conteco #####
COPY ./ /conteco/git-repository/
##### END external/Dockerfile/conteco #####

##### BEGIN external/Dockerfile/labels-footer #####
LABEL $CONTECO_LABELSPACE.schema-version="1.0" \
      $CONTECO_LABELSPACE.realm="$CONTECO_REALM" \
      $CONTECO_LABELSPACE.ecosystem="$CONTECO_ECOSYSTEM" \
      $CONTECO_LABELSPACE.type="$CONTECO_TYPE" \
      $CONTECO_LABELSPACE.name="$CONTECO_NAME" \
      $CONTECO_LABELSPACE.tag="$CONTECO_TAG" \
      $CONTECO_LABELSPACE.base="$CONTECO_NAME:$CONTECO_TAG" \
      $CONTECO_LABELSPACE.build="$CONTECO_BUILD" \
      $CONTECO_LABELSPACE.label="$CONTECO_LABEL" \
      $CONTECO_LABELSPACE.description="$CONTECO_DESCRIPTION" \
      $CONTECO_LABELSPACE.repository="/conteco/git-repository" 
##### END external/Dockerfile/labels-footer #####

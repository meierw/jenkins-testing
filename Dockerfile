FROM jenkins/jenkins:lts-alpine

# All recommended plugins
#   + simple-theme-plugin
#   + job-dsl
RUN /usr/local/bin/install-plugins.sh \
    jdk-tool \
    cloudbees-folder \
    antisamy-markup-formatter \
    build-timeout \
    credentials-binding \
    timestamper \
    ws-cleanup \
    ant \
    gradle \
    workflow-aggregator \
    github-branch-source \
    pipeline-github-lib \
    pipeline-stage-view \
    git \
    subversion \
    ssh-slaves \
    matrix-auth \
    pam-auth \
    ldap \
    email-ext \
    mailer \
    simple-theme-plugin \
    job-dsl

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY initAdminUser.groovy /usr/share/jenkins/ref/init.groovy.d/

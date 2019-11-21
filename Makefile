3SCALE_VERSION=1.9.7
AMQONLINE_VERSION=1.2.2
CLOUD_RESOURCES_VERSION=0.1.0
INTEGREATLY_VERSION=1.7.6
AMQSTREAMS_VERSION=1.1.0
CODEREADY_VERSION=1.2.2
FUSEONLINE_VERSION=1.4.0
LAUNCHER_VERSION=0.1.2
MOBILE_DEVELOPER_CONSOLE_VERSION=0.3.0
MOBILE_SECURITY_SERVICE_VERSION=0.4.1
MONITORING_VERSION=0.0.28
NEXUS_VERSION=0.9.0
RHSSO_VERSION=1.9.5
TUTORIAL_WEB_APP_VERSION=0.0.34
UPS_VERSION=0.3.0
KEYCLOAK_RHSSO_VERSION=7.0.1

AUTH_TOKEN=$(shell curl -sH "Content-Type: application/json" -XPOST https://quay.io/cnr/api/v1/users/login -d '{"user": {"username": "$(QUAY_USERNAME)", "password": "${QUAY_PASSWORD}"}}' | jq -r '.token')

push/all: push/amqstreams push/3scale push/fuse push/codeready push/amqonline push/nexus push/launcher push/solution-explorer push/mobile-security-service push/unifiedpush push/mobile-developer-console push/monitoring push/cloud-resources push/keycloak-rhsso

push/keycloak-rhsso:
	operator-courier verify keycloak-rhsso
	-operator-courier push keycloak-rhsso/ $(REPO) keycloak-rhsso $(KEYCLOAK_RHSSO_VERSION) "$(AUTH_TOKEN)"

push/monitoring:
	operator-courier verify integreatly-monitoring
	-operator-courier push integreatly-monitoring/ $(REPO) integreatly-monitoring $(MONITORING_VERSION) "$(AUTH_TOKEN)"

push/amqstreams:
	operator-courier verify integreatly-amq-streams
	-operator-courier push integreatly-amq-streams/ $(REPO) integreatly-amq-streams $(AMQSTREAMS_VERSION) "$(AUTH_TOKEN)"

push/cloud-resources:
	operator-courier verify integreatly-cloud-resources
	-operator-courier push integreatly-cloud-resources/ $(REPO) integreatly-cloud-resources $(CLOUD_RESOURCES_VERSION) "$(AUTH_TOKEN)"

push/3scale:
	operator-courier verify integreatly-3scale
	-operator-courier push integreatly-3scale/ $(REPO) integreatly-3scale $(3SCALE_VERSION) "$(AUTH_TOKEN)"

push/launcher:
	operator-courier verify integreatly-launcher
	-operator-courier push integreatly-launcher/ $(REPO) integreatly-launcher $(LAUNCHER_VERSION) "$(AUTH_TOKEN)"

push/codeready:
	operator-courier verify integreatly-codeready-workspaces
	-operator-courier push integreatly-codeready-workspaces/ $(REPO) integreatly-codeready-workspaces $(CODEREADY_VERSION) "$(AUTH_TOKEN)"

push/fuse:
	operator-courier verify integreatly-fuse
	-operator-courier push integreatly-fuse/ $(REPO) integreatly-syndesis $(FUSEONLINE_VERSION) "$(AUTH_TOKEN)"

push/amqonline:
	operator-courier verify integreatly-amq-online
	-operator-courier push integreatly-amq-online/ $(REPO) integreatly-amq-online $(AMQONLINE_VERSION) "$(AUTH_TOKEN)"

push/nexus:
	operator-courier verify integreatly-nexus
	-operator-courier push integreatly-nexus/ $(REPO) integreatly-nexus $(NEXUS_VERSION) "$(AUTH_TOKEN)"

push/solution-explorer:
	operator-courier verify integreatly-solution-explorer
	-operator-courier push integreatly-solution-explorer/ $(REPO) integreatly-solution-explorer $(TUTORIAL_WEB_APP_VERSION) "$(AUTH_TOKEN)"

push/mobile-developer-console:
	operator-courier verify integreatly-mobile-developer-console
	-operator-courier push integreatly-mobile-developer-console/ $(REPO) integreatly-mobile-developer-console $(MOBILE_DEVELOPER_CONSOLE_VERSION) "$(AUTH_TOKEN)"

push/mobile-security-service:
	operator-courier verify integreatly-mobile-security-service
	-operator-courier push integreatly-mobile-security-service/ $(REPO) integreatly-mobile-security-service $(MOBILE_SECURITY_SERVICE_VERSION) "$(AUTH_TOKEN)"

push/unifiedpush:
	operator-courier verify integreatly-unifiedpush
	-operator-courier push integreatly-unifiedpush/ $(REPO) integreatly-unifiedpush $(UPS_VERSION) "$(AUTH_TOKEN)"

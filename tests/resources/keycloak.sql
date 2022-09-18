--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA keycloak;


ALTER SCHEMA keycloak OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE keycloak.admin_event_entity OWNER TO admin;

--
-- Name: associated_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.associated_policy OWNER TO admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE keycloak.authentication_execution OWNER TO admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.authentication_flow OWNER TO admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.authenticator_config OWNER TO admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.authenticator_config_entry OWNER TO admin;

--
-- Name: broker_link; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE keycloak.broker_link OWNER TO admin;

--
-- Name: client; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client OWNER TO admin;

--
-- Name: client_attributes; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_attributes OWNER TO admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_auth_flow_bindings OWNER TO admin;

--
-- Name: client_default_roles; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_default_roles OWNER TO admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE keycloak.client_initial_access OWNER TO admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_node_registrations OWNER TO admin;

--
-- Name: client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE keycloak.client_scope OWNER TO admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_scope_attributes OWNER TO admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client_scope_client OWNER TO admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_scope_role_mapping OWNER TO admin;

--
-- Name: client_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE keycloak.client_session OWNER TO admin;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_auth_status OWNER TO admin;

--
-- Name: client_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_note OWNER TO admin;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_prot_mapper OWNER TO admin;

--
-- Name: client_session_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_role OWNER TO admin;

--
-- Name: client_user_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_user_session_note OWNER TO admin;

--
-- Name: component; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE keycloak.component OWNER TO admin;

--
-- Name: component_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE keycloak.component_config OWNER TO admin;

--
-- Name: composite_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE keycloak.composite_role OWNER TO admin;

--
-- Name: credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.credential OWNER TO admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE keycloak.databasechangelog OWNER TO admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE keycloak.databasechangeloglock OWNER TO admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.default_client_scope OWNER TO admin;

--
-- Name: event_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE keycloak.event_entity OWNER TO admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE keycloak.fed_user_attribute OWNER TO admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.fed_user_consent OWNER TO admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.fed_user_consent_cl_scope OWNER TO admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.fed_user_credential OWNER TO admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_group_membership OWNER TO admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_required_action OWNER TO admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_role_mapping OWNER TO admin;

--
-- Name: federated_identity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_identity OWNER TO admin;

--
-- Name: federated_user; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_user OWNER TO admin;

--
-- Name: group_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_attribute OWNER TO admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_role_mapping OWNER TO admin;

--
-- Name: identity_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.identity_provider OWNER TO admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.identity_provider_config OWNER TO admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.identity_provider_mapper OWNER TO admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.idp_mapper_config OWNER TO admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE keycloak.keycloak_group OWNER TO admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE keycloak.keycloak_role OWNER TO admin;

--
-- Name: migration_model; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.migration_model OWNER TO admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE keycloak.offline_client_session OWNER TO admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.offline_user_session OWNER TO admin;

--
-- Name: policy_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE keycloak.policy_config OWNER TO admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE keycloak.protocol_mapper OWNER TO admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.protocol_mapper_config OWNER TO admin;

--
-- Name: realm; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.realm OWNER TO admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_attribute OWNER TO admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_default_groups OWNER TO admin;

--
-- Name: realm_default_roles; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_default_roles OWNER TO admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_enabled_event_types OWNER TO admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_events_listeners OWNER TO admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_required_credential OWNER TO admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_smtp_config OWNER TO admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_supported_locales OWNER TO admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.redirect_uris OWNER TO admin;

--
-- Name: required_action_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.required_action_config OWNER TO admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE keycloak.required_action_provider OWNER TO admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_attribute OWNER TO admin;

--
-- Name: resource_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_policy OWNER TO admin;

--
-- Name: resource_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_scope OWNER TO admin;

--
-- Name: resource_server; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE keycloak.resource_server OWNER TO admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE keycloak.resource_server_perm_ticket OWNER TO admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE keycloak.resource_server_policy OWNER TO admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_resource OWNER TO admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_scope OWNER TO admin;

--
-- Name: resource_uris; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.resource_uris OWNER TO admin;

--
-- Name: role_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE keycloak.role_attribute OWNER TO admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_mapping OWNER TO admin;

--
-- Name: scope_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_policy OWNER TO admin;

--
-- Name: user_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE keycloak.user_attribute OWNER TO admin;

--
-- Name: user_consent; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.user_consent OWNER TO admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_consent_client_scope OWNER TO admin;

--
-- Name: user_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.user_entity OWNER TO admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_config OWNER TO admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper OWNER TO admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper_config OWNER TO admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.user_federation_provider OWNER TO admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_group_membership OWNER TO admin;

--
-- Name: user_required_action; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE keycloak.user_required_action OWNER TO admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_role_mapping OWNER TO admin;

--
-- Name: user_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE keycloak.user_session OWNER TO admin;

--
-- Name: user_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE keycloak.user_session_note OWNER TO admin;

--
-- Name: username_login_failure; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE keycloak.username_login_failure OWNER TO admin;

--
-- Name: web_origins; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.web_origins OWNER TO admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.authentication_execution VALUES ('4949d741-33c7-4d5e-8cf3-f58da887aa2f', NULL, 'auth-cookie', 'master', 'c7607473-1418-448c-80c9-beab9806380b', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('6a7a2346-3562-4d0c-82a1-984cc5fc01f7', NULL, 'auth-spnego', 'master', 'c7607473-1418-448c-80c9-beab9806380b', 3, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('9224e43d-5810-4257-9640-29f2658549cd', NULL, 'identity-provider-redirector', 'master', 'c7607473-1418-448c-80c9-beab9806380b', 2, 25, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('18f9e50e-0466-4b26-9d4c-acd10f335245', NULL, NULL, 'master', 'c7607473-1418-448c-80c9-beab9806380b', 2, 30, true, '0e8d6e3b-2423-4cd1-b456-6ad6a10f651e', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('c2a8ce67-4871-4ed0-b27a-a1dd936c6ad3', NULL, 'auth-username-password-form', 'master', '0e8d6e3b-2423-4cd1-b456-6ad6a10f651e', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('d2641266-469f-481d-a96e-633a201b02e8', NULL, 'direct-grant-validate-username', 'master', 'd4ecc75e-aa91-402c-9954-5de7b1dd9f1b', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('be40971e-b41d-46a9-ad70-39ef502cf9c0', NULL, 'direct-grant-validate-password', 'master', 'd4ecc75e-aa91-402c-9954-5de7b1dd9f1b', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('bd1b7aa2-be88-4a73-93a5-d37788302c2e', NULL, 'registration-page-form', 'master', '4f99802f-f223-4bfd-bb94-763632a38792', 0, 10, true, '1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('940bafa8-11f5-4589-8083-efa98d9b0b05', NULL, 'registration-user-creation', 'master', '1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('33379e10-c93b-458e-8a0b-0145ed813b3b', NULL, 'registration-profile-action', 'master', '1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', 0, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('46c1e7cd-0868-4b88-bb60-4ba54a4f2e77', NULL, 'registration-password-action', 'master', '1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', 0, 50, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4e5f3156-47b8-400a-9bad-c945d9b245fc', NULL, 'registration-recaptcha-action', 'master', '1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', 3, 60, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('efe2b051-ac78-4b9b-bd71-7c11e80b88f2', NULL, 'reset-credentials-choose-user', 'master', 'a6cd20b2-8e57-4b05-8b37-cb8e00029567', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5c0cb75a-0e5a-40ad-898a-aa2926a48512', NULL, 'reset-credential-email', 'master', 'a6cd20b2-8e57-4b05-8b37-cb8e00029567', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('23c6db5e-d830-4cda-860a-80dfa775f4f3', NULL, 'reset-password', 'master', 'a6cd20b2-8e57-4b05-8b37-cb8e00029567', 0, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('66c0377f-042a-4e16-bc14-abdd1770ec55', NULL, 'client-secret', 'master', '60a0ff69-3a30-4b20-962b-0b830f402583', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('3a75be75-c5b3-41a1-aad7-381bec297ad5', NULL, 'client-jwt', 'master', '60a0ff69-3a30-4b20-962b-0b830f402583', 2, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('dab88799-1965-4baf-93e1-fe11337cfd00', NULL, 'client-secret-jwt', 'master', '60a0ff69-3a30-4b20-962b-0b830f402583', 2, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('e9f83ee3-9ad7-4ef4-8274-501baaab102d', NULL, 'client-x509', 'master', '60a0ff69-3a30-4b20-962b-0b830f402583', 2, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4ffa3af0-e120-4f5b-a67b-16ef1f7431aa', NULL, 'idp-review-profile', 'master', '1f8fb28b-453d-4a60-820c-c69720a4b39b', 0, 10, false, NULL, 'cfa9e9f2-93a1-4d74-babe-16f94ed7fc95');
INSERT INTO keycloak.authentication_execution VALUES ('4aba561b-3eed-4814-8939-0470cb4f8fb6', NULL, 'idp-confirm-link', 'master', '3a18fbc1-b5d2-4231-a110-21f1cddf7c03', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('11b6493d-edfc-426d-91c5-a95697f0cd05', NULL, 'idp-username-password-form', 'master', '9357ca1e-6b04-43a1-9a79-9b7f19332080', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('ac4dfbde-7cb8-40c4-ab7a-37758f014c09', NULL, 'http-basic-authenticator', 'master', 'ce364314-298c-44df-a8a8-89adf53c1b3d', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('55ec3e94-5af2-45da-b223-c3adbcab9f53', NULL, 'docker-http-basic-authenticator', 'master', '2e87f4ea-3146-4f99-883e-cc284d250201', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('6cae5f89-4813-408d-ae63-d18fd482be8b', NULL, 'no-cookie-redirect', 'master', '66b57311-3b2d-4f7f-87ba-2867769c81aa', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('6ab810a1-6654-43da-a7b7-c3e09411778c', NULL, 'basic-auth', 'master', '66b57311-3b2d-4f7f-87ba-2867769c81aa', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('3d29cd6c-afc8-4c42-9a3b-799d4b2d4391', NULL, 'basic-auth-otp', 'master', '66b57311-3b2d-4f7f-87ba-2867769c81aa', 3, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('48298418-4b7d-4fc8-9675-c47d70995960', NULL, 'auth-spnego', 'master', '66b57311-3b2d-4f7f-87ba-2867769c81aa', 3, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4a982d57-d318-4e99-b61c-b8320698addf', NULL, 'idp-confirm-link', 'nemmo', '63bc37d7-1993-4e20-9555-3aff58702aec', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('faa82c5b-3ef7-44f7-9f30-134389f2e77b', NULL, 'idp-username-password-form', 'nemmo', 'f3a47592-067f-435c-92fd-864762908214', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('c25bc319-eda5-4585-8a3c-11829c27859f', NULL, 'auth-cookie', 'nemmo', '422eee55-8685-4c9a-b153-67c6b272bc25', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('cf8649d2-3a1d-431d-84da-7a112b4f0b5e', NULL, 'auth-spnego', 'nemmo', '422eee55-8685-4c9a-b153-67c6b272bc25', 3, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4aaafeff-67d8-4fae-b993-289ed250d5df', NULL, 'identity-provider-redirector', 'nemmo', '422eee55-8685-4c9a-b153-67c6b272bc25', 2, 25, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('55390bd2-a893-4f40-a816-6de1aa539e11', NULL, NULL, 'nemmo', '422eee55-8685-4c9a-b153-67c6b272bc25', 2, 30, true, 'dc1298cf-df9a-4a94-a845-7000d6fb8424', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('43999023-033c-4a45-a7c2-cb2eb7ef2f10', NULL, 'client-secret', 'nemmo', 'e968a738-65ce-4f12-a50d-3847b901714f', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4139cad4-3521-45c5-be2f-8699e3724687', NULL, 'client-jwt', 'nemmo', 'e968a738-65ce-4f12-a50d-3847b901714f', 2, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5c34db60-4df4-4665-a78c-170515fd2786', NULL, 'client-secret-jwt', 'nemmo', 'e968a738-65ce-4f12-a50d-3847b901714f', 2, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4fd83e5c-a21d-487a-8931-0b4862f6151f', NULL, 'client-x509', 'nemmo', 'e968a738-65ce-4f12-a50d-3847b901714f', 2, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('67aedffe-ad8b-428a-9037-ee501940430a', NULL, 'direct-grant-validate-username', 'nemmo', '97e5fb92-0cac-43d2-af9c-5eb23e8e419e', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('ea35ce69-895a-4cb9-bef6-8075353d06bd', NULL, 'direct-grant-validate-password', 'nemmo', '97e5fb92-0cac-43d2-af9c-5eb23e8e419e', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('b181bbe4-42cc-4f04-ae86-dbe8bb2b4ff3', NULL, 'docker-http-basic-authenticator', 'nemmo', '01aaa93e-995c-40d6-aab5-c15af6953ae6', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('c0db1c4e-6f67-40fd-8f17-0a9cf2f80fcc', NULL, 'idp-review-profile', 'nemmo', 'c597e3bb-3ba2-4b06-97a4-c7a824182451', 0, 10, false, NULL, '70c3d015-5caa-4d40-9024-e37b10379dd0');
INSERT INTO keycloak.authentication_execution VALUES ('fba45ad3-d28f-4b6a-86c1-3522d951997f', NULL, 'auth-username-password-form', 'nemmo', 'dc1298cf-df9a-4a94-a845-7000d6fb8424', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('00a12d55-d4a5-4d73-a1cd-9f1747c54895', NULL, 'no-cookie-redirect', 'nemmo', '577e2807-9443-4803-b54a-69048f6ca918', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4458ceb3-5a45-422f-9194-3d339ad2ab74', NULL, 'basic-auth', 'nemmo', '577e2807-9443-4803-b54a-69048f6ca918', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5b428db3-d8e1-48b5-8ad1-65554de96c04', NULL, 'basic-auth-otp', 'nemmo', '577e2807-9443-4803-b54a-69048f6ca918', 3, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('0cc27a8f-467e-4e1d-941d-efbf0983f996', NULL, 'auth-spnego', 'nemmo', '577e2807-9443-4803-b54a-69048f6ca918', 3, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('d33796bc-f4ab-4d10-b2d5-a4ba2884a0f5', NULL, 'registration-page-form', 'nemmo', 'a54355e6-eaed-4e9b-a3ec-8a7bdb18ff59', 0, 10, true, 'cd33015d-2eff-4f9f-bf0a-1d500df4f236', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('bbe1f4cd-ca1c-4524-ba2d-90710d313ec2', NULL, 'registration-user-creation', 'nemmo', 'cd33015d-2eff-4f9f-bf0a-1d500df4f236', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('b23f7593-04a9-4d61-aa20-c3e4b5c06171', NULL, 'registration-profile-action', 'nemmo', 'cd33015d-2eff-4f9f-bf0a-1d500df4f236', 0, 40, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('522003cd-55f3-4483-89f2-46b9914b7c39', NULL, 'registration-password-action', 'nemmo', 'cd33015d-2eff-4f9f-bf0a-1d500df4f236', 0, 50, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('b3e3567c-5c7f-4980-a84f-62b639fa8cb2', NULL, 'registration-recaptcha-action', 'nemmo', 'cd33015d-2eff-4f9f-bf0a-1d500df4f236', 3, 60, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5c134897-d08f-4813-875c-6c67e15580a4', NULL, 'reset-credentials-choose-user', 'nemmo', '648c367c-9e9d-4558-b963-0ca2bf44041b', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('fb2a9c70-895f-48d3-95c7-3d0d30b4e458', NULL, 'reset-credential-email', 'nemmo', '648c367c-9e9d-4558-b963-0ca2bf44041b', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5dbf2fb4-e4b8-4387-b641-b7771e75e0b9', NULL, 'reset-password', 'nemmo', '648c367c-9e9d-4558-b963-0ca2bf44041b', 0, 30, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('68e2ed9c-6cfc-4e6e-9f14-6f3a14ce3004', NULL, 'http-basic-authenticator', 'nemmo', '146f4123-4e7c-49b5-90cd-4e251b0326b6', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('f030c064-e1e5-4a1d-81af-fd3d6cd843d1', NULL, NULL, 'master', '0e8d6e3b-2423-4cd1-b456-6ad6a10f651e', 1, 20, true, '917c7347-838b-4dc6-8fd3-25003c5faec5', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('97756685-677c-4e66-a341-66617ec189c1', NULL, 'conditional-user-configured', 'master', '917c7347-838b-4dc6-8fd3-25003c5faec5', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('421302d0-3d85-4f59-ab5a-6b44ed2e167f', NULL, 'auth-otp-form', 'master', '917c7347-838b-4dc6-8fd3-25003c5faec5', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('7815b3dd-d043-42dc-9015-41d22ccbecdd', NULL, NULL, 'master', 'd4ecc75e-aa91-402c-9954-5de7b1dd9f1b', 1, 30, true, '577831be-db1f-48f3-930f-9651918b7b61', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('c75506de-5cb4-4238-996c-715d14d78be9', NULL, 'conditional-user-configured', 'master', '577831be-db1f-48f3-930f-9651918b7b61', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('f378d3ec-1ff3-4b0d-ab95-65f347d8c1f9', NULL, 'direct-grant-validate-otp', 'master', '577831be-db1f-48f3-930f-9651918b7b61', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('96ef9573-63b2-442d-801e-b81c25328d24', NULL, NULL, 'master', 'a6cd20b2-8e57-4b05-8b37-cb8e00029567', 1, 40, true, '55788342-4d0c-4a76-ae18-8ae90c9cefc4', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('b36d748b-ef3a-40a7-9d16-5e505d43a5ea', NULL, 'conditional-user-configured', 'master', '55788342-4d0c-4a76-ae18-8ae90c9cefc4', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('52f472a9-cda8-4b18-9d97-51cabdaafb92', NULL, 'reset-otp', 'master', '55788342-4d0c-4a76-ae18-8ae90c9cefc4', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('e2d89955-9dba-4c1c-871f-d2faf55c2bb7', NULL, NULL, 'master', '9357ca1e-6b04-43a1-9a79-9b7f19332080', 1, 20, true, '1aa704ed-b11c-4cab-8306-022b36a9f5dd', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('8b349a00-e59c-43b8-b9f1-317caaaa07cc', NULL, 'conditional-user-configured', 'master', '1aa704ed-b11c-4cab-8306-022b36a9f5dd', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('ef9dad53-b39d-40b8-8d3e-c74af3ba7b19', NULL, 'auth-otp-form', 'master', '1aa704ed-b11c-4cab-8306-022b36a9f5dd', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5b7bf71b-97f0-4289-8333-6b4fd64e0981', NULL, NULL, 'nemmo', 'f3a47592-067f-435c-92fd-864762908214', 1, 20, true, '28243e82-6533-4030-a09e-9f23b07a886b', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('93d9bfe4-5ca9-42f0-9195-a944571e3da4', NULL, 'conditional-user-configured', 'nemmo', '28243e82-6533-4030-a09e-9f23b07a886b', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('32ff218b-b825-472e-b9c0-972b440e3d95', NULL, 'auth-otp-form', 'nemmo', '28243e82-6533-4030-a09e-9f23b07a886b', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('95c7b4d0-d0c1-4e81-a851-f243c6a49344', NULL, NULL, 'nemmo', '97e5fb92-0cac-43d2-af9c-5eb23e8e419e', 1, 30, true, '2c87cfb0-53aa-4830-92cf-586e6c6f2849', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('dc73ee33-b507-49dd-91b4-615476499f68', NULL, 'conditional-user-configured', 'nemmo', '2c87cfb0-53aa-4830-92cf-586e6c6f2849', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('ed5240ab-604c-44a4-87d4-7608755d6fa3', NULL, 'direct-grant-validate-otp', 'nemmo', '2c87cfb0-53aa-4830-92cf-586e6c6f2849', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('2dffd55d-57aa-427f-b7cf-2e03df489cc4', NULL, NULL, 'nemmo', 'dc1298cf-df9a-4a94-a845-7000d6fb8424', 1, 20, true, '6c12d9e8-ca65-4b6a-999d-da5d82bb8d17', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('df8ae4b8-5f85-40bb-94d4-6209ff76597c', NULL, 'conditional-user-configured', 'nemmo', '6c12d9e8-ca65-4b6a-999d-da5d82bb8d17', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('dc810df2-ce03-4dfb-9952-0b043c56147e', NULL, 'auth-otp-form', 'nemmo', '6c12d9e8-ca65-4b6a-999d-da5d82bb8d17', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('37de4e74-3778-48b4-9a6c-afdecb19dfdd', NULL, NULL, 'nemmo', '648c367c-9e9d-4558-b963-0ca2bf44041b', 1, 40, true, '22d6b838-7801-4c62-8371-866adb9939f4', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('51b1f332-73a8-4831-936c-ab0beb8e78c2', NULL, 'conditional-user-configured', 'nemmo', '22d6b838-7801-4c62-8371-866adb9939f4', 0, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('4618ed1c-22f5-4e42-834a-d5700225b93e', NULL, 'reset-otp', 'nemmo', '22d6b838-7801-4c62-8371-866adb9939f4', 0, 20, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('5cb3626a-67fa-4dab-b9a2-a84e9b7cb317', NULL, NULL, 'master', '1f8fb28b-453d-4a60-820c-c69720a4b39b', 0, 20, true, '3c6f25f5-9a63-4ce7-8f5d-a5f2e33d6f81', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('303288f0-11dd-45f0-830c-646c3f9a0c57', NULL, 'idp-create-user-if-unique', 'master', '3c6f25f5-9a63-4ce7-8f5d-a5f2e33d6f81', 2, 10, false, NULL, 'f4af8742-df7b-45bf-b59a-b9d0963c857d');
INSERT INTO keycloak.authentication_execution VALUES ('0fdd7e33-cf17-4867-804d-acf80c3c0c3d', NULL, NULL, 'master', '3c6f25f5-9a63-4ce7-8f5d-a5f2e33d6f81', 2, 20, true, '3a18fbc1-b5d2-4231-a110-21f1cddf7c03', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('db8549f4-4f54-4bff-b81f-21d0d4316b6c', NULL, NULL, 'master', '3a18fbc1-b5d2-4231-a110-21f1cddf7c03', 0, 20, true, '7aa6d07b-f3e1-4b9c-b88d-1ce09bdc6cb5', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('339aa89e-28df-447d-a232-bb53278cac7c', NULL, 'idp-email-verification', 'master', '7aa6d07b-f3e1-4b9c-b88d-1ce09bdc6cb5', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('f08d05a1-b608-4127-b309-9d31853dd072', NULL, NULL, 'master', '7aa6d07b-f3e1-4b9c-b88d-1ce09bdc6cb5', 2, 20, true, '9357ca1e-6b04-43a1-9a79-9b7f19332080', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('c05a1123-3eac-4a6e-8912-8349b74312ac', NULL, NULL, 'nemmo', '63bc37d7-1993-4e20-9555-3aff58702aec', 0, 20, true, '93d9fd55-11ab-49c4-ad05-4e72c501afb8', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('28fdef05-4353-4187-ae52-3e65b9400164', NULL, 'idp-email-verification', 'nemmo', '93d9fd55-11ab-49c4-ad05-4e72c501afb8', 2, 10, false, NULL, NULL);
INSERT INTO keycloak.authentication_execution VALUES ('bbbb7c1d-0a45-47cb-8f1f-028508596ff6', NULL, NULL, 'nemmo', '93d9fd55-11ab-49c4-ad05-4e72c501afb8', 2, 20, true, 'f3a47592-067f-435c-92fd-864762908214', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('da82dd95-b530-4e27-8dce-90d214aada85', NULL, NULL, 'nemmo', 'c597e3bb-3ba2-4b06-97a4-c7a824182451', 0, 20, true, '7ce73361-dfee-45ef-965b-6998cf9a6fe5', NULL);
INSERT INTO keycloak.authentication_execution VALUES ('87261ab2-bd76-4f48-8b2e-4c8b82ec3b9c', NULL, 'idp-create-user-if-unique', 'nemmo', '7ce73361-dfee-45ef-965b-6998cf9a6fe5', 2, 10, false, NULL, '54f68e0b-d428-4b2e-9409-e12a58d95fe8');
INSERT INTO keycloak.authentication_execution VALUES ('40d319d9-7cb3-4856-a53a-062472866d3b', NULL, NULL, 'nemmo', '7ce73361-dfee-45ef-965b-6998cf9a6fe5', 2, 20, true, '63bc37d7-1993-4e20-9555-3aff58702aec', NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.authentication_flow VALUES ('c7607473-1418-448c-80c9-beab9806380b', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('0e8d6e3b-2423-4cd1-b456-6ad6a10f651e', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('d4ecc75e-aa91-402c-9954-5de7b1dd9f1b', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('4f99802f-f223-4bfd-bb94-763632a38792', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('1a6d7117-2e8c-4ea8-bdc6-de0ae4ae34dd', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('a6cd20b2-8e57-4b05-8b37-cb8e00029567', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('60a0ff69-3a30-4b20-962b-0b830f402583', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('1f8fb28b-453d-4a60-820c-c69720a4b39b', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('3a18fbc1-b5d2-4231-a110-21f1cddf7c03', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('9357ca1e-6b04-43a1-9a79-9b7f19332080', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('ce364314-298c-44df-a8a8-89adf53c1b3d', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('2e87f4ea-3146-4f99-883e-cc284d250201', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('66b57311-3b2d-4f7f-87ba-2867769c81aa', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('63bc37d7-1993-4e20-9555-3aff58702aec', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('f3a47592-067f-435c-92fd-864762908214', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('422eee55-8685-4c9a-b153-67c6b272bc25', 'browser', 'browser based authentication', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('e968a738-65ce-4f12-a50d-3847b901714f', 'clients', 'Base authentication for clients', 'nemmo', 'client-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('97e5fb92-0cac-43d2-af9c-5eb23e8e419e', 'direct grant', 'OpenID Connect Resource Owner Grant', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('01aaa93e-995c-40d6-aab5-c15af6953ae6', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('c597e3bb-3ba2-4b06-97a4-c7a824182451', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('dc1298cf-df9a-4a94-a845-7000d6fb8424', 'forms', 'Username, password, otp and other auth forms.', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('577e2807-9443-4803-b54a-69048f6ca918', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('a54355e6-eaed-4e9b-a3ec-8a7bdb18ff59', 'registration', 'registration flow', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('cd33015d-2eff-4f9f-bf0a-1d500df4f236', 'registration form', 'registration form', 'nemmo', 'form-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('648c367c-9e9d-4558-b963-0ca2bf44041b', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('146f4123-4e7c-49b5-90cd-4e251b0326b6', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'nemmo', 'basic-flow', true, true);
INSERT INTO keycloak.authentication_flow VALUES ('917c7347-838b-4dc6-8fd3-25003c5faec5', 'forms - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('577831be-db1f-48f3-930f-9651918b7b61', 'direct grant - direct-grant-validate-otp - Conditional', 'Flow to determine if the direct-grant-validate-otp authenticator should be used or not.', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('55788342-4d0c-4a76-ae18-8ae90c9cefc4', 'reset credentials - reset-otp - Conditional', 'Flow to determine if the reset-otp authenticator should be used or not.', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('1aa704ed-b11c-4cab-8306-022b36a9f5dd', 'Verify Existing Account by Re-authentication - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('28243e82-6533-4030-a09e-9f23b07a886b', 'Verify Existing Account by Re-authentication - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('2c87cfb0-53aa-4830-92cf-586e6c6f2849', 'direct grant - direct-grant-validate-otp - Conditional', 'Flow to determine if the direct-grant-validate-otp authenticator should be used or not.', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('6c12d9e8-ca65-4b6a-999d-da5d82bb8d17', 'forms - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('22d6b838-7801-4c62-8371-866adb9939f4', 'reset credentials - reset-otp - Conditional', 'Flow to determine if the reset-otp authenticator should be used or not.', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('3c6f25f5-9a63-4ce7-8f5d-a5f2e33d6f81', 'first broker login - Alternatives - 0', 'Subflow of first broker login with alternative executions', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('7aa6d07b-f3e1-4b9c-b88d-1ce09bdc6cb5', 'Handle Existing Account - Alternatives - 0', 'Subflow of Handle Existing Account with alternative executions', 'master', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('93d9fd55-11ab-49c4-ad05-4e72c501afb8', 'Handle Existing Account - Alternatives - 0', 'Subflow of Handle Existing Account with alternative executions', 'nemmo', 'basic-flow', false, true);
INSERT INTO keycloak.authentication_flow VALUES ('7ce73361-dfee-45ef-965b-6998cf9a6fe5', 'first broker login - Alternatives - 0', 'Subflow of first broker login with alternative executions', 'nemmo', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.authenticator_config VALUES ('cfa9e9f2-93a1-4d74-babe-16f94ed7fc95', 'review profile config', 'master');
INSERT INTO keycloak.authenticator_config VALUES ('f4af8742-df7b-45bf-b59a-b9d0963c857d', 'create unique user config', 'master');
INSERT INTO keycloak.authenticator_config VALUES ('54f68e0b-d428-4b2e-9409-e12a58d95fe8', 'create unique user config', 'nemmo');
INSERT INTO keycloak.authenticator_config VALUES ('70c3d015-5caa-4d40-9024-e37b10379dd0', 'review profile config', 'nemmo');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.authenticator_config_entry VALUES ('cfa9e9f2-93a1-4d74-babe-16f94ed7fc95', 'missing', 'update.profile.on.first.login');
INSERT INTO keycloak.authenticator_config_entry VALUES ('f4af8742-df7b-45bf-b59a-b9d0963c857d', 'false', 'require.password.update.after.registration');
INSERT INTO keycloak.authenticator_config_entry VALUES ('54f68e0b-d428-4b2e-9409-e12a58d95fe8', 'false', 'require.password.update.after.registration');
INSERT INTO keycloak.authenticator_config_entry VALUES ('70c3d015-5caa-4d40-9024-e37b10379dd0', 'missing', 'update.profile.on.first.login');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', true, true, 'master-realm', 0, false, 'a54a13d1-ede8-4ac9-8aaa-1a3b50f6b982', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', true, false, 'broker', 0, false, 'a8a2d1dc-a81c-4b02-b95c-bbae2053a4ff', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', true, false, 'admin-cli', 0, true, '866f780c-b976-4773-b9c7-0a4c0573de7e', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO keycloak.client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', true, true, 'nemmo-realm', 0, false, 'd7ff68e7-6e38-4f36-83c9-cced4537508c', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'nemmo Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', true, false, 'broker', 0, false, '**********', NULL, false, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', true, true, 'back', 0, false, '**********', NULL, true, NULL, false, 'nemmo', 'openid-connect', -1, false, false, NULL, false, 'client-secret', NULL, NULL, NULL, true, false, true, false);
INSERT INTO keycloak.client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', true, false, 'realm-management', 0, false, '**********', NULL, true, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', true, false, 'admin-cli', 0, true, '**********', NULL, false, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO keycloak.client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', true, false, 'security-admin-console', 0, true, 'b5703508-2082-47ce-93b5-414c523133d5', '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, false, 'account', 0, false, '683f9242-f7a3-4c8f-9418-71904c5ef8ef', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', true, false, 'security-admin-console', 0, true, '**********', '/admin/nemmo/console/', false, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', true, false, 'account', 0, false, '**********', '/realms/nemmo/account/', false, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', true, false, 'account-console', 0, true, '1da59657-d9d8-40f0-8acd-d772304152cd', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', true, false, 'account-console', 0, true, '72ec39ab-cd2f-4149-8137-561d96e96c02', '/realms/nemmo/account/', false, NULL, false, 'nemmo', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO keycloak.client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', true, true, 'front', 0, true, '**********', 'https://nemmo-kub-qual.francecentral.cloudapp.azure.com', false, NULL, false, 'nemmo', 'openid-connect', -1, false, false, NULL, false, 'client-secret', NULL, NULL, NULL, true, false, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.assertion.signature');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.force.post.binding');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.multivalued.roles');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.encrypt');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.server.signature');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml_force_name_id_format');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.client.signature');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.authnstatement');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'display.on.consent.screen');
INSERT INTO keycloak.client_attributes VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'false', 'saml.onetimeuse.condition');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.assertion.signature');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.force.post.binding');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.multivalued.roles');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.encrypt');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.server.signature');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml_force_name_id_format');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.client.signature');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.authnstatement');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'display.on.consent.screen');
INSERT INTO keycloak.client_attributes VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'false', 'saml.onetimeuse.condition');
INSERT INTO keycloak.client_attributes VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', 'S256', 'pkce.code.challenge.method');
INSERT INTO keycloak.client_attributes VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', 'S256', 'pkce.code.challenge.method');
INSERT INTO keycloak.client_attributes VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', 'S256', 'pkce.code.challenge.method');
INSERT INTO keycloak.client_attributes VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', 'S256', 'pkce.code.challenge.method');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_default_roles VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', 'd6dc15b8-8878-4075-ba52-9c890ae1c8e1');
INSERT INTO keycloak.client_default_roles VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', 'b31953ee-700d-43e1-be79-80f083c55f6b');
INSERT INTO keycloak.client_default_roles VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', 'e14daed3-9c78-43ab-a0e9-14595a3112be');
INSERT INTO keycloak.client_default_roles VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '86086e36-8675-47e5-ad23-14c7b9a15f5b');


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_scope VALUES ('845e1c05-70cb-4227-bccf-e5e056c9fe1b', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('ea0287b6-3598-4b3b-bf75-638783aee572', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO keycloak.client_scope VALUES ('459e27e0-3f59-493c-95b7-cc8c66d6691f', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('c0574d71-d069-4d8f-9c26-93a3205ce722', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('8b3c07c1-8c36-4d50-823c-40dbc5c844c2', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('d1c44ced-5118-40ca-afcb-e2d8baaf5d24', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('8fb301d7-b5d2-44bf-b506-896db8e37493', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('47b8755b-f051-4500-a34a-ea3516235ad3', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('8d5ae196-38b0-4db9-bb06-cc25de0cecb0', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', 'offline_access', 'nemmo', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('15e24397-8f92-4369-833b-2975a9c51503', 'role_list', 'nemmo', 'SAML role list', 'saml');
INSERT INTO keycloak.client_scope VALUES ('d31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', 'profile', 'nemmo', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('ad2c1a97-efa9-48c4-af23-f1060416235e', 'email', 'nemmo', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('fea827e8-5af8-4498-9c30-f8ae63aba4b5', 'address', 'nemmo', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('72553a2a-d944-4e5e-9243-2cc1577338dc', 'phone', 'nemmo', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('7d4d6194-1dae-4498-b6a5-504605b48461', 'roles', 'nemmo', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('388612c1-8a46-4dc0-b62c-77e137c3564b', 'web-origins', 'nemmo', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO keycloak.client_scope VALUES ('7caa3483-d57f-4b2a-9d8c-8724af22fb0a', 'microprofile-jwt', 'nemmo', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_scope_attributes VALUES ('845e1c05-70cb-4227-bccf-e5e056c9fe1b', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('845e1c05-70cb-4227-bccf-e5e056c9fe1b', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('ea0287b6-3598-4b3b-bf75-638783aee572', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('ea0287b6-3598-4b3b-bf75-638783aee572', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('459e27e0-3f59-493c-95b7-cc8c66d6691f', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('459e27e0-3f59-493c-95b7-cc8c66d6691f', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('459e27e0-3f59-493c-95b7-cc8c66d6691f', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('c0574d71-d069-4d8f-9c26-93a3205ce722', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('c0574d71-d069-4d8f-9c26-93a3205ce722', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('c0574d71-d069-4d8f-9c26-93a3205ce722', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('8b3c07c1-8c36-4d50-823c-40dbc5c844c2', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('8b3c07c1-8c36-4d50-823c-40dbc5c844c2', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('8b3c07c1-8c36-4d50-823c-40dbc5c844c2', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('d1c44ced-5118-40ca-afcb-e2d8baaf5d24', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('d1c44ced-5118-40ca-afcb-e2d8baaf5d24', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('d1c44ced-5118-40ca-afcb-e2d8baaf5d24', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('8fb301d7-b5d2-44bf-b506-896db8e37493', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('8fb301d7-b5d2-44bf-b506-896db8e37493', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('8fb301d7-b5d2-44bf-b506-896db8e37493', 'false', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('47b8755b-f051-4500-a34a-ea3516235ad3', 'false', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('47b8755b-f051-4500-a34a-ea3516235ad3', '', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('47b8755b-f051-4500-a34a-ea3516235ad3', 'false', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('8d5ae196-38b0-4db9-bb06-cc25de0cecb0', 'false', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('8d5ae196-38b0-4db9-bb06-cc25de0cecb0', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('15e24397-8f92-4369-833b-2975a9c51503', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('15e24397-8f92-4369-833b-2975a9c51503', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('d31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('d31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('d31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('ad2c1a97-efa9-48c4-af23-f1060416235e', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('ad2c1a97-efa9-48c4-af23-f1060416235e', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('ad2c1a97-efa9-48c4-af23-f1060416235e', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('fea827e8-5af8-4498-9c30-f8ae63aba4b5', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('fea827e8-5af8-4498-9c30-f8ae63aba4b5', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('fea827e8-5af8-4498-9c30-f8ae63aba4b5', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('72553a2a-d944-4e5e-9243-2cc1577338dc', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('72553a2a-d944-4e5e-9243-2cc1577338dc', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('72553a2a-d944-4e5e-9243-2cc1577338dc', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('7d4d6194-1dae-4498-b6a5-504605b48461', 'false', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('7d4d6194-1dae-4498-b6a5-504605b48461', 'true', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('7d4d6194-1dae-4498-b6a5-504605b48461', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('388612c1-8a46-4dc0-b62c-77e137c3564b', 'false', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('388612c1-8a46-4dc0-b62c-77e137c3564b', 'false', 'display.on.consent.screen');
INSERT INTO keycloak.client_scope_attributes VALUES ('388612c1-8a46-4dc0-b62c-77e137c3564b', '', 'consent.screen.text');
INSERT INTO keycloak.client_scope_attributes VALUES ('7caa3483-d57f-4b2a-9d8c-8724af22fb0a', 'true', 'include.in.token.scope');
INSERT INTO keycloak.client_scope_attributes VALUES ('7caa3483-d57f-4b2a-9d8c-8724af22fb0a', 'false', 'display.on.consent.screen');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('2b0936d7-41be-430f-a04e-a8b2dca1876e', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('e58c32da-40ae-450b-a00d-85781bc5923f', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('2742e775-01e8-42e6-a97f-f6c569ffafa8', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('e448c41d-f4a5-47c9-b223-26313ea437a3', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('4a1cfe0d-b897-4047-91ef-cb809a1b0a28', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('a1aa49b4-01d3-4972-8439-0ce53bd6c184', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('67c91bd4-0723-4d03-b34c-741538893909', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('4fd96003-dffa-450b-8eaa-faa99ab33752', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.client_scope_client VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.client_scope_client VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.client_scope_role_mapping VALUES ('845e1c05-70cb-4227-bccf-e5e056c9fe1b', 'd003d60a-c957-418c-92ca-e174734dfa49');
INSERT INTO keycloak.client_scope_role_mapping VALUES ('7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', 'cbb68085-fd19-487d-a11d-5ef58cac65fc');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.component VALUES ('dcd31d5b-e76b-4180-ba49-d66183fabaa9', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('8bf78d50-a194-4ae5-a83f-28fb043a5a15', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('33baee01-7d32-4a8a-b55c-5cd6c5291569', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('fdbdbda2-94fd-4027-86c1-695cc7e33be8', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('34533042-3aab-4422-a225-46787d928eae', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('94073172-f8b5-44bc-ac81-599fe8aec243', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO keycloak.component VALUES ('1baee27a-58a3-4362-8378-acc7e8f15ccb', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO keycloak.component VALUES ('4ef97726-f703-40c3-b71e-94d912f9291b', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO keycloak.component VALUES ('f3cdedcd-f2a6-4faf-8f67-9de182f04fc3', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO keycloak.component VALUES ('8fc3cb02-4f7b-41b8-9bf1-2f2b1b1ca483', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO keycloak.component VALUES ('32219a2e-fde8-4a9e-9eb7-239fdca095a8', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO keycloak.component VALUES ('86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'Allowed Protocol Mapper Types', 'nemmo', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('4fc1f28c-f8b2-44da-a337-bd49aacc4a32', 'Allowed Client Scopes', 'nemmo', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'authenticated');
INSERT INTO keycloak.component VALUES ('1a5aa07e-9d71-48cd-a529-116813ca18b9', 'Consent Required', 'nemmo', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'Allowed Protocol Mapper Types', 'nemmo', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'authenticated');
INSERT INTO keycloak.component VALUES ('0103d2ee-cafe-45eb-be4f-29093429c867', 'Allowed Client Scopes', 'nemmo', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('baa0e77c-c0e8-4517-9a1a-2321c724d8b6', 'Max Clients Limit', 'nemmo', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('d665dfc0-235a-4959-b4ca-09790eff57cc', 'Trusted Hosts', 'nemmo', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('64adbbb2-5ed3-43d2-a9fa-22668507a2a3', 'Full Scope Disabled', 'nemmo', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'nemmo', 'anonymous');
INSERT INTO keycloak.component VALUES ('33b32df5-2e44-4b6b-8986-fef23662b76d', 'hmac-generated', 'nemmo', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'nemmo', NULL);
INSERT INTO keycloak.component VALUES ('40c4f5eb-12d3-4869-b9bb-e470538aa651', 'rsa-generated', 'nemmo', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'nemmo', NULL);
INSERT INTO keycloak.component VALUES ('af530a22-dbcc-415b-b4ae-67615b8489af', 'aes-generated', 'nemmo', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'nemmo', NULL);


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.component_config VALUES ('4962d4d6-ad80-4cdd-a8cf-2ebcc67ffc62', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO keycloak.component_config VALUES ('4b018577-15b6-450a-8e3a-7b163e2d4e86', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO keycloak.component_config VALUES ('70bf320a-8709-41d2-a2ea-f3182ecee6c1', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO keycloak.component_config VALUES ('b8bdd529-81cb-4287-842d-70bb442bfa1a', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('709e59ae-8580-422e-b11a-3690fdfe56d7', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('fff2f7cc-0ed6-4d40-8a16-7a01a1046863', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO keycloak.component_config VALUES ('c0281672-ae77-4679-bf57-e75bc31db92b', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO keycloak.component_config VALUES ('7c915184-ed2e-427a-8b96-b8c3c5b98f42', '34533042-3aab-4422-a225-46787d928eae', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO keycloak.component_config VALUES ('6e8dff37-aca1-4ed0-8288-4473dcca307a', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO keycloak.component_config VALUES ('e4f99a53-b239-4cb6-9e43-f9ec50caabc2', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('a7d08975-fe9f-4021-8e00-1f1327a94ea7', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO keycloak.component_config VALUES ('d20163f3-ac08-4110-a28f-59542471a1a1', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('479e65e8-a3ec-4efd-bb7a-4b7366f12217', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO keycloak.component_config VALUES ('4beb5332-0ea6-46be-9a6b-f8fa79898ba0', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO keycloak.component_config VALUES ('2ab6d2c6-2faa-4bc5-8129-242d8d09c416', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO keycloak.component_config VALUES ('47f8e963-1bb5-4c74-ab14-965d01959c45', '1baee27a-58a3-4362-8378-acc7e8f15ccb', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO keycloak.component_config VALUES ('8aa2d5a4-b2af-45f2-9c03-bcd05373847c', '4ef97726-f703-40c3-b71e-94d912f9291b', 'allow-default-scopes', 'true');
INSERT INTO keycloak.component_config VALUES ('e273ef16-f645-47a3-9a87-6bed0d4ff342', '94073172-f8b5-44bc-ac81-599fe8aec243', 'allow-default-scopes', 'true');
INSERT INTO keycloak.component_config VALUES ('3c0f9929-1cec-4204-9ef6-6b5ac0ff8f1e', 'fdbdbda2-94fd-4027-86c1-695cc7e33be8', 'max-clients', '200');
INSERT INTO keycloak.component_config VALUES ('a605f328-2206-443c-b82b-a662abeac4ef', 'dcd31d5b-e76b-4180-ba49-d66183fabaa9', 'host-sending-registration-request-must-match', 'true');
INSERT INTO keycloak.component_config VALUES ('7d6925ca-8c16-48f1-9306-dd2a06a3e90e', 'dcd31d5b-e76b-4180-ba49-d66183fabaa9', 'client-uris-must-match', 'true');
INSERT INTO keycloak.component_config VALUES ('e75490a9-6605-49f9-bb58-79bfbfcb0bdf', '32219a2e-fde8-4a9e-9eb7-239fdca095a8', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('1ce9224c-cda8-4a60-b57a-92440b5e4fa6', '32219a2e-fde8-4a9e-9eb7-239fdca095a8', 'kid', '4ca4ea19-f3d3-46b7-998b-b41a2c0a3975');
INSERT INTO keycloak.component_config VALUES ('798916cc-dc12-4dc9-8c02-379c6551283e', '32219a2e-fde8-4a9e-9eb7-239fdca095a8', 'secret', 'fwLtg6h5un6v35SjawT6FQ');
INSERT INTO keycloak.component_config VALUES ('c7f7aa31-57cc-4ce1-af6a-ace73ee7c50c', 'f3cdedcd-f2a6-4faf-8f67-9de182f04fc3', 'certificate', 'MIICmzCCAYMCBgFvqY5jYzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwMTE1MTQxMjU4WhcNMzAwMTE1MTQxNDM4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCUi65IP8cG4QZmEJgOQLv5v5beAVbQ8LxLlCNOzJgfnzECa9775JVFZaa22HFoL4VWjYDf2F+YMd5SSRPIANTUq9g0E+xo5NkVt7Nxz1t8zTSagBj2gxJ0a+gWVb1S+dK8NoJoaGv4oaowuTH/HrgiKLOjd2/vXNOHkAeWkblThVxUlLKSI3hea3bCHxprVzryAK5pP30eUorATwDoYKuwOj4Xu+jUfrPwxZlq+Jt7PJ1XzwjtK5LcocOwsOWwxLMpDP1B4GFgWVBDpq+tGqNvUuHpUMDK6nx5BiceyjgK0WTy9ocI734Pu/ZOGqEt9GXhu65FQd/zlvtwsKU0rXY7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHWigGRiyNXjnPtwMZ5Dpr9d+dWh8a9+71IqxQ2X7oUx1ecEocDx4HXLk1WBJ+isPOBxQHcsFHKaqA29cDXDEkSZeae7os1mzyCIkxYAY3pXsWr4csFhlW5QLZ39OtR0lNvgqRf/Q1iR8t5s2Ob22X5nXqMZZ+V5fhB5xj18MWrVJVcII6UXSB1/yerooclKReOZohXUcmonbMBe3YL0VTNtW/TTt6mX03xdoEwTd1EZjoUMwQh6vdMLkDU07jGPP/rw+drt1oQpet0od+++RC2yC4XZOte8CipCTDE12Ink8jXcOmPApcVbEZ+OC6VzIo5GKifCt94gZR2FPxZquec=');
INSERT INTO keycloak.component_config VALUES ('9285b77c-00c7-467b-a4ff-7f876eeb469a', 'f3cdedcd-f2a6-4faf-8f67-9de182f04fc3', 'privateKey', 'MIIEowIBAAKCAQEAlIuuSD/HBuEGZhCYDkC7+b+W3gFW0PC8S5QjTsyYH58xAmve++SVRWWmtthxaC+FVo2A39hfmDHeUkkTyADU1KvYNBPsaOTZFbezcc9bfM00moAY9oMSdGvoFlW9UvnSvDaCaGhr+KGqMLkx/x64Iiizo3dv71zTh5AHlpG5U4VcVJSykiN4Xmt2wh8aa1c68gCuaT99HlKKwE8A6GCrsDo+F7vo1H6z8MWZavibezydV88I7SuS3KHDsLDlsMSzKQz9QeBhYFlQQ6avrRqjb1Lh6VDAyup8eQYnHso4CtFk8vaHCO9+D7v2ThqhLfRl4buuRUHf85b7cLClNK12OwIDAQABAoIBADJ2DNtgRwUQNjM/2delp/WcXuzFua86yExIY4ImQFsloel3qYUaTpcHhA3DEytYUUxov2nLQBYcgrCjQIQFvEcOpWBzkDDF5PTatauozCRmNUNy1ogPWJqR+YJ0196zHSJwxfYf2uXYTU9F6jUHQ3ffKb8TGMRQXU9E3z8H+9PiCd9+Ho+mNo9yUCmR/1HErzCpfMyo9ble+sogfVzz9M9Vo7y7UJ5lCxibsyZzsFqoIg4yeESLxEGQHyXIH+3YaZIqolJlYDXSWqX2vFEfH4sq+3TGs5QjJogduGoNCgY4e9IUj0ChmpqkChqUAL8aNNcHfyz4uHU2SPxP6RFR4+ECgYEA05/wLnzUykq5lMsf3J82MEeW4cyyRE8jdc1a0tRtendrbhtix9rRF7Ap/SdwiQsCkkHyKVKjHui7I2G/omO5oLt9qOFScJWZNVyqy1lRGrsUzJPUg0Ejke9VIWCszBceImogUk8N5Xfapp9agjmm3xA9t1V9fYg7E3RVG2Y+KlECgYEAs7GkOlT6tm3WEA3DVVmN0lzy6xfqI92y7SZuYnkrzdhWovmKtUHHt/3h0GAEIsktNr4wa0rGuMUVoxSpsnMct89bDMvR1anwA/4pTD6W9zd2P4+HqoyzavdLzZK5cBmeJb8Mt+ozheSsguFPVgKEGeAC47dvagVa8CGyGP/haMsCgYBDNqYjLbSr92XP81/QQ6UDWol6d/gaqAP8M1foZF3NKsatNvd9wGrumh4L8I3WiO+tIlLWew+iDor5Zt9lpUTc3w+/Jql3Zpw9jYwVf+25jrfBbiZt9a9ld11Td5AKVkFU7t4LJl6khhelGjG18LemW1MuunFcAHu65xTs2eFesQKBgHtwYHyhu8huE0rb6X9MEZyctVLCDtmshila6SFEU88H+hviiGKTWXsPMHxQOQccY67jX6eUqoZq/L4Wh6xKX0P1cXqM2QyJvJNBmWUC6fnRY62uD2gdV3L3hl8ll7VmI7mSUE5W2CX2PHt8A1/2QoDz3YhIjoSqQRoMS6fYvyOZAoGBAIUTlh1SDitxiXM8ed3XvDllbBG1mln3EO6Ho/rhT82FUK5ujaCmMOjacTRGnWDkAK/ajJFT+D84pzVm+6IiHp3Wy6NSwCMM1M3T2KML0sgBUqImPAFhy1GCOieonGEN/U9L34daWi8m9y+K0inFR3e2lzab635m5revnoqEBjwV');
INSERT INTO keycloak.component_config VALUES ('0dbf6719-5097-4e6d-8093-6e86b1cfbc9c', 'f3cdedcd-f2a6-4faf-8f67-9de182f04fc3', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('caffe54c-20de-49b8-b0dc-f47a6f1a12c7', '8fc3cb02-4f7b-41b8-9bf1-2f2b1b1ca483', 'kid', 'beef11fb-3cc8-45e8-8475-3b27d73d43f2');
INSERT INTO keycloak.component_config VALUES ('6959c9c1-9a51-49af-a346-12f6c7b9f5fe', '8fc3cb02-4f7b-41b8-9bf1-2f2b1b1ca483', 'algorithm', 'HS256');
INSERT INTO keycloak.component_config VALUES ('a49d941a-435d-4d8e-bd60-c3f2fecf9413', '8fc3cb02-4f7b-41b8-9bf1-2f2b1b1ca483', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('b91d9cf3-eee6-4ec9-a00a-042b312dd34e', '8fc3cb02-4f7b-41b8-9bf1-2f2b1b1ca483', 'secret', 'N7riwDKY6E46WMgDWKuf_u0IMrm5E_mbqoKzEaN2EU2ZuTrP0TKZYe4F25X3xDVrQdxu-1ICjCh8wPvtYhxfYQ');
INSERT INTO keycloak.component_config VALUES ('124e44d9-13ce-4716-8195-c5eb0d2e392d', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO keycloak.component_config VALUES ('39372e0e-3348-4dcf-b12b-1ef75b6c1deb', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO keycloak.component_config VALUES ('95cb9134-9dd9-4ad0-8e6e-34190448bbc9', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO keycloak.component_config VALUES ('ff148676-126e-4a5e-bd96-b6be6e737d48', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO keycloak.component_config VALUES ('538ea307-5fc8-4293-902c-4a6e5b7c4c50', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO keycloak.component_config VALUES ('c177667e-d9ad-4b97-b8f0-2f14faada34b', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('f1a7db73-82dd-401a-a91a-0b1460acaaaf', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO keycloak.component_config VALUES ('0316918a-f0df-4df7-9f47-a1cee9b5b6ff', '86656aa8-d96f-4b53-8da0-7d6fe0ba68af', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('90369e50-38f1-4136-bd10-254c6fca040a', '4fc1f28c-f8b2-44da-a337-bd49aacc4a32', 'allow-default-scopes', 'true');
INSERT INTO keycloak.component_config VALUES ('68f306b0-8afb-4a7a-adcf-efbebb660b26', '33b32df5-2e44-4b6b-8986-fef23662b76d', 'algorithm', 'HS256');
INSERT INTO keycloak.component_config VALUES ('19b88533-a881-4bfa-ae62-86c9caa0e1fb', '33b32df5-2e44-4b6b-8986-fef23662b76d', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('2b6a02cc-bdf3-4f0b-b27a-3c281b3f7b99', '33b32df5-2e44-4b6b-8986-fef23662b76d', 'kid', '00e80491-670c-4935-b14f-08c730abfd09');
INSERT INTO keycloak.component_config VALUES ('6043b74a-9e21-454a-8cf5-94e8bf32f12f', '33b32df5-2e44-4b6b-8986-fef23662b76d', 'secret', 'J798zsWAHCMZOa-5goT-cLKOWcvNAJ-P1-Ue4ytFPgArY4zSp-xAdwrJlA_dAs_LWzCQN0G88W53wGa7aP1DUQ');
INSERT INTO keycloak.component_config VALUES ('bcf1ebcb-b2cc-4a6c-a90c-af77c945db53', '40c4f5eb-12d3-4869-b9bb-e470538aa651', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('1fe8c1af-0629-49ec-80f9-4c777c798912', '40c4f5eb-12d3-4869-b9bb-e470538aa651', 'privateKey', 'MIIEowIBAAKCAQEAqPWk2YcOtpgYvnbMl6vvBVoUt1YXvFg+fLUiLJk7+D7zfOney22rLrjpUau7xZLSkLhwWdfDK4WOnbuMyYWdLal0JvD7XER7iXvDBfAlh+y28xGpH9452DBo66C+/quuAnnQWzDZnqdITJO2Gisnt4DpxPVpyNlfkWbE2oiPQQJ+8LUZxjC1edpgzHhbJv2wVMEhWzmn0yA0PBrYtgL6L7M6Inshpb8ujAikTVnKHgpW4L+PtG15G81tZfVeiZGIvrtnFCPmDjDumxG6ClpelqBQhxDz5BHjk020lsWlCw+JlCg+wJbW+cSFLmJYtFBDS3K1Ct19F5pcIn71M22J+QIDAQABAoIBAAFfHRt28TOiQHErXbXNe387n/dtB3xL6xXwEnryM35sZGWbMGfOWBlk/t/e2QNdkcAC/0Z7beYoi2PUZews3X3FZl/6jM/O7oHLM2YU8PkNft6yQgE0OJv8qJ1hDKvckOkMPBjBaMLU8M1OVagYuZXPwhYLN/Sdbx0rDGYJvb/1Vc0AsX4VSuFrnNgNtFLX6X0OnSFnSDeyDjUUz6+NS83FHVKRJuwXspabuTgRTmlu1bN6pQc4Y7p817OhHZSBoQscocbqYHk8si4QlAX3xdLVfpR7KsF/Ex8ePgojLyuP1Llfw8loDK02X4DOa9HSkWENucgpIszv9Ak++0nH9gECgYEA92lyBq0Ij8qMYTBxPR6yAF/6fhrqWZ15oyer7A1FKLbGEJR2XPtxZ+ax0y7CMB/XsJ+CI4JzW7rziaZMRJZAWRdg7c883zdOA+HRr60/qVT6Zwh44XVCORCpZSYZy8tMJlQ1lmM8KQ+UE0Z0z6kIGPAdmLSWL6iai7fTPxtGA4kCgYEArtMN52qVZdKtJkQvW1zfvPamyb05WkAbEIhk7mjADZdIEK95dxLoZUuvcPq6+tcaCygNDugm5CybPfzcfUKdbtDkoehv+3nuvwydWfsJfC66Z5TZ4f5KjoH8S2hiE5jJBkdpb/tEgQlxi1LKlmaGJMOz/KHd8AuCO6EJxSA3BvECgYAyD+8XtLmPxu9i1xeCw4xHESSxkaar3XZ4chWSnRjKZTlsr23H4MUQvhhrYAHBFSBix9PgdYv8GrceujyigDijDlz5ob5yeFFb7bytLIQ+Mki8wnUbQcvVmi58nhoIJ6nP86goNwo8UL+oqtAGGPDfgu6qMJhXKmmjLd4b3dvr6QKBgBbBHaQrOTrBiwvaABfyJKThrZ/AY0Cd62fheNGXDLg4IocZb8PR0DGvAizAVankaV1eXyS7jqRQMfyFduVO0FLmGXwBVuHyYuK275wQkpF5O4XT1/AUOvwFayMdePZ4AmIw1UZf+/CXnBG4OuoMehU666hMISjnNpIwSadApCjhAoGBAKtsZYckI6WrbzEl6diN2ZBQ9+Yz9sGpfSCqeFGDw1neS3nX8i5jP/OgIVjQL9c5DXvNmxCSZVwNLHZuF1qziahe2RyMYx2vXqDBlby1vyMD9p086t9GYwND+2eJD2bz607ty+cA27kclGrx+zZskfG4G9Z0CAUhYOyK7TUIWgQ1');
INSERT INTO keycloak.component_config VALUES ('3dd30290-7e51-4c93-ad6b-401475a3f37f', '40c4f5eb-12d3-4869-b9bb-e470538aa651', 'certificate', 'MIICmTCCAYECBgFvqZENLTANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVuZW1tbzAeFw0yMDAxMTUxNDE1NTNaFw0zMDAxMTUxNDE3MzNaMBAxDjAMBgNVBAMMBW5lbW1vMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqPWk2YcOtpgYvnbMl6vvBVoUt1YXvFg+fLUiLJk7+D7zfOney22rLrjpUau7xZLSkLhwWdfDK4WOnbuMyYWdLal0JvD7XER7iXvDBfAlh+y28xGpH9452DBo66C+/quuAnnQWzDZnqdITJO2Gisnt4DpxPVpyNlfkWbE2oiPQQJ+8LUZxjC1edpgzHhbJv2wVMEhWzmn0yA0PBrYtgL6L7M6Inshpb8ujAikTVnKHgpW4L+PtG15G81tZfVeiZGIvrtnFCPmDjDumxG6ClpelqBQhxDz5BHjk020lsWlCw+JlCg+wJbW+cSFLmJYtFBDS3K1Ct19F5pcIn71M22J+QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBDmZC03DyMU3l4MHUfgHj0H9D81QQwkd1AlpbJxPL8LfVAu5Z/nnv9fCODChaBJm1WZods2bxxVkHLZktpdlD9rr6IN3AjeEHzm5pm1w73f6RZ4t0of+YShjW4hKaS+MwhifXNb20jVRGBkQajA272jBjWtSb1fJnbnJIxKCLOeJ47zlrdo7AsAT94XWWtPXW11hsE/s4318C9bAffnu9vznFhFh6aLZu3lZIRhxn0XfheQkwWyqKBBqhuwDlpD3/EABKGGOkoqWOXAfggxgPO9509lQ7vsxreoRli9Fb8QsiCH4X/wuOYHeAlBg0wvjIwgqDqwQK/OXoXfB3vjWjU');
INSERT INTO keycloak.component_config VALUES ('2a69946d-1cb7-48b0-af9f-5a1709f8ffca', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('3ab14de5-0e99-4b6a-b0a1-fdac1b4af4f3', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO keycloak.component_config VALUES ('a789ee08-6d68-414a-bd43-638736195ba2', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO keycloak.component_config VALUES ('dd9adf6e-1189-4a6a-be9c-c39c75f1c01b', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO keycloak.component_config VALUES ('61891a58-4ac9-427e-bdbb-08fd7df04549', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO keycloak.component_config VALUES ('043fbf5f-f243-4cf1-b1c0-d8e37969ca08', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO keycloak.component_config VALUES ('e11f4f82-70b3-4b57-8fcf-463ee4314c4a', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO keycloak.component_config VALUES ('23712f83-7970-4c67-ab9f-1a925472f958', 'b9f892c6-9f06-46bb-84d2-8432cf5e1451', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO keycloak.component_config VALUES ('44bb806c-2320-4de5-9e44-aa7fc304526f', '0103d2ee-cafe-45eb-be4f-29093429c867', 'allow-default-scopes', 'true');
INSERT INTO keycloak.component_config VALUES ('21f84e61-2a0a-4f8f-8f6e-06e501cf5692', 'baa0e77c-c0e8-4517-9a1a-2321c724d8b6', 'max-clients', '200');
INSERT INTO keycloak.component_config VALUES ('d69550b3-eed6-48f0-88b6-7bebece0039f', 'd665dfc0-235a-4959-b4ca-09790eff57cc', 'host-sending-registration-request-must-match', 'true');
INSERT INTO keycloak.component_config VALUES ('51370837-952a-47d6-a093-33a5664ce6cd', 'd665dfc0-235a-4959-b4ca-09790eff57cc', 'client-uris-must-match', 'true');
INSERT INTO keycloak.component_config VALUES ('23a9ae87-1aa5-40fc-ab31-0662bc948d6e', 'af530a22-dbcc-415b-b4ae-67615b8489af', 'priority', '100');
INSERT INTO keycloak.component_config VALUES ('6500c8a5-0878-4133-bd79-4941f620e422', 'af530a22-dbcc-415b-b4ae-67615b8489af', 'kid', '3972898e-d3d8-44cb-9d86-e4971e41fd44');
INSERT INTO keycloak.component_config VALUES ('d5ba94f8-1fa0-4cb5-8ae7-e0f7fa95959a', 'af530a22-dbcc-415b-b4ae-67615b8489af', 'secret', 'k4r-rflZLhtnLuA6u68kEg');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'b3dddbc2-6173-4524-86cc-90d52ea2b928');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'c3cbbc03-5f28-45db-8385-8532fe3baa3d');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '4ed8f887-95e5-4f13-bfcc-c6c1c12591c5');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '60409405-84fe-471f-bb5f-fc1883ae43cb');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '1be9d0a7-87d6-4330-825a-9f6a1b572bfe');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '8b455207-da34-42bf-bf38-363998f73e46');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'e5df70c1-df1f-4cd8-bec2-4c99d3d6c2e3');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '14c01a47-f67c-4b52-9910-c4520d92b4b7');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'afd69109-4118-408d-8cc3-7887ace2ca06');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '7d6e3074-c4e5-4240-9856-88e3dc0a3485');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'caac33ba-b9d0-46c2-8b49-099d3809f0b1');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '23b1ee94-3dc5-4fb0-9e2e-8b6ec1f1c03b');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'c24a860b-6c76-4c03-b7dd-1f49baef5cac');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '03d7cc6d-4fbb-4be5-99d5-4a72836e878a');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'ac09a37e-8bd1-4435-9c04-87e737f8522f');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '93b248dc-564a-44a5-b101-2fdf2c771559');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'b53788a3-09f5-417b-a55c-d9058d799bac');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '636e99bd-9667-4b69-a934-753c5022d746');
INSERT INTO keycloak.composite_role VALUES ('60409405-84fe-471f-bb5f-fc1883ae43cb', '636e99bd-9667-4b69-a934-753c5022d746');
INSERT INTO keycloak.composite_role VALUES ('60409405-84fe-471f-bb5f-fc1883ae43cb', 'ac09a37e-8bd1-4435-9c04-87e737f8522f');
INSERT INTO keycloak.composite_role VALUES ('1be9d0a7-87d6-4330-825a-9f6a1b572bfe', '93b248dc-564a-44a5-b101-2fdf2c771559');
INSERT INTO keycloak.composite_role VALUES ('b31953ee-700d-43e1-be79-80f083c55f6b', '950a53d8-820d-4a45-9181-5dc855b0945c');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'd6f21c0c-c463-4184-9879-96495d38256d');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '58378ae6-c012-4e71-92aa-1b4ff0f12e09');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '91ee5515-f520-46c7-b608-a26a3879b79e');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '319d2046-fd16-484d-8b94-262a8453b02c');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'af266eb3-cbc8-4adb-920e-625114245d6b');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '6b8f8859-070d-4414-bf06-f4380db44682');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'c59e6760-7fda-4244-82d8-146dcd2507cf');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '0ec4d644-7d8f-4e96-b8ca-cf33c59633a7');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '1d90fd03-d831-4f8a-b7f4-04208d6094cf');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'bd5f0a68-06ff-49b3-89dd-430a005daba7');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'b6cb83a0-432d-4220-9204-45687193d33e');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '80f23bb0-0c54-400c-aff3-007dfa640892');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '287c9ba0-c6e3-4a13-ae92-1e832eefe57d');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'cde2b875-7866-497a-b923-27cb8f5d0f1a');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '710028e9-8b88-4ea6-9250-3bfe9a434be6');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'aeedae19-13eb-4b1d-b84e-ab698cfc92b7');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'd02fb1db-79b0-477f-9707-5b536af36d9e');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'e0893c53-06da-4e0f-a369-8a45811e6493');
INSERT INTO keycloak.composite_role VALUES ('319d2046-fd16-484d-8b94-262a8453b02c', '710028e9-8b88-4ea6-9250-3bfe9a434be6');
INSERT INTO keycloak.composite_role VALUES ('319d2046-fd16-484d-8b94-262a8453b02c', 'e0893c53-06da-4e0f-a369-8a45811e6493');
INSERT INTO keycloak.composite_role VALUES ('af266eb3-cbc8-4adb-920e-625114245d6b', 'aeedae19-13eb-4b1d-b84e-ab698cfc92b7');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '1f2d55b5-2e0e-4683-9f0d-b1dda328213b');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '7edd347c-85a1-4980-a57e-d6182ef0cf99');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'a2b23246-41bc-415e-b2dd-d9cf42a01b29');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '4c6703a6-0db6-4af2-8ce8-44b500cd3fa7');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '47e21678-887d-4dce-9e68-c34488fccaa6');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '06f8a2c6-fe1d-4158-bacf-e4194a6d796a');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '0bfd5fc6-29f4-4649-b9d9-24c595176ec0');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '907f94a8-c01e-4809-8930-be8bb9971dcd');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '71d859a0-bf92-4a50-972e-ca674c1692e9');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '9d10aa42-3306-4765-bb1f-2dcdfe85a1d1');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'dd8a1e31-a169-4718-8055-dc9d4ceb7a73');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '9f2952b0-c1d1-44c0-82d9-a302cc6be22d');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '16b30e25-e050-422f-b510-f6bb9fdef85c');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'b7614463-bb39-4c2a-8a4e-7db42b995d8d');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '349efc79-eb10-4425-93c6-d3af53c6f4ec');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'd1175517-0b12-4ef3-b8b3-3ddbcf364964');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'e53f326a-2ca7-46e1-ad14-060e066578cb');
INSERT INTO keycloak.composite_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', 'dabfab70-5ab1-498a-acc1-b397bea5200e');
INSERT INTO keycloak.composite_role VALUES ('71d859a0-bf92-4a50-972e-ca674c1692e9', '06f8a2c6-fe1d-4158-bacf-e4194a6d796a');
INSERT INTO keycloak.composite_role VALUES ('71d859a0-bf92-4a50-972e-ca674c1692e9', 'd1175517-0b12-4ef3-b8b3-3ddbcf364964');
INSERT INTO keycloak.composite_role VALUES ('16b30e25-e050-422f-b510-f6bb9fdef85c', '9d10aa42-3306-4765-bb1f-2dcdfe85a1d1');
INSERT INTO keycloak.composite_role VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '035a50c6-62c5-4d36-87e6-fe977e417756');
INSERT INTO keycloak.composite_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', '0aa35266-c441-4431-9edc-a622eefb283b');
INSERT INTO keycloak.composite_role VALUES ('de1db64b-1155-45d7-b740-311ec75deb57', 'cf52ca6a-89c1-4872-9b5f-56af03fc0756');
INSERT INTO keycloak.composite_role VALUES ('00083480-e822-4a2a-a798-09269996e2c8', 'ad524d16-71ae-4924-a1c6-9b9e1e30a200');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.credential VALUES ('58688d57-bcee-4f69-857c-66373d1b4656', NULL, 'password', 'ae630a84-d508-4f3b-b6fd-a118a202c824', 1582018704048, NULL, '{"value":"VYl10278xDppj3nBWbWsXQRz4zK0lHOlrQ0QgDvm8RoNs7506B3OYvMn+24VMMe4N44XfYQvMY+93g7GwQuqMA==","salt":"3eBcI9yofuDJcXS5j92e7g=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('797ef0ad-cded-4fda-97f7-c36bcf895f71', NULL, 'password', '14f5ce80-a57d-4d38-b3b6-710c6960340d', 1582018107541, NULL, '{"value":"VWpdMEu4hpYjznkQCqZ0cmbtTv4UHyuKVDANi9erYiwH1a9Oof8adWNjtV9t5B/0kiGuE9dsZaUDOIZpAvybGw==","salt":"OUEod2VajgQGohzLh71HWw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('50094d1e-660b-45bd-97f1-a915b570e012', NULL, 'password', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa', 1589207817593, NULL, '{"value":"YsH0MfI7EYdceSL6N3iE0MBkyzpw/Lxrg9FYH4UywQmZauVRnmcm1Z/ExmaFmeChk2ROhzgIsnnelxcOxze/0w==","salt":"MMVgHYLZjT5rXIHeR9TEgQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('70e9f88c-d791-4385-8f1a-8e3fa4aec1c9', NULL, 'password', '37eb8b5d-76ce-4a73-ab60-d403f8780144', 1589207817721, NULL, '{"value":"/cArXgsXAwgBcD/wzujZSbgV3F9kaWsTKHZe1n/ybi3G77u2lFdnBSWpWpdFgombTQRbzEdoPDXnZt1IIh348Q==","salt":"BUISZnJj6fJRFdAlXbdT3w=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('2050953a-d841-4b05-8c3d-fe7e2255a3af', NULL, 'password', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc', 1589207817811, NULL, '{"value":"u0969VwjaHxTJeg/63TXM0ZqC1un5YyP2pRK/MF+96HroKkmwhsSph+IuwiZGIiSVw9m+WHQfbhRuHzr7laH9g==","salt":"k23r9AnIpWHlhWE8pbH8OQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('a0253527-86e2-4d09-b16f-029e5bf1bc97', NULL, 'password', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f', 1589207817925, NULL, '{"value":"Z7rqavuWDhbwaWNx08r8AdbQrHP1QtHbdW6g4OBF3JHNt8UGMWKqoigJIP6kg70Nh44ZCmsqn8bx/RZY1depqg==","salt":"AafAoB2YSygbScOqkCNT0g=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('f6f2de58-a9fb-413e-a734-19a73d218d6c', NULL, 'password', '47119950-7d4d-4969-a6c2-3f8190f275c7', 1589207818075, NULL, '{"value":"Uowl1uXuBAXvfp4jRSxpUILJJ3OQVuQ8aj8oqlKagZv/RMkpnjgsAahjvbaUY3A77DL0remfkxnmoAmp6nQQKQ==","salt":"JEe5BWu+HIBPbqeRCTaxRw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('b33a1f3e-5c6f-48ca-b126-f6e42035aade', NULL, 'password', '36e5fa4d-560c-4c99-b72c-a3163caf39ab', 1589207818323, NULL, '{"value":"FOwBCzom5FRQmU+BqUhceHHZnlEC+f1k77wrUL5e/lHmcLX6hd8EnR5d8tBghOeLcpJjFCAEe/nC3wdmSv4h9Q==","salt":"J21Q2EThDJIstXpRRRzS+A=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('cee48c56-19f5-42a1-80b5-a0a6e9707435', NULL, 'password', '22ce4d09-4285-470f-8480-ea0dc7e13bbc', 1589207818396, NULL, '{"value":"jXxHFSpznAeC3xtqhdyg2tx3pObwwsIiEKn4ipAZ+N+Ln/aNRaNQqdexOw6YVJP7H4jJU5dGlLVuRTFBlsVjXg==","salt":"vSmTlOqMeAHfqi84jBJY6Q=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('9ac5121d-c066-41bc-8050-486569612a14', NULL, 'password', '1d9d71b2-69a0-4feb-aa86-efce0243a28b', 1589207818808, NULL, '{"value":"YLp6D6WkwMiQDloG75H5ytObasIXVxxnYsImZDo24DUM0t5kwWnXQ7ukDYgb+aP7c/EuQVUImN6slqete7IQ0g==","salt":"wkJPBR7YOfWaLt0Wqq8Czg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('7dff6d91-0755-4b51-ab06-666e39100a9c', NULL, 'password', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8', 1589207819214, NULL, '{"value":"EHymS/3VJh8M1bP1UmSlu4ZXmY3UMPENNzdiYbFnsH1Zm77ib2LFJCfCbW/OPlDT0Szvm9mmHzsMa4O719Sj7A==","salt":"22tMcyLOVx+vwrdZNxebAA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('06bd5dbd-a70c-4c67-804e-2da4098fe19d', NULL, 'password', 'd08cb28d-44bf-4746-978f-414e0ca7d807', 1589207819433, NULL, '{"value":"Am375gpxKK7a/zjSA0kXpoLolnuZl5Bg4zWwDm0sE2ZSh/mEkKGwX0Ben9bL8o/6RAZyLln7I532T8UVYp4V3Q==","salt":"QuUApt1HK9G3bUecOaaOxQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('53dfa59d-20ca-45f8-a7d8-74f4876801ec', NULL, 'password', '089f4481-bab9-42ac-ae50-278118ed4bff', 1589207819612, NULL, '{"value":"n+DEtLkFk91Y0d2nQw742QirzVLCwlA+jq6CuAefffPgZiuSVBzsU05xIqGbPBupr8u/gQAIucSxNowGP6nL/w==","salt":"zS48/OfUhNCO2t3qK377+A=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('6e6b45bf-03cd-4ebe-8db5-874744fffae5', NULL, 'password', '8ca3eede-8271-44fa-b824-3875103294e4', 1589207819919, NULL, '{"value":"aSNmR7tjIx+20Qcr5t3bzhhIeUjYj21QhNie/3P85dZNmyTUHTF72Ct3tieOXV+Ea4LX8h7u5VDDIRhQQmebnQ==","salt":"V2Ol5/wY1XBfD+DDI9E3QQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('d73a48b8-be5f-49ab-89e0-34b8665f4962', NULL, 'password', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e', 1589207820121, NULL, '{"value":"XINHt47td5lnJ06ORx9iLSeMcUTIgspxWmr1LfhrcE1SYvAk4I7z+RJaxYoM0EB+LGZMwTFMWfgzR7UP+IAiUw==","salt":"cH36Ud7V8MLRDrLyo6rLNw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('567dd4c7-22c1-4fa5-b7a9-0379f950eb47', NULL, 'password', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2', 1589207820435, NULL, '{"value":"rOzOCp10HrBAMd4FqOoSMH5V95wiM1V1y/OO5PZUX0G8DIcYzoZGBo0oZAqgqlGSGT4sXrsfDWWjmBgrcN0w8g==","salt":"7VZjAnzmAbFqiEFxvR96cw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('a102d516-b295-41a7-8e8f-39ff078bc649', NULL, 'password', '08552046-8a91-479c-81de-7a5d6e98a156', 1589207820757, NULL, '{"value":"SiTa64uUeB5FU03yYRKiSlLxvIs628lxywir13y6pedGofq7o6eiki3/KxFxqEdnoxI3mPrks+Nr8dZh7DRAeQ==","salt":"NM8zjWhcE2CE97NITbyK4g=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('13c9f84f-9807-47d7-aa1c-190a9d38aa6f', NULL, 'password', 'b338f031-0465-4db4-bf74-8b1e6b4632c9', 1589207820982, NULL, '{"value":"Ntt3l+5VTQgK03QSqzAvdlh1fkpP0Mirf0m66jPDtzjUSUZNOalQpgUsyoiYx8vNHPQVcvE9Px12KKq8XJJPvw==","salt":"cdtezH5TjTp3tIwfZUZtfQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('fad44d70-ee09-4fbb-aba8-9618694d1de7', NULL, 'password', 'fb8c0241-a614-471e-8af5-85301ded1d9e', 1589207821287, NULL, '{"value":"gVijJbYG+NMTUzRPHLdClqx6mbC3wExH/FzdH56ASUtfsNOevsJMOmtEUJubjq0+UYw0P00PyedWxNKLYyT75g==","salt":"M44qKqYatG4KtSHeuf7pOA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('5c6410a0-ef28-49dc-a62d-17ee9f91cbd7', NULL, 'password', 'aae890b1-c978-444c-80e8-29c68bb005a0', 1589207821575, NULL, '{"value":"lf6Y/RzHNXWdKipYFyjsgB2EsZ1jCZtlp/vmHl8f5GODbUo4lr0kvwNd+FzpDc8TrdQAOctqh2fdwOhhigkLNQ==","salt":"HZoPh90oXpLxCQhhxhrPtA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('b6739a6e-398e-496c-8e9b-fd659d880c36', NULL, 'password', '7e4ef3e4-efda-446a-acda-d4bd56c87877', 1589207821821, NULL, '{"value":"U0nyAd903tRAlw+3y47+QjdM9T0Q9TJKmSAK3QfoVNemzLJMmHaiT88QpwLXxy/F7+errv6jO7jKX1TfN6wFgA==","salt":"CLr6YwrUvsDID4AJ8loLgQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('6f46f067-c9e8-4604-bf01-ff7e5b33cad8', NULL, 'password', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a', 1589207822261, NULL, '{"value":"N5vm8SfUqu7X4rtvP49t6A+yZQJ+opIAYON/hpdlPTWmYKYtsX4N221LQ3H04RJirtU8Z4rlQ/VvAVpxPKUJXw==","salt":"vj1L63SaiN7EsnBSGfnU5A=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('b744782c-7fb0-4dd0-a532-72633ce47b9e', NULL, 'password', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', 1589207822417, NULL, '{"value":"Ma5GmwmokPZqZCRSxltM6S553ndhud6euAB/L2DZmK/mYN9MKpVCrkeMwM/PfEVT3TY7AQLtNeAuD7AaLIQVwQ==","salt":"NCSGgu9x1KmNV4zOKCJEUw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('ff929344-f9fa-4d6b-81d9-bd459ede58e7', NULL, 'password', 'beef5e17-7811-4d38-b523-04054a7eeeec', 1589207822664, NULL, '{"value":"rw5y2ERGvUbsIGiBB04/KVMkPEoyO/MaGqgjHLOVI4R6AFnWUvN2t/1te+0NNCkRzk/OFv1zON41ISgQysHRKg==","salt":"VEhJUW9fSVJt642LwlZXPg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('179d4fcc-beb4-43a8-9ef7-9d3d573777db', NULL, 'password', 'eaff208a-285d-4578-838f-2ed20d44e472', 1589207824138, NULL, '{"value":"8in486npuc3y2DPtwvM2fQ/DsjbYOz6MfUqG7f3VI1pYRIp0woagzV+4jw9L4RF9DM7WsNb0NydMmQsFwcLOww==","salt":"xzyl2Ylp5MJvow2+Yuu+/w=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('a45b902e-d8e0-48f2-8dfd-0d4c8845d65f', NULL, 'password', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', 1589207822791, NULL, '{"value":"x4vk/gfwXrjge0aCrZycDHpMg65bwioVLx47gg29GvbPB9fqUFcZQFZXdjPZf6Du0grafltcuumOVDwz2Kaq2g==","salt":"0y+Ef6Pgow/VnAiHtvECHA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('7766d74c-6ade-4091-89f3-7397c72243d9', NULL, 'password', '755ef19b-4194-4681-9098-5c7192206456', 1589207823322, NULL, '{"value":"HLN+nZ7/DXJtJQLSglDZ+iEMXzjAPT+CtjZU/yH0YALIIuaaTQtuhVKPndu5DGbw6Rzp/RvuF4M+9rmmbC/h9g==","salt":"XgTfAi3s9THUfzaWz8tscg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('c8e50783-8966-4466-8f07-72e306c41ca5', NULL, 'password', '26d55123-7d46-4271-aaad-3024214ae8c8', 1589207823704, NULL, '{"value":"1Bua+o4J/bgB8ATY+gSBgWTcfOjaz+iLw27rCLIWiow8+ohltIkXPmrlUA/3/unVAmYDudbt+0k9xksgFb0AyA==","salt":"XPF1HYwB4nt33mRsnscKrw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('8d50c5b0-d76f-4d9a-8be5-62ad38680c7d', NULL, 'password', '1d25652f-4446-4043-acd1-edf4174efe46', 1589207822936, NULL, '{"value":"coILV4sfuZoXMHwe4d//v5P083cUsBjyKrF3D5LjDVFnEkFWqvoprPS6bykUqjlruqMUAawWNr+Fasit67yRkQ==","salt":"4nXbMKseOvvC6UF4uIBHGQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('88d10854-0556-4ef4-b76f-4255990c0d5b', NULL, 'password', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433', 1589207824015, NULL, '{"value":"cuMcs7itQER122CN+XFeQmPnqjUU+EWR4KHX0YIAbiCj+d2BmSUWX1PG1IP734YKySBuFqtQjcE1Zhbi5g5AGw==","salt":"g7JHYFgnWM4mzAwqDlTiqA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('859b1c6e-db17-4710-8601-02968f9600b1', NULL, 'password', 'd8abc769-e871-402a-ba00-d3683e05f5b7', 1593784488629, NULL, '{"value":"lmkrvxgVnRXeNZeWcNftMhQPyt/9PNjUZ30PpYSjsN8m05z3Nh42MV9DmQPJ6AnEXVyYOTFLNKF6bo84pOnmfg==","salt":"Va2BTA5h77CWYqJkq5xiwQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('25aa860f-1922-49d0-b09e-edd4f352941b', NULL, 'password', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', 1599660618719, NULL, '{"value":"WvA6/8XZaq7haq4iDQWUqC7der2eZVp6XYrSj3CTFW//Z6jF4hHqlCCCc56LpucTBHLAFGa9OVFfcEvFzAViog==","salt":"wjOwb7ooBHENFM72+P0Mfg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO keycloak.credential VALUES ('3407f54a-3d3a-428f-82d6-d40c09afcb07', NULL, 'password-history', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', 1599660378815, NULL, '{"value":"79PU2HqFG9EyhvC3NmC/ajQSOdNnyERqRQ12Np8KTr8thm1kM6KqnRtgwDAkeHLl6nb2ETrrunMiihsuGEPgBA==","salt":"ya5TxKssEtanH5ldt6/3nw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 20);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2020-01-15 14:14:25.666163', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2020-01-15 14:14:25.690417', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2020-01-15 14:14:25.786381', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2020-01-15 14:14:25.790481', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2020-01-15 14:14:25.923952', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2020-01-15 14:14:25.95777', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2020-01-15 14:14:26.114393', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2020-01-15 14:14:26.165106', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2020-01-15 14:14:26.17308', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2020-01-15 14:14:26.356803', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2020-01-15 14:14:26.419182', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2020-01-15 14:14:26.459582', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2020-01-15 14:14:26.482333', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-01-15 14:14:26.507667', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-01-15 14:14:26.510032', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-01-15 14:14:26.512441', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-01-15 14:14:26.514229', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2020-01-15 14:14:26.590314', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2020-01-15 14:14:26.628125', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2020-01-15 14:14:26.631255', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-01-15 14:14:27.172485', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-01-15 14:14:26.635221', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-01-15 14:14:26.637016', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2020-01-15 14:14:26.67637', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2020-01-15 14:14:26.681104', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2020-01-15 14:14:26.682642', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2020-01-15 14:14:26.703358', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2020-01-15 14:14:26.823894', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2020-01-15 14:14:26.829122', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2020-01-15 14:14:26.909741', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2020-01-15 14:14:26.926273', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2020-01-15 14:14:26.973922', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2020-01-15 14:14:26.979346', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-01-15 14:14:26.983986', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-01-15 14:14:26.986123', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-01-15 14:14:27.012883', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2020-01-15 14:14:27.018815', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-01-15 14:14:27.022725', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2020-01-15 14:14:27.057201', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2020-01-15 14:14:27.064183', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-01-15 14:14:27.066223', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-01-15 14:14:27.06809', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2020-01-15 14:14:27.074748', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-01-15 14:14:27.158484', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2020-01-15 14:14:27.169496', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-01-15 14:14:27.17778', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-01-15 14:14:27.180069', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-01-15 14:14:27.211611', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-01-15 14:14:27.215953', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2020-01-15 14:14:27.267611', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2020-01-15 14:14:27.286974', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2020-01-15 14:14:27.289994', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2020-01-15 14:14:27.292306', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2020-01-15 14:14:27.294939', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-01-15 14:14:27.300698', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-01-15 14:14:27.305419', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-01-15 14:14:27.326275', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-01-15 14:14:27.432799', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2020-01-15 14:14:27.485409', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2020-01-15 14:14:27.489848', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-01-15 14:14:27.49648', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2020-01-15 14:14:27.506379', 62, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2020-01-15 14:14:27.508242', 63, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-01-15 14:14:27.509864', 64, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2020-01-15 14:14:27.526368', 65, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-01-15 14:14:27.529967', 66, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2020-01-15 14:14:27.533377', 67, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2020-01-15 14:14:27.562018', 68, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2020-01-15 14:14:27.567021', 69, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '9097664956');
INSERT INTO keycloak.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-02-20 13:34:01.840985', 70, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2020-02-20 13:34:01.854168', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-02-20 13:34:01.877308', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-02-20 13:34:01.894712', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-02-20 13:34:01.898607', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-credential-cleanup', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-02-20 13:34:02.054199', 75, 'EXECUTED', '7:41f3566ac5177459e1ed3ce8f0ad35d2', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-02-20 13:34:02.081096', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-02-20 13:34:02.09184', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-02-20 13:34:02.097214', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-02-20 13:34:02.167233', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-02-20 13:34:02.182329', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '2205641771');
INSERT INTO keycloak.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-04-09 15:33:40.748562', 81, 'MARK_RAN', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '6446420742');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-04-09 15:33:40.758577', 82, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '6446420742');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-04-09 15:33:40.761075', 83, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '6446420742');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-04-09 15:33:40.76576', 84, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '6446420742');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-04-09 15:33:40.768185', 85, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '6446420742');
INSERT INTO keycloak.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-04-09 15:33:40.772978', 86, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '6446420742');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO keycloak.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO keycloak.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.default_client_scope VALUES ('master', '845e1c05-70cb-4227-bccf-e5e056c9fe1b', false);
INSERT INTO keycloak.default_client_scope VALUES ('master', 'ea0287b6-3598-4b3b-bf75-638783aee572', true);
INSERT INTO keycloak.default_client_scope VALUES ('master', '459e27e0-3f59-493c-95b7-cc8c66d6691f', true);
INSERT INTO keycloak.default_client_scope VALUES ('master', 'c0574d71-d069-4d8f-9c26-93a3205ce722', true);
INSERT INTO keycloak.default_client_scope VALUES ('master', '8b3c07c1-8c36-4d50-823c-40dbc5c844c2', false);
INSERT INTO keycloak.default_client_scope VALUES ('master', 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24', false);
INSERT INTO keycloak.default_client_scope VALUES ('master', '8fb301d7-b5d2-44bf-b506-896db8e37493', true);
INSERT INTO keycloak.default_client_scope VALUES ('master', '47b8755b-f051-4500-a34a-ea3516235ad3', true);
INSERT INTO keycloak.default_client_scope VALUES ('master', '8d5ae196-38b0-4db9-bb06-cc25de0cecb0', false);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '15e24397-8f92-4369-833b-2975a9c51503', true);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18', true);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', 'ad2c1a97-efa9-48c4-af23-f1060416235e', true);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '7d4d6194-1dae-4498-b6a5-504605b48461', true);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '388612c1-8a46-4dc0-b62c-77e137c3564b', true);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '7f7049c8-bb02-4d83-9dbb-1f9ad86f097a', false);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', 'fea827e8-5af8-4498-9c30-f8ae63aba4b5', false);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '72553a2a-d944-4e5e-9243-2cc1577338dc', false);
INSERT INTO keycloak.default_client_scope VALUES ('nemmo', '7caa3483-d57f-4b2a-9d8c-8724af22fb0a', false);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.federated_identity VALUES ('USIGNON-INTRANET', 'nemmo', 'UT2K77', 'ut2k77', NULL, 'e30c2c51-b88c-4038-b01d-08dc40f937c2');


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.group_attribute VALUES ('1f0f142a-cb66-44bc-9915-56004bfde20b', 'type', 'banque', 'dbe944e0-8dea-450d-b8a3-d5bc84dd361d');
INSERT INTO keycloak.group_attribute VALUES ('c86cae20-7bc3-460c-ba92-faa3a674c1f9', 'doubleSignaturePromoteur', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('4163a12f-c623-431c-827e-90fb852daea1', 'doubleSignaturePromoteur', '2fc1fa19-4c72-4179-abeb-fe369913e1e5', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('8833e728-04b4-4da5-a2bd-2df35f89acbe', 'doubleSignaturePromoteur', 'a4c6e39f-ed38-459f-87e8-48e74044ad81', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('e1a90278-acbf-4b39-8c78-534adc1cd0c4', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'dbe944e0-8dea-450d-b8a3-d5bc84dd361d');
INSERT INTO keycloak.group_attribute VALUES ('5fe574ac-5672-4606-bb14-fe76371a1a99', 'type', 'banque', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('540fb25d-ba80-438a-b8a2-09a6e034c672', 'promoteursSignatairesGfa', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('45f2b417-374a-4c55-8d43-cb83c20b724e', 'promoteursSignatairesGfa', '2fc1fa19-4c72-4179-abeb-fe369913e1e5', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('887e5d2f-45e7-4a67-984d-c07c97857a6d', 'promoteursSignatairesGfa', 'a4c6e39f-ed38-459f-87e8-48e74044ad81', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_attribute VALUES ('67be26df-b6a2-4be8-b095-2ea0b8cbe0d8', 'type', 'banque', 'afb24a57-8ba9-452f-8072-55dd5aa9e9f0');
INSERT INTO keycloak.group_attribute VALUES ('4384db5d-6119-4b8c-8cb4-650ca31ee511', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'afb24a57-8ba9-452f-8072-55dd5aa9e9f0');
INSERT INTO keycloak.group_attribute VALUES ('5f099786-60e1-4a93-8f96-2917a46b6eff', 'type', 'promoteur', '506ca814-ae9f-4c3a-be6a-ddb3ffa11bee');
INSERT INTO keycloak.group_attribute VALUES ('2da9d8ed-2346-4ddd-bf9a-4eafc0907e17', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', '506ca814-ae9f-4c3a-be6a-ddb3ffa11bee');
INSERT INTO keycloak.group_attribute VALUES ('3a10edca-4b65-48d3-b760-9794727163d3', 'type', 'promoteur', 'd8b5d185-5318-451f-99a2-6c76ae1bcf44');
INSERT INTO keycloak.group_attribute VALUES ('8c5cbcaa-3ab6-4273-99a5-7e31759c2512', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'd8b5d185-5318-451f-99a2-6c76ae1bcf44');
INSERT INTO keycloak.group_attribute VALUES ('85ca3f76-7a13-4c3c-940d-1c0f2319e20d', 'type', 'promoteur', '6137be69-54d4-4d49-8920-3a8d7ee91e84');
INSERT INTO keycloak.group_attribute VALUES ('f854e9a1-8719-4fb9-bc3b-12323735a6c3', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', '6137be69-54d4-4d49-8920-3a8d7ee91e84');
INSERT INTO keycloak.group_attribute VALUES ('e1632c03-f95c-4798-9ebb-0dee6d53f377', 'type', 'banque', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_attribute VALUES ('0886aa9f-fe07-4a08-93cb-8d5e6c65cf2e', 'doubleSignaturePromoteur', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_attribute VALUES ('ab098cfa-983c-4870-ba53-e3a82be32ea5', 'doubleSignaturePromoteur', '2fc1fa19-4c72-4179-abeb-fe369913e1e5', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_attribute VALUES ('61e6fd5e-7fce-4613-a60a-97e7f542039d', 'doubleSignaturePromoteur', 'a4c6e39f-ed38-459f-87e8-48e74044ad81', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_attribute VALUES ('5f581d00-5a85-42e1-8d62-43ec696073da', 'type', 'banque', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_attribute VALUES ('429026dc-303d-437c-bd79-8401eda98506', 'doubleSignaturePromoteur', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_attribute VALUES ('ca0abf65-d9ab-4fce-b275-91e624bf94ae', 'doubleSignaturePromoteur', '2fc1fa19-4c72-4179-abeb-fe369913e1e5', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_attribute VALUES ('5cf77bf0-689a-45a6-9557-420cb60ac025', 'doubleSignaturePromoteur', 'a4c6e39f-ed38-459f-87e8-48e74044ad81', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_attribute VALUES ('56947776-0dda-4a26-8bb2-f9ca943c4e1c', 'type', 'promoteur', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7');
INSERT INTO keycloak.group_attribute VALUES ('12fe7f1b-a235-4cf5-bde7-0e270b764eb1', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7');
INSERT INTO keycloak.group_attribute VALUES ('5c681f76-4478-4569-82b9-9e84f86d6f2d', 'type', 'promoteur', '2fc1fa19-4c72-4179-abeb-fe369913e1e5');
INSERT INTO keycloak.group_attribute VALUES ('a12bbe17-0ca2-4f58-a3ab-03ef0bdd475b', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', '2fc1fa19-4c72-4179-abeb-fe369913e1e5');
INSERT INTO keycloak.group_attribute VALUES ('dfe324ca-d42e-41b7-83cb-1b44b4d2e000', 'type', 'promoteur', 'a4c6e39f-ed38-459f-87e8-48e74044ad81');
INSERT INTO keycloak.group_attribute VALUES ('8fb22e4b-65b1-4a2c-a391-b0393adb896d', 'doubleSignaturePromoteur', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'a4c6e39f-ed38-459f-87e8-48e74044ad81');


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.group_role_mapping VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', 'dbe944e0-8dea-450d-b8a3-d5bc84dd361d');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', '506ca814-ae9f-4c3a-be6a-ddb3ffa11bee');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', 'd8b5d185-5318-451f-99a2-6c76ae1bcf44');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', '6137be69-54d4-4d49-8920-3a8d7ee91e84');
INSERT INTO keycloak.group_role_mapping VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_role_mapping VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_role_mapping VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', '2fc1fa19-4c72-4179-abeb-fe369913e1e5');
INSERT INTO keycloak.group_role_mapping VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', 'a4c6e39f-ed38-459f-87e8-48e74044ad81');
INSERT INTO keycloak.group_role_mapping VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', 'afb24a57-8ba9-452f-8072-55dd5aa9e9f0');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', 'dab5c617-770d-4c86-985d-8edc2ed1e2ab');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', '7750f4cb-7af6-4f74-8b5d-a6c5009846c7');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', 'e5d44a89-0d0e-48c9-b255-b40e20bea1c7');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', '2fc1fa19-4c72-4179-abeb-fe369913e1e5');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', '2fc1fa19-4c72-4179-abeb-fe369913e1e5');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', 'a4c6e39f-ed38-459f-87e8-48e74044ad81');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', 'a4c6e39f-ed38-459f-87e8-48e74044ad81');
INSERT INTO keycloak.group_role_mapping VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', '21455db9-ae33-4b61-8d82-923e33d090fe');
INSERT INTO keycloak.group_role_mapping VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', '21455db9-ae33-4b61-8d82-923e33d090fe');


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.identity_provider VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', true, 'USIGNON-INTRANET', 'saml', false, false, 'nemmo', false, false, 'c597e3bb-3ba2-4b06-97a4-c7a824182451', NULL, 'CACIB SSO', false);


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'false', 'validateSignature');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'KEY_ID', 'samlXmlKeyNameTranformer');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'MIIFWTCCBEGgAwIBAgINALkNEXLxMCyJV6ioqzANBgkqhkiG9w0BAQsFADCBhjELMAkGA1UEBhMCRlIxHjAcBgNVBAoMFUNyZWRpdCBBZ3JpY29sZSBHcm91cDEaMBgGA1UECwwRUHJpdmF0ZSBHcm91cCBQS0kxFzAVBgNVBAsMDjAwMDIgNzg0NjA4NDE2MSIwIAYDVQQDDBlDQSBDcmVkaXQgQWdyaWNvbGUgU2VydmVyMB4XDTIwMDcwNjEyMTA0MloXDTI1MDcwNTEyMTE0MlowgYwxCzAJBgNVBAYTAkZSMR4wHAYDVQQKDBVDcmVkaXQgQWdyaWNvbGUgR3JvdXAxGjAYBgNVBAsMEVByaXZhdGUgR3JvdXAgUEtJMQ4wDAYDVQQLDAVDQUNJQjEOMAwGA1UECwwFMTQwMDAxITAfBgNVBAMMGGlkcC51c2lnbm9uLnF1YS5lbWVhLmNpYjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMdQeu1uuMEj6WiMPuVHgJ0+nOWT/ce8K8KmRgeiTJEXKZEkekjrj3Hm7W4H4MpF3RVN16CP/ViNwFVCf9mXwO4LXz1QdDk4/piiREw29eDlroOaBos5y1Um1rpeEbBsMxhMie51Zr7bCK2/kLFYcpwfFPIX6t7IO1DFBsQwK7n/3+5ZEf6C7V04mxdNnPyfcNCKKqjwNRCIlXtufEpODDrMbgISccZBXplPx59qWP76woW3J+UA/Pk3DjcaFeMU6NeWy84lWkdzxcHI1Dd1rZiLuRDeY0ygmxZ20oXkvji7j+iGMa8cXl0ruS8oxLI29o3S+IHV9466QIMg5yb8nmkCAwEAAaOCAbwwggG4MB0GA1UdDgQWBBRYbt5jxPiltNC6zwC5lgCv7LM0zTAfBgNVHSMEGDAWgBSU+Xpry0+XY2GBBSNqyBkvvgt57DAXBgNVHSAEEDAOMAwGCiqBegGCPAEBBgEwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMA4GA1UdDwEB/wQEAwIFoDAjBgNVHREEHDAaghhpZHAudXNpZ25vbi5xdWEuZW1lYS5jaWIwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC1wcml2LXBraS5jcmVkaXQtYWdyaWNvbGUuZnIvY3JsL0NBQ3JlZGl0QWdyaWNvbGVTZXJ2ZXIuY3JsMIGwBggrBgEFBQcBAQSBozCBoDBdBggrBgEFBQcwAoZRaHR0cDovL2NhaXNzdWVycy1wcml2LXBraS5jcmVkaXQtYWdyaWNvbGUuZnIvY2Fpc3N1ZXJzL0NBQ3JlZGl0QWdyaWNvbGVTZXJ2ZXIucDdjMD8GCCsGAQUFBzABhjNodHRwOi8vb2NzcC1wcml2LXBraS5jcmVkaXQtYWdyaWNvbGUuZnIvb2NzcC9zZXJ2ZXIwDQYJKoZIhvcNAQELBQADggEBAHKJeGwrj6mG5pXQ+JWOfWP0zqxkwjVMKStsw2hfxeAhlQd/+xCTNdTAKIujt1l0Qmz5Dc7DQe+LqpXQZM9YAadIFcvi52zzdVrgnMbJxd+rOQYId1ikP9OAbJV6smZ7XfoVcuHB5z8566p1ydu0RLrJQwe16zd8+Xa/thjg3AOgz35oF3r01sGgZkEFskr6vwu4qvNkGNld+bCNVajOn7A+8Aeu6gNeA4HtvwZYs1Rdx74luuZuG2rpqH6g3t1qMBGQixs6UEvnjZoqTVcr1Kq56Se8Di7Lf3xIWa8iTKMRVLjo+731PEf5Cyb4wBaW7pqfjmZ9nXUMnFJ7+lsEkoM=', 'signingCertificate');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'true', 'postBindingLogout');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified', 'nameIDPolicyFormat');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'true', 'postBindingResponse');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'https://intra.usignon.qua.cm.par.emea.cib/samlv2/SLOIdP/2025_NEMMO_FrNemmoFinancementImmobilier', 'singleLogoutServiceUrl');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'RSA_SHA256', 'signatureAlgorithm');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'true', 'useJwksUrl');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'IMPORT', 'syncMode');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'false', 'postBindingAuthnRequest');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'false', 'wantAuthnRequestsSigned');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'https://intra.usignon.qua.cm.par.emea.cib/samlv2/AccueilAuth/IdPAccess/2025_NEMMO_FrNemmoFinancementImmobilier', 'singleSignOnServiceUrl');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'false', 'addExtensionsElementWithKeyInfo');
INSERT INTO keycloak.identity_provider_config VALUES ('900e02a0-2990-4ddb-9060-e7cdb5801ad9', 'SUBJECT', 'principalType');


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.identity_provider_mapper VALUES ('d128bb42-ecdd-43f7-b626-eb622f4bb9d4', 'Email', 'USIGNON-INTRANET', 'saml-user-attribute-idp-mapper', 'nemmo');
INSERT INTO keycloak.identity_provider_mapper VALUES ('9c9c4e9b-ee74-43d1-878e-2384662261c2', 'First Name', 'USIGNON-INTRANET', 'saml-user-attribute-idp-mapper', 'nemmo');
INSERT INTO keycloak.identity_provider_mapper VALUES ('25cd8307-6421-4dad-94e4-d6501dbcf812', 'Last Name', 'USIGNON-INTRANET', 'saml-user-attribute-idp-mapper', 'nemmo');
INSERT INTO keycloak.identity_provider_mapper VALUES ('1125b0ac-5ee0-4cde-8377-c48f3307bbd5', 'user-type', 'USIGNON-INTRANET', 'hardcoded-attribute-idp-mapper', 'nemmo');
INSERT INTO keycloak.identity_provider_mapper VALUES ('7699855f-fae9-4b5f-abc5-d774a697f9da', 'role-signataire', 'USIGNON-INTRANET', 'saml-role-idp-mapper', 'nemmo');
INSERT INTO keycloak.identity_provider_mapper VALUES ('3000ad7f-8445-465f-986b-4596b2268ace', 'role-super-user', 'USIGNON-INTRANET', 'saml-role-idp-mapper', 'nemmo');


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.idp_mapper_config VALUES ('d128bb42-ecdd-43f7-b626-eb622f4bb9d4', 'IMPORT', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('d128bb42-ecdd-43f7-b626-eb622f4bb9d4', 'Email', 'user.attribute');
INSERT INTO keycloak.idp_mapper_config VALUES ('d128bb42-ecdd-43f7-b626-eb622f4bb9d4', 'Email', 'attribute.friendly.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('d128bb42-ecdd-43f7-b626-eb622f4bb9d4', 'email', 'attribute.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('9c9c4e9b-ee74-43d1-878e-2384662261c2', 'IMPORT', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('9c9c4e9b-ee74-43d1-878e-2384662261c2', 'FirstName', 'user.attribute');
INSERT INTO keycloak.idp_mapper_config VALUES ('9c9c4e9b-ee74-43d1-878e-2384662261c2', 'FirstName', 'attribute.friendly.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('9c9c4e9b-ee74-43d1-878e-2384662261c2', 'given_name', 'attribute.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('25cd8307-6421-4dad-94e4-d6501dbcf812', 'IMPORT', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('25cd8307-6421-4dad-94e4-d6501dbcf812', 'LastName', 'user.attribute');
INSERT INTO keycloak.idp_mapper_config VALUES ('25cd8307-6421-4dad-94e4-d6501dbcf812', 'LastName', 'attribute.friendly.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('25cd8307-6421-4dad-94e4-d6501dbcf812', 'family_name', 'attribute.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('1125b0ac-5ee0-4cde-8377-c48f3307bbd5', 'FORCE', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('1125b0ac-5ee0-4cde-8377-c48f3307bbd5', 'banque', 'attribute.value');
INSERT INTO keycloak.idp_mapper_config VALUES ('1125b0ac-5ee0-4cde-8377-c48f3307bbd5', 'type', 'attribute');
INSERT INTO keycloak.idp_mapper_config VALUES ('7699855f-fae9-4b5f-abc5-d774a697f9da', 'FORCE', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('7699855f-fae9-4b5f-abc5-d774a697f9da', 'signataire', 'attribute.value');
INSERT INTO keycloak.idp_mapper_config VALUES ('7699855f-fae9-4b5f-abc5-d774a697f9da', 'signataire', 'role');
INSERT INTO keycloak.idp_mapper_config VALUES ('7699855f-fae9-4b5f-abc5-d774a697f9da', 'authorizations', 'attribute.name');
INSERT INTO keycloak.idp_mapper_config VALUES ('3000ad7f-8445-465f-986b-4596b2268ace', 'FORCE', 'syncMode');
INSERT INTO keycloak.idp_mapper_config VALUES ('3000ad7f-8445-465f-986b-4596b2268ace', 'super-user', 'attribute.value');
INSERT INTO keycloak.idp_mapper_config VALUES ('3000ad7f-8445-465f-986b-4596b2268ace', 'super-user', 'role');
INSERT INTO keycloak.idp_mapper_config VALUES ('3000ad7f-8445-465f-986b-4596b2268ace', 'authorizations', 'attribute.name');


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.keycloak_group VALUES ('506ca814-ae9f-4c3a-be6a-ddb3ffa11bee', 'Nexity-demo', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', 'BouyguesImmo-demo', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('6137be69-54d4-4d49-8920-3a8d7ee91e84', 'Pichet-demo', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('dab5c617-770d-4c86-985d-8edc2ed1e2ab', '1-Banque de Lyon', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('e5d44a89-0d0e-48c9-b255-b40e20bea1c7', '2-Crédit Populaire du Sud', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('21455db9-ae33-4b61-8d82-923e33d090fe', '3-Caisse du Nord Pas de Calais', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('7750f4cb-7af6-4f74-8b5d-a6c5009846c7', '1-Promotion Territoire', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('2fc1fa19-4c72-4179-abeb-fe369913e1e5', '2-Immobillissimo', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('a4c6e39f-ed38-459f-87e8-48e74044ad81', '3-Art et Immo', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('dbe944e0-8dea-450d-b8a3-d5bc84dd361d', 'CACIB', ' ', 'nemmo');
INSERT INTO keycloak.keycloak_group VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', 'CACIB-demo', ' ', 'nemmo');


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.keycloak_role VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'master', false, '${role_admin}', 'admin', 'master', NULL, 'master');
INSERT INTO keycloak.keycloak_role VALUES ('b3dddbc2-6173-4524-86cc-90d52ea2b928', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, 'master');
INSERT INTO keycloak.keycloak_role VALUES ('c3cbbc03-5f28-45db-8385-8532fe3baa3d', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_create-client}', 'create-client', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('4ed8f887-95e5-4f13-bfcc-c6c1c12591c5', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-realm}', 'view-realm', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('60409405-84fe-471f-bb5f-fc1883ae43cb', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-users}', 'view-users', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('1be9d0a7-87d6-4330-825a-9f6a1b572bfe', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-clients}', 'view-clients', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('8b455207-da34-42bf-bf38-363998f73e46', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-events}', 'view-events', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('e5df70c1-df1f-4cd8-bec2-4c99d3d6c2e3', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('14c01a47-f67c-4b52-9910-c4520d92b4b7', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_view-authorization}', 'view-authorization', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('afd69109-4118-408d-8cc3-7887ace2ca06', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-realm}', 'manage-realm', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('7d6e3074-c4e5-4240-9856-88e3dc0a3485', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-users}', 'manage-users', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('caac33ba-b9d0-46c2-8b49-099d3809f0b1', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-clients}', 'manage-clients', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('23b1ee94-3dc5-4fb0-9e2e-8b6ec1f1c03b', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-events}', 'manage-events', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('c24a860b-6c76-4c03-b7dd-1f49baef5cac', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('03d7cc6d-4fbb-4be5-99d5-4a72836e878a', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_manage-authorization}', 'manage-authorization', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('ac09a37e-8bd1-4435-9c04-87e737f8522f', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_query-users}', 'query-users', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('93b248dc-564a-44a5-b101-2fdf2c771559', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_query-clients}', 'query-clients', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('b53788a3-09f5-417b-a55c-d9058d799bac', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_query-realms}', 'query-realms', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('636e99bd-9667-4b69-a934-753c5022d746', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_query-groups}', 'query-groups', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d6dc15b8-8878-4075-ba52-9c890ae1c8e1', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_view-profile}', 'view-profile', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('b31953ee-700d-43e1-be79-80f083c55f6b', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_manage-account}', 'manage-account', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('950a53d8-820d-4a45-9181-5dc855b0945c', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_manage-account-links}', 'manage-account-links', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('9a6188d5-21f1-4bc0-b074-7cfda1551105', 'e58c32da-40ae-450b-a00d-85781bc5923f', true, '${role_read-token}', 'read-token', 'master', 'e58c32da-40ae-450b-a00d-85781bc5923f', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d6f21c0c-c463-4184-9879-96495d38256d', '2742e775-01e8-42e6-a97f-f6c569ffafa8', true, '${role_impersonation}', 'impersonation', 'master', '2742e775-01e8-42e6-a97f-f6c569ffafa8', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d003d60a-c957-418c-92ca-e174734dfa49', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, 'master');
INSERT INTO keycloak.keycloak_role VALUES ('596b9808-292a-4ad6-8246-1ae80a7e1adc', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master');
INSERT INTO keycloak.keycloak_role VALUES ('58378ae6-c012-4e71-92aa-1b4ff0f12e09', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_create-client}', 'create-client', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('91ee5515-f520-46c7-b608-a26a3879b79e', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-realm}', 'view-realm', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('319d2046-fd16-484d-8b94-262a8453b02c', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-users}', 'view-users', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('af266eb3-cbc8-4adb-920e-625114245d6b', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-clients}', 'view-clients', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('6b8f8859-070d-4414-bf06-f4380db44682', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-events}', 'view-events', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('c59e6760-7fda-4244-82d8-146dcd2507cf', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('0ec4d644-7d8f-4e96-b8ca-cf33c59633a7', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_view-authorization}', 'view-authorization', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('1d90fd03-d831-4f8a-b7f4-04208d6094cf', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-realm}', 'manage-realm', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('bd5f0a68-06ff-49b3-89dd-430a005daba7', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-users}', 'manage-users', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('b6cb83a0-432d-4220-9204-45687193d33e', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-clients}', 'manage-clients', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('80f23bb0-0c54-400c-aff3-007dfa640892', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-events}', 'manage-events', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('287c9ba0-c6e3-4a13-ae92-1e832eefe57d', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('cde2b875-7866-497a-b923-27cb8f5d0f1a', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('710028e9-8b88-4ea6-9250-3bfe9a434be6', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_query-users}', 'query-users', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('aeedae19-13eb-4b1d-b84e-ab698cfc92b7', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_query-clients}', 'query-clients', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d02fb1db-79b0-477f-9707-5b536af36d9e', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_query-realms}', 'query-realms', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('e0893c53-06da-4e0f-a369-8a45811e6493', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_query-groups}', 'query-groups', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('4cc2a2b7-0d1e-4495-8c2b-89aec4e02f38', 'nemmo', false, NULL, 'banque', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'nemmo', false, NULL, 'super-user', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'nemmo', false, NULL, 'signataire', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'nemmo', false, '${role_uma_authorization}', 'uma_authorization', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('f1544f73-54bb-4bce-944b-94c04de771fd', 'nemmo', false, NULL, 'admin', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('e6e12a9f-f9e7-41ea-a90d-2e536d0ec083', 'nemmo', false, NULL, 'promoteur', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'nemmo', false, '${role_offline-access}', 'offline_access', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('1f2d55b5-2e0e-4683-9f0d-b1dda328213b', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-realm}', 'manage-realm', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('7937bce2-c342-4376-a3b0-02e9fe99d779', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_realm-admin}', 'realm-admin', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('7edd347c-85a1-4980-a57e-d6182ef0cf99', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_create-client}', 'create-client', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('a2b23246-41bc-415e-b2dd-d9cf42a01b29', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-identity-providers}', 'view-identity-providers', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('4c6703a6-0db6-4af2-8ce8-44b500cd3fa7', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-clients}', 'manage-clients', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('47e21678-887d-4dce-9e68-c34488fccaa6', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-events}', 'manage-events', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('06f8a2c6-fe1d-4158-bacf-e4194a6d796a', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_query-users}', 'query-users', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('0bfd5fc6-29f4-4649-b9d9-24c595176ec0', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-authorization}', 'manage-authorization', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('907f94a8-c01e-4809-8930-be8bb9971dcd', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_query-realms}', 'query-realms', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('71d859a0-bf92-4a50-972e-ca674c1692e9', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-users}', 'view-users', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('9d10aa42-3306-4765-bb1f-2dcdfe85a1d1', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_query-clients}', 'query-clients', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('dd8a1e31-a169-4718-8055-dc9d4ceb7a73', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-realm}', 'view-realm', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('9f2952b0-c1d1-44c0-82d9-a302cc6be22d', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-authorization}', 'view-authorization', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('16b30e25-e050-422f-b510-f6bb9fdef85c', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-clients}', 'view-clients', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('b7614463-bb39-4c2a-8a4e-7db42b995d8d', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-users}', 'manage-users', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('349efc79-eb10-4425-93c6-d3af53c6f4ec', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_view-events}', 'view-events', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d1175517-0b12-4ef3-b8b3-3ddbcf364964', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_query-groups}', 'query-groups', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('e53f326a-2ca7-46e1-ad14-060e066578cb', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_impersonation}', 'impersonation', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('dabfab70-5ab1-498a-acc1-b397bea5200e', '67c91bd4-0723-4d03-b34c-741538893909', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'nemmo', '67c91bd4-0723-4d03-b34c-741538893909', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('720b7bd9-96ee-4ea1-98ae-72acd9b46b54', '4a1cfe0d-b897-4047-91ef-cb809a1b0a28', true, '${role_read-token}', 'read-token', 'nemmo', '4a1cfe0d-b897-4047-91ef-cb809a1b0a28', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_view-profile}', 'view-profile', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_manage-account}', 'manage-account', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('035a50c6-62c5-4d36-87e6-fe977e417756', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_manage-account-links}', 'manage-account-links', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('0aa35266-c441-4431-9edc-a622eefb283b', 'e448c41d-f4a5-47c9-b223-26313ea437a3', true, '${role_impersonation}', 'impersonation', 'master', 'e448c41d-f4a5-47c9-b223-26313ea437a3', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('d8dde791-57fc-482c-9061-5d67f0d24385', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_view-applications}', 'view-applications', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('cf52ca6a-89c1-4872-9b5f-56af03fc0756', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_view-consent}', 'view-consent', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('de1db64b-1155-45d7-b740-311ec75deb57', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', true, '${role_manage-consent}', 'manage-consent', 'master', '0712deed-1dcf-4335-b0d9-2bbd55b9a002', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('e7adcf0a-c984-49e1-ba72-d658c823b80e', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_view-applications}', 'view-applications', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('ad524d16-71ae-4924-a1c6-9b9e1e30a200', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_view-consent}', 'view-consent', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('00083480-e822-4a2a-a798-09269996e2c8', '7d10241e-247d-41a1-ba0b-e60074994db1', true, '${role_manage-consent}', 'manage-consent', 'nemmo', '7d10241e-247d-41a1-ba0b-e60074994db1', NULL);
INSERT INTO keycloak.keycloak_role VALUES ('bcd25045-bc63-4efc-83aa-1a70a9d30de1', 'nemmo', false, NULL, 'garantie-visibility', 'nemmo', NULL, 'nemmo');
INSERT INTO keycloak.keycloak_role VALUES ('eebeb549-94d9-4c85-8525-43d1d2060fa8', 'nemmo', false, NULL, 'lettre-accord-visibility', 'nemmo', NULL, 'nemmo');


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.migration_model VALUES ('SINGLETON', '4.6.0', 0);
INSERT INTO keycloak.migration_model VALUES ('uhg05', '9.0.0', 1582205652);
INSERT INTO keycloak.migration_model VALUES ('u2xrf', '9.0.2', 1586446425);
INSERT INTO keycloak.migration_model VALUES ('fpi0t', '10.0.1', 1591276113);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.protocol_mapper VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '055f28e6-65e2-41a4-9e97-050177016adb', NULL);
INSERT INTO keycloak.protocol_mapper VALUES ('84c2dc3d-c1b8-4116-b00f-a2d67f66f7e7', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'ea0287b6-3598-4b3b-bf75-638783aee572');
INSERT INTO keycloak.protocol_mapper VALUES ('a574ba94-5116-4b08-9c34-863cd617938f', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '459e27e0-3f59-493c-95b7-cc8c66d6691f');
INSERT INTO keycloak.protocol_mapper VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'c0574d71-d069-4d8f-9c26-93a3205ce722');
INSERT INTO keycloak.protocol_mapper VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'c0574d71-d069-4d8f-9c26-93a3205ce722');
INSERT INTO keycloak.protocol_mapper VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '8b3c07c1-8c36-4d50-823c-40dbc5c844c2');
INSERT INTO keycloak.protocol_mapper VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24');
INSERT INTO keycloak.protocol_mapper VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd1c44ced-5118-40ca-afcb-e2d8baaf5d24');
INSERT INTO keycloak.protocol_mapper VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '8fb301d7-b5d2-44bf-b506-896db8e37493');
INSERT INTO keycloak.protocol_mapper VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '8fb301d7-b5d2-44bf-b506-896db8e37493');
INSERT INTO keycloak.protocol_mapper VALUES ('f2dc069b-8384-4126-9352-478c84455478', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '8fb301d7-b5d2-44bf-b506-896db8e37493');
INSERT INTO keycloak.protocol_mapper VALUES ('48e1172d-e856-457c-94a5-8a7af9da00e9', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '47b8755b-f051-4500-a34a-ea3516235ad3');
INSERT INTO keycloak.protocol_mapper VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8d5ae196-38b0-4db9-bb06-cc25de0cecb0');
INSERT INTO keycloak.protocol_mapper VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '8d5ae196-38b0-4db9-bb06-cc25de0cecb0');
INSERT INTO keycloak.protocol_mapper VALUES ('871e580b-e725-4d76-81a7-cd78a00af685', 'role list', 'saml', 'saml-role-list-mapper', NULL, '15e24397-8f92-4369-833b-2975a9c51503');
INSERT INTO keycloak.protocol_mapper VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('a319afa8-c652-4b2b-b24a-4cd3098005bd', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd31b8a1d-1315-4a6e-98c5-b6f9bf7c6f18');
INSERT INTO keycloak.protocol_mapper VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'ad2c1a97-efa9-48c4-af23-f1060416235e');
INSERT INTO keycloak.protocol_mapper VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'ad2c1a97-efa9-48c4-af23-f1060416235e');
INSERT INTO keycloak.protocol_mapper VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'fea827e8-5af8-4498-9c30-f8ae63aba4b5');
INSERT INTO keycloak.protocol_mapper VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '72553a2a-d944-4e5e-9243-2cc1577338dc');
INSERT INTO keycloak.protocol_mapper VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '72553a2a-d944-4e5e-9243-2cc1577338dc');
INSERT INTO keycloak.protocol_mapper VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '7d4d6194-1dae-4498-b6a5-504605b48461');
INSERT INTO keycloak.protocol_mapper VALUES ('2776fe1b-58f9-4dc1-beb4-fe66efa691a9', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '7d4d6194-1dae-4498-b6a5-504605b48461');
INSERT INTO keycloak.protocol_mapper VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '7d4d6194-1dae-4498-b6a5-504605b48461');
INSERT INTO keycloak.protocol_mapper VALUES ('2928cf5b-20ef-4376-80f2-a507762bdf5e', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '388612c1-8a46-4dc0-b62c-77e137c3564b');
INSERT INTO keycloak.protocol_mapper VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '7caa3483-d57f-4b2a-9d8c-8724af22fb0a');
INSERT INTO keycloak.protocol_mapper VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7caa3483-d57f-4b2a-9d8c-8724af22fb0a');
INSERT INTO keycloak.protocol_mapper VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'f3d879da-578c-44e8-a63e-eb4b2fe316ef', NULL);
INSERT INTO keycloak.protocol_mapper VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'Groups Mapper', 'openid-connect', 'oidc-group-membership-mapper', 'f73f42ff-5026-4abe-a679-8d96f645dce3', NULL);
INSERT INTO keycloak.protocol_mapper VALUES ('fabb7a02-c488-4271-935b-e12417d1efbd', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', NULL);
INSERT INTO keycloak.protocol_mapper VALUES ('a86a093e-6976-49e3-99f9-9d1595934784', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '090239b5-c62b-463f-81a7-6423926b2aaa', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'locale', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'locale', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('d3eaf5c9-2dc7-4e5e-a577-c019c3c5a7a7', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('84c2dc3d-c1b8-4116-b00f-a2d67f66f7e7', 'false', 'single');
INSERT INTO keycloak.protocol_mapper_config VALUES ('84c2dc3d-c1b8-4116-b00f-a2d67f66f7e7', 'Basic', 'attribute.nameformat');
INSERT INTO keycloak.protocol_mapper_config VALUES ('84c2dc3d-c1b8-4116-b00f-a2d67f66f7e7', 'Role', 'attribute.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a574ba94-5116-4b08-9c34-863cd617938f', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a574ba94-5116-4b08-9c34-863cd617938f', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a574ba94-5116-4b08-9c34-863cd617938f', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'lastName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'family_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c151a2f4-0884-42c3-a4fa-77f3ceea00e4', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'firstName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'given_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('68f20b18-aeff-4020-8044-8a60ad537215', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'middleName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'middle_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b292851e-8b34-4136-a017-20fc12a7e569', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'nickname', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'nickname', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4bf6fed4-951b-46da-94b3-ffaabceae5a8', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'username', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'preferred_username', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01fe3fa1-0365-47db-b8d6-05cb45cba450', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'profile', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'profile', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92d9fab0-4b06-40ca-bfcc-73bc40876ba4', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'picture', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'picture', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('37aa7f8d-8f3b-4e0b-b496-a1cbfce5aa1b', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'website', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'website', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('883f1924-dc23-4e04-b6e6-1d5624287f8f', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'gender', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'gender', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('74507454-2e28-418e-b54e-536f64ce9f11', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'birthdate', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'birthdate', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('52acb4a3-5c9c-42b9-8463-43f431a4939e', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'zoneinfo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'zoneinfo', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ea94132f-7d07-4bee-a836-aa357435b9fa', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'locale', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'locale', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8905b5a8-498c-4a1f-8314-058480dca5ac', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'updatedAt', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'updated_at', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('9d53315b-b45a-4c0f-9bad-311090dab242', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'email', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'email', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c8e40f1b-209d-400b-809b-eb7414f3b5d1', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'emailVerified', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'email_verified', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2a55e35e-efe6-4b2b-9af2-b5c4b0cc4992', 'boolean', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'formatted', 'user.attribute.formatted');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'country', 'user.attribute.country');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'postal_code', 'user.attribute.postal_code');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'street', 'user.attribute.street');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'region', 'user.attribute.region');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('ca21afee-d549-4326-b5e0-03436afc216f', 'locality', 'user.attribute.locality');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'phoneNumber', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'phone_number', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('1e2e6694-eeb3-4bbc-8a31-4a87838df9c1', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'phoneNumberVerified', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'phone_number_verified', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('819292f5-9efa-40fb-9195-300a7086352c', 'boolean', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'realm_access.roles', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7057f948-c0dd-416a-803b-ed1bf93c8e69', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('2fbef098-9559-4985-8967-38755ab48a5c', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'username', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'upn', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('67954e05-c7e8-4c65-95a6-00d08575976c', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'groups', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('aec3d42b-25e2-4221-b5e2-228c4791486d', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('871e580b-e725-4d76-81a7-cd78a00af685', 'false', 'single');
INSERT INTO keycloak.protocol_mapper_config VALUES ('871e580b-e725-4d76-81a7-cd78a00af685', 'Basic', 'attribute.nameformat');
INSERT INTO keycloak.protocol_mapper_config VALUES ('871e580b-e725-4d76-81a7-cd78a00af685', 'Role', 'attribute.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'updatedAt', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'updated_at', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('685970e5-8317-4f6a-8786-d5ddb41a0ff8', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'zoneinfo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'zoneinfo', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('4ccccd6e-e34d-424d-923c-7bfdcee70efc', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'username', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'preferred_username', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f41d4c79-e57f-47fa-a259-12ad3ac8b89f', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'gender', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'gender', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0a71ad12-04c0-46eb-83e0-96414bc6ae22', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'birthdate', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'birthdate', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('63f157bc-6684-4070-8270-f0e29892301d', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'lastName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'family_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('0acfda85-4f48-4432-aae8-bba2d7db9287', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'website', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'website', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('428f528c-1940-4b05-9c93-739c50dcf88b', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'middleName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'middle_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f8170566-ea69-425b-bcb7-42c79ee02ca7', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'firstName', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'given_name', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a2a68d90-a3ce-4b4c-8e7a-155408af6dbb', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a319afa8-c652-4b2b-b24a-4cd3098005bd', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a319afa8-c652-4b2b-b24a-4cd3098005bd', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a319afa8-c652-4b2b-b24a-4cd3098005bd', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'picture', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'picture', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a36127cd-d79b-4581-8935-87d2eb1a4c1a', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'locale', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'locale', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('c425ba9d-7f60-47d7-aa93-296358b1fb40', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'profile', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'profile', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b0ee1f76-243e-4ff7-97a2-5dbae0c7cd3b', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'nickname', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'nickname', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('f67b5d90-a93f-4008-aaa3-e1ab6946ed8c', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'emailVerified', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'email_verified', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('e6673b05-3d16-4efe-b451-ca999d426cc0', 'boolean', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'email', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'email', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('796058fb-9627-4a15-a445-9110af5f0c88', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'formatted', 'user.attribute.formatted');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'country', 'user.attribute.country');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'postal_code', 'user.attribute.postal_code');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'street', 'user.attribute.street');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'region', 'user.attribute.region');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('a4dc9b3c-1d52-4634-a295-f6749b8f690a', 'locality', 'user.attribute.locality');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'phoneNumberVerified', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'phone_number_verified', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('7b168f38-6808-4b20-91a3-c2f340d8dbd9', 'boolean', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'phoneNumber', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'phone_number', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('043f6c05-2930-411d-a6cb-ab01e0a3071a', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('97a831f2-f0d0-4da8-a43e-2ce887daf118', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'realm_access.roles', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('b92ad976-bbe7-4000-ab86-b03644c1b164', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'true', 'multivalued');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'foo', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'groups', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('01d711d2-7a16-4968-b8eb-3675bc3f1f73', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'username', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'upn', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('156932d3-cb8c-4893-8eec-1c7930a87988', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'true', 'userinfo.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'locale', 'user.attribute');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'locale', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('8f24dd6c-77ff-4d20-b694-32d147e61bb0', 'String', 'jsonType.label');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'false', 'full.path');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'true', 'id.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'true', 'access.token.claim');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'groups', 'claim.name');
INSERT INTO keycloak.protocol_mapper_config VALUES ('92e9b0b6-c6d2-4635-a074-8ae17cf853ca', 'true', 'userinfo.token.claim');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '2742e775-01e8-42e6-a97f-f6c569ffafa8', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'c7607473-1418-448c-80c9-beab9806380b', '4f99802f-f223-4bfd-bb94-763632a38792', 'd4ecc75e-aa91-402c-9954-5de7b1dd9f1b', 'a6cd20b2-8e57-4b05-8b37-cb8e00029567', '60a0ff69-3a30-4b20-962b-0b830f402583', 2592000, false, 900, true, false, '2e87f4ea-3146-4f99-883e-cc284d250201', 0, false, 0, 0);
INSERT INTO keycloak.realm VALUES ('nemmo', 60, 300, 864000, NULL, NULL, NULL, true, false, 0, 'nemmo', 'nemmo', 0, 'forceExpiredPasswordChange(999) and specialChars(1) and upperCase(1) and lowerCase(1) and passwordHistory(3) and digits(1) and notUsername(undefined) and length(12)', false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, 'e448c41d-f4a5-47c9-b223-26313ea437a3', 86400, true, 'fr', false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '422eee55-8685-4c9a-b153-67c6b272bc25', 'a54355e6-eaed-4e9b-a3ec-8a7bdb18ff59', '97e5fb92-0cac-43d2-af9c-5eb23e8e419e', '648c367c-9e9d-4558-b963-0ca2bf44041b', 'e968a738-65ce-4f12-a50d-3847b901714f', 2592000, false, 900, true, false, '01aaa93e-995c-40d6-aab5-c15af6953ae6', 0, false, 0, 0);


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('permanentLockout', 'false', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('displayNameHtml', '<div class="kc-logo-text"><span>Keycloak</span></div>', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('bruteForceProtected', 'true', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('failureFactor', '3', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'master');
INSERT INTO keycloak.realm_attribute VALUES ('clientSessionIdleTimeout', '0', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('clientSessionMaxLifespan', '0', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('bruteForceProtected', 'true', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('permanentLockout', 'false', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('waitIncrementSeconds', '60', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('failureFactor', '3', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'nemmo');
INSERT INTO keycloak.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'nemmo');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm_default_roles VALUES ('master', 'd003d60a-c957-418c-92ca-e174734dfa49');
INSERT INTO keycloak.realm_default_roles VALUES ('master', '596b9808-292a-4ad6-8246-1ae80a7e1adc');
INSERT INTO keycloak.realm_default_roles VALUES ('nemmo', '0068e81f-3d76-4779-bc9a-82371b66c45b');
INSERT INTO keycloak.realm_default_roles VALUES ('nemmo', 'cbb68085-fd19-487d-a11d-5ef58cac65fc');


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm_events_listeners VALUES ('master', 'jboss-logging');
INSERT INTO keycloak.realm_events_listeners VALUES ('nemmo', 'jboss-logging');


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm_required_credential VALUES ('password', 'password', true, true, 'master');
INSERT INTO keycloak.realm_required_credential VALUES ('password', 'password', true, true, 'nemmo');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.realm_supported_locales VALUES ('nemmo', 'fr');


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.redirect_uris VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '/admin/master/console/*');
INSERT INTO keycloak.redirect_uris VALUES ('0712deed-1dcf-4335-b0d9-2bbd55b9a002', '/realms/master/account/*');
INSERT INTO keycloak.redirect_uris VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '/admin/nemmo/console/*');
INSERT INTO keycloak.redirect_uris VALUES ('7d10241e-247d-41a1-ba0b-e60074994db1', '/realms/nemmo/account/*');
INSERT INTO keycloak.redirect_uris VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', '/realms/master/account/*');
INSERT INTO keycloak.redirect_uris VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '/realms/nemmo/account/*');
INSERT INTO keycloak.redirect_uris VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', 'https://nemmo-kub-qual.francecentral.cloudapp.azure.com/*');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.required_action_provider VALUES ('17783c87-3357-456f-9c51-64e419d0646c', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO keycloak.required_action_provider VALUES ('2e1b53d5-1885-465d-815c-34fe85aba705', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO keycloak.required_action_provider VALUES ('c81f7e45-521d-4773-9e44-5240fe1ad216', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO keycloak.required_action_provider VALUES ('2b0c6d0c-54b3-4507-8e26-ca44f40e14ae', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO keycloak.required_action_provider VALUES ('c014b66e-af8b-4d04-8643-319defdd6662', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO keycloak.required_action_provider VALUES ('2048ff37-b2e0-4505-ae7e-4b9b4240c6db', 'CONFIGURE_TOTP', 'Configure OTP', 'nemmo', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO keycloak.required_action_provider VALUES ('db73a05b-829a-4dfa-8e03-b5fa46a03b16', 'terms_and_conditions', 'Terms and Conditions', 'nemmo', false, false, 'terms_and_conditions', 20);
INSERT INTO keycloak.required_action_provider VALUES ('f7f0850f-0431-4172-8050-1bdd2ae4a30e', 'UPDATE_PASSWORD', 'Update Password', 'nemmo', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO keycloak.required_action_provider VALUES ('2701ecb0-0f98-4e61-89a7-7edba5c875ed', 'UPDATE_PROFILE', 'Update Profile', 'nemmo', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO keycloak.required_action_provider VALUES ('3d984bfe-efcc-41a2-aaa4-4f0962d06f2c', 'VERIFY_EMAIL', 'Verify Email', 'nemmo', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO keycloak.required_action_provider VALUES ('e65f9a8b-d159-405c-8042-57f2c0464701', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO keycloak.required_action_provider VALUES ('72eb52f4-cb46-4a9b-afab-2a1df28e1cc7', 'update_user_locale', 'Update User Locale', 'nemmo', true, false, 'update_user_locale', 1000);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.scope_mapping VALUES ('6a30e8e9-f4e2-4474-8ed4-a8062b8b8e99', 'b31953ee-700d-43e1-be79-80f083c55f6b');
INSERT INTO keycloak.scope_mapping VALUES ('090239b5-c62b-463f-81a7-6423926b2aaa', '86086e36-8675-47e5-ad23-14c7b9a15f5b');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa', '2c6a1d67-671b-4ad7-bc49-eee9f08bac3f');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '37eb8b5d-76ce-4a73-ab60-d403f8780144', '9623d634-1156-41d3-8f6a-3350dacfbebc');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc', '2a316234-e6cb-4848-ad5e-ba46b83140bb');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f', '6634a34b-5f4a-41fb-b7ac-58b9b0d3a2d4');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '47119950-7d4d-4969-a6c2-3f8190f275c7', '3bc0aeb0-54cd-48fc-bd76-89d1b14f0478');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Rédacteur juridique', '36e5fa4d-560c-4c99-b72c-a3163caf39ab', 'a3439642-1ec6-4c19-adfb-0dc7f25d2ec8');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Rédacteur juridique', '22ce4d09-4285-470f-8480-ea0dc7e13bbc', '9e1d4929-d3f9-47a7-8e14-4f97c21b02dc');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '1d9d71b2-69a0-4feb-aa86-efce0243a28b', '2a5bcecb-439d-4620-a64d-709096ad5536');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8', '5cc81578-7025-4fa3-8e55-aea9135ec020');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'd08cb28d-44bf-4746-978f-414e0ca7d807', 'f4860ae8-7fce-4d5b-8733-843b170dff0c');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '089f4481-bab9-42ac-ae50-278118ed4bff', 'b0eb402d-3e70-4dbe-9eb6-57d3ad2e4b7a');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '8ca3eede-8271-44fa-b824-3875103294e4', '543abb94-d210-4540-b909-c8e7cc4ebe90');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e', '896ecff3-8b75-4bc3-963a-04041a288607');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2', '278cf4ed-9ac8-419b-b3d9-92de5b643f65');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '08552046-8a91-479c-81de-7a5d6e98a156', '836afc29-ea03-4018-9c53-5ec6f6a427e2');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'b338f031-0465-4db4-bf74-8b1e6b4632c9', 'dbe1ac3e-6dea-4611-8d88-db6733665a86');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'fb8c0241-a614-471e-8af5-85301ded1d9e', 'b367b259-82ce-4498-9af2-c003effec651');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '7e4ef3e4-efda-446a-acda-d4bd56c87877', '945dc634-09ac-423e-88d1-bd6e5d8dbae9');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0640977132', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', '6ae2c9b7-4710-415f-a619-c086f291b1f9');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', 'eaff208a-285d-4578-838f-2ed20d44e472', 'e1d16a00-eb6e-4250-9a8d-281cce37c71a');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', '1785affd-eea6-4169-ba05-4729a66f4e73');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', '096043b4-4c49-4a29-9207-0cfc4c406845');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', '5228d7eb-94a9-48fb-906b-91b49fcdf348');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030406', 'beef5e17-7811-4d38-b523-04054a7eeeec', '0c4b81c3-61ef-414e-a39c-97f30c811212');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', 'beef5e17-7811-4d38-b523-04054a7eeeec', '824521f5-5de3-4e11-af33-62b1069c4d8c');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Rédacteur juridique', 'beef5e17-7811-4d38-b523-04054a7eeeec', 'a6e2e7d8-974d-4786-803f-10d504c57f77');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '0', 'beef5e17-7811-4d38-b523-04054a7eeeec', 'bd9fe699-7569-472f-8a05-925a57ae524d');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0640977132', '26d55123-7d46-4271-aaad-3024214ae8c8', 'be54c289-27b6-4fd8-9b5d-e1a97382ee89');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', '26d55123-7d46-4271-aaad-3024214ae8c8', 'ce234eac-83e6-4f09-9d0e-e9210f1288e9');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0640977132', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', 'bf54e4c5-8671-4c4e-b91b-e2df05618e13');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', '535c1ce6-9847-40f4-9622-b6613cccf19b');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', '593f0214-7c4c-4ff4-81bf-ab5c380457d4');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', '4c9efc93-f965-4184-a44b-b711896adeee');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '26d55123-7d46-4271-aaad-3024214ae8c8', 'c847c1f9-38f6-4f2f-ba63-d9ff40053672');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_CREATED', '26d55123-7d46-4271-aaad-3024214ae8c8', '6f69766c-209b-4366-a233-d762c1ccdbda');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_PROJECT_UPLOADED', '26d55123-7d46-4271-aaad-3024214ae8c8', '4810a550-3b28-4f25-8a6c-b4eafdda9bed');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_PROJECT_VALIDATED', '26d55123-7d46-4271-aaad-3024214ae8c8', '236ffbbe-8408-40b7-962e-32ac498333cc');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_SIGN_READY', '26d55123-7d46-4271-aaad-3024214ae8c8', 'c48b1f38-5870-49a2-8476-5049fa553ab7');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_SIGNED', '26d55123-7d46-4271-aaad-3024214ae8c8', '75d38174-37eb-4d4e-af5a-97fe144aa67c');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', '26d55123-7d46-4271-aaad-3024214ae8c8', '0b76bdcf-2f57-491d-83f9-eab9c6b136a6');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '1d25652f-4446-4043-acd1-edf4174efe46', 'e97d0f23-a5c9-4555-a043-a1ce2b165eaa');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', '1d25652f-4446-4043-acd1-edf4174efe46', '501ef83a-97f2-45b8-9ba4-f06011602169');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '1d25652f-4446-4043-acd1-edf4174efe46', '1e9a421e-100d-43da-9eb4-e39abff2bf30');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', '1d25652f-4446-4043-acd1-edf4174efe46', '79f14e33-7ce7-487c-b67a-1eda5f592914');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'aae890b1-c978-444c-80e8-29c68bb005a0', '4a0c7574-b925-4d4d-bc12-a69ce081f212');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', 'aae890b1-c978-444c-80e8-29c68bb005a0', '2b61e4dd-2c3c-49aa-b3af-7d1215f4f7ef');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', 'aae890b1-c978-444c-80e8-29c68bb005a0', '05262b53-baa6-4fef-ae11-115cd4d3fbdd');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', 'aae890b1-c978-444c-80e8-29c68bb005a0', '06234b23-7f70-44ea-b4c9-b3270b292675');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0640977132', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', 'f69f3bb5-9fed-4cf3-b347-260946ca8db3');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', '8343ccb3-e053-452d-af0a-dfee0b020159');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', '41df953e-b384-4c6f-aa04-33358501f86c');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_PROJECT_UPLOADED', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', '7905f633-2413-4449-b39b-2505fcdcd801');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_PROJECT_VALIDATED', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', 'be2f772c-b7e6-4a70-8298-fd8e781e6e6f');
INSERT INTO keycloak.user_attribute VALUES ('disabledNotifications', 'GARANTIE_SIGNED', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', '74521555-6b7d-4610-bb70-1d2d63bcf5d4');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa', 'fe22b010-0511-4230-a85c-7846aa834d8b');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '37eb8b5d-76ce-4a73-ab60-d403f8780144', 'c4153cb4-02f1-4e35-a038-fc5cde8e6ccb');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc', '69e8c8db-ec37-4fa5-af4e-42c360c45f1f');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f', '44f2bbc8-79da-4303-8260-af7d592a53d1');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '47119950-7d4d-4969-a6c2-3f8190f275c7', '244ca7ce-09e5-46e3-b3ca-6a7a31adf280');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '36e5fa4d-560c-4c99-b72c-a3163caf39ab', '6226e351-f653-4f22-a89e-ee48c9df47b9');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '22ce4d09-4285-470f-8480-ea0dc7e13bbc', '9f819086-4a3d-4210-ae38-806390430d7c');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '1d9d71b2-69a0-4feb-aa86-efce0243a28b', '91eef9c5-c441-4941-af28-eb59ed96f1dd');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8', '913b5158-a777-46f7-81b9-72056cb8ccd5');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'd08cb28d-44bf-4746-978f-414e0ca7d807', '7b6b4142-dff2-4e2d-b6fa-6b7fd30fe44a');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '089f4481-bab9-42ac-ae50-278118ed4bff', '92047973-5d5a-46b1-b49f-2647e564c830');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '8ca3eede-8271-44fa-b824-3875103294e4', 'acb64dce-3c40-4752-9e6a-18cb88dbcbc6');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e', '479c36de-0093-4c6f-a497-c33190fd9509');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2', '5fad4430-d7f5-420c-9421-4bada999585e');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '08552046-8a91-479c-81de-7a5d6e98a156', 'e3418cc6-2e8b-412a-8d79-86013d0c327b');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'b338f031-0465-4db4-bf74-8b1e6b4632c9', '7abdd052-3d08-42b1-b7a8-9f4f80a2a9a9');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'fb8c0241-a614-471e-8af5-85301ded1d9e', '2bdbbec9-31b4-4501-bffe-3d965bee87ab');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '7e4ef3e4-efda-446a-acda-d4bd56c87877', '7253c7fc-2b7a-4c23-b7b3-811b3d31d5c8');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '1', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8', 'ddcd4d45-cf46-41dd-a7c5-95c8e340c874');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', 'eaff208a-285d-4578-838f-2ed20d44e472', '0fe9674c-cdf4-44ff-99f4-5766bb9a4962');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0611943510', '755ef19b-4194-4681-9098-5c7192206456', 'c3348d53-f51f-4318-b556-b4e6e3ee536a');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', '755ef19b-4194-4681-9098-5c7192206456', 'e6b6c4a3-bd18-474d-b6c6-ac4de696a01e');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '755ef19b-4194-4681-9098-5c7192206456', '10c1f061-e7b9-4c8f-9bf3-569153184e6e');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '0', '755ef19b-4194-4681-9098-5c7192206456', '1f6c22f3-3f02-4465-8327-decfbfbc49a2');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a', 'ae27c6be-029f-4fa8-9d7f-f9cd14ef32d7');
INSERT INTO keycloak.user_attribute VALUES ('idProfileImage', '', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a', '981971ae-bf31-48ad-9a4c-80c2efc15c96');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé d''affaires', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a', '5ad930b1-1b13-4fce-a1d2-856396c819d7');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '0', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a', '98883dbf-7668-49b2-94bc-fa2716085156');
INSERT INTO keycloak.user_attribute VALUES ('phoneNumber', '0102030405', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433', '320aef66-409c-4761-9759-f6ec07fe9458');
INSERT INTO keycloak.user_attribute VALUES ('jobTitle', 'Chargé de financements', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433', '5915a2fa-5021-42cf-b3e7-89ce33ca8c5c');
INSERT INTO keycloak.user_attribute VALUES ('readConditionGeneraleUtilisationVersion', '0', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433', '396be97e-0cd5-47fb-a7e4-69ae19309304');
INSERT INTO keycloak.user_attribute VALUES ('type', 'banque', 'e30c2c51-b88c-4038-b01d-08dc40f937c2', 'a67cbdfa-b123-4b44-9e4e-7ec232b684fb');


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.user_entity VALUES ('ae630a84-d508-4f3b-b6fd-a118a202c824', NULL, '155919dc-395d-4be1-a6bf-7e13655c08ce', false, true, NULL, NULL, NULL, 'master', 'admin', 1579097679664, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('14f5ce80-a57d-4d38-b3b6-710c6960340d', NULL, '72c91989-dea9-4f3d-8f44-442893756fd7', false, true, NULL, NULL, NULL, 'master', 'nemmo', 1579098056339, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('2169089e-b586-4b3d-9704-e0d1ff1f1b7f', 'ange-demo@ca-nemmo.com', 'ange-demo@ca-nemmo.com', false, true, NULL, 'Ange', 'Demo', 'nemmo', 'ange-demo', 1589207817592, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('1afdbf62-71cd-4b08-a50e-0e57a7d752aa', 'yohann-demo@ca-nemmo.com', 'yohann-demo@ca-nemmo.com', false, true, NULL, 'Yohann', 'Demo', 'nemmo', 'yohann-demo', 1589207816916, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('37eb8b5d-76ce-4a73-ab60-d403f8780144', 'anne-demo@ca-nemmo.com', 'anne-demo@ca-nemmo.com', false, true, NULL, 'Anne', 'Demo', 'nemmo', 'anne-demo', 1589207817153, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('4ec413fe-fecb-457e-8bea-8b5f4f5226cc', 'xavier-demo@ca-nemmo.com', 'xavier-demo@ca-nemmo.com', false, true, NULL, 'Xavier', 'Demo', 'nemmo', 'xavier-demo', 1589207817321, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8', 'benedicte-ndemo@p-nemmo.com', 'benedicte-ndemo@p-nemmo.com', false, true, NULL, 'Bénédicte', 'Demo', 'nemmo', 'benedicte-ndemo', 1589207818795, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('6f49d28f-0bc2-4be0-8b7e-48a83addbbf2', 'emmanuel-bidemo@p-nemmo.com', 'emmanuel-bidemo@p-nemmo.com', false, true, NULL, 'Emmanuel', 'Demo', 'nemmo', 'emmanuel-bidemo', 1589207819995, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('08552046-8a91-479c-81de-7a5d6e98a156', 'camille-bidemo@p-nemmo.com', 'camille-bidemo@p-nemmo.com', false, true, NULL, 'Camille', 'Demo', 'nemmo', 'camille-bidemo', 1589207820304, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('1c97d99c-df2f-4064-a2b3-fce31e4beb9a', 'bertrand2@b2-nemmo.com', 'bertrand2@b2-nemmo.com', false, true, NULL, 'Bertrand', 'Cassel', 'nemmo', 'bertrand2', 1589207821944, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('755ef19b-4194-4681-9098-5c7192206456', 'perrine3@p3-nemmo.com', 'perrine3@p3-nemmo.com', false, true, NULL, 'Perrine', 'Cottilard', 'nemmo', 'perrine3', 1589207823097, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('26d55123-7d46-4271-aaad-3024214ae8c8', 'pierre1@p1-nemmo.com', 'pierre1@p1-nemmo.com', false, true, NULL, 'Pierre', 'Desproges', 'nemmo', 'pierre1', 1589207823327, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('eaff208a-285d-4578-838f-2ed20d44e472', 'pierre3@p3-nemmo.com', 'pierre3@p3-nemmo.com', false, true, NULL, 'Pierre', 'Belmondo', 'nemmo', 'pierre3', 1589207823873, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('47119950-7d4d-4969-a6c2-3f8190f275c7', 'paul-demo@ca-nemmo.com', 'paul-demo@ca-nemmo.com', false, true, NULL, 'Paul', 'Demo', 'nemmo', 'paul-demo', 1589207817664, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('22ce4d09-4285-470f-8480-ea0dc7e13bbc', 'muriel-demo@ca-nemmo.com', 'muriel-demo@ca-nemmo.com', false, true, NULL, 'Muriel', 'Demo', 'nemmo', 'muriel-demo', 1589207818088, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('d08cb28d-44bf-4746-978f-414e0ca7d807', 'yann-ndemo@p-nemmo.com', 'yann-ndemo@p-nemmo.com', false, true, NULL, 'Yann', 'Demo', 'nemmo', 'yann-ndemo', 1589207819053, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('089f4481-bab9-42ac-ae50-278118ed4bff', 'ludovic-bidemo@p-nemmo.com', 'ludovic-bidemo@p-nemmo.com', false, true, NULL, 'Ludovic', 'Demo', 'nemmo', 'ludovic-bidemo', 1589207819224, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('a59202ab-a3a9-4ed3-aa00-4dc29d62398e', 'jean-sebastien-bidemo@p-nemmo.com', 'jean-sebastien-bidemo@p-nemmo.com', false, true, NULL, 'Jean-Sébastien', 'Demo', 'nemmo', 'jean-sebastien-bidemo', 1589207819736, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('aae890b1-c978-444c-80e8-29c68bb005a0', 'beatrice2@b2-nemmo.com', 'beatrice2@b2-nemmo.com', false, true, NULL, 'Béatrice', 'Adjani', 'nemmo', 'beatrice2', 1589207821339, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('7e4ef3e4-efda-446a-acda-d4bd56c87877', 'beatrice3@b3-nemmo.com', 'beatrice3@b3-nemmo.com', false, true, NULL, 'Béatrice', 'Bardot', 'nemmo', 'beatrice3', 1589207821641, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('e963aa87-53d7-4dc8-90fe-2bf6a548dac8', 'bertrand1@b1-nemmo.com', 'bertrand1@b1-nemmo.com', false, true, NULL, 'Bertrand', 'Montand', 'nemmo', 'bertrand1', 1589207822059, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('beef5e17-7811-4d38-b523-04054a7eeeec', 'bertrand3@b3-nemmo.com', 'bertrand3@b3-nemmo.com', false, true, NULL, 'Bertrand', 'Magimel', 'nemmo', 'bertrand3', 1589207822268, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('9d7d2d3b-242a-4220-8a06-921cfa4ec6fc', 'perrine1@p1-nemmo.com', 'perrine1@p1-nemmo.com', false, true, NULL, 'Perrine', 'Frot', 'nemmo', 'perrine1', 1589207822541, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('1d25652f-4446-4043-acd1-edf4174efe46', 'perrine2@p2-nemmo.com', 'perrine2@p2-nemmo.com', false, true, NULL, 'Perrine', 'Baye', 'nemmo', 'perrine2', 1589207822740, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('36e5fa4d-560c-4c99-b72c-a3163caf39ab', 'zakia-demo@ca-nemmo.com', 'zakia-demo@ca-nemmo.com', false, true, NULL, 'Zakia', 'Demo', 'nemmo', 'zakia-demo', 1589207817967, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('1d9d71b2-69a0-4feb-aa86-efce0243a28b', 'anne-celine-ndemo@p-nemmo.com', 'anne-celine-ndemo@p-nemmo.com', false, true, NULL, 'Anne-Céline', 'Demo', 'nemmo', 'anne-celine-ndemo', 1589207818386, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('8ca3eede-8271-44fa-b824-3875103294e4', 'claire-bidemo@p-nemmo.com', 'claire-bidemo@p-nemmo.com', false, true, NULL, 'Claire', 'Demo', 'nemmo', 'claire-bidemo', 1589207819457, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('b338f031-0465-4db4-bf74-8b1e6b4632c9', 'remi-pdemo@p-nemmo.com', 'remi-pdemo@p-nemmo.com', false, true, NULL, 'Rémi', 'Demo', 'nemmo', 'remi-pdemo', 1589207820611, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('fb8c0241-a614-471e-8af5-85301ded1d9e', 'adrien-pdemo@p-nemmo.com', 'adrien-pdemo@p-nemmo.com', false, true, NULL, 'Adrien', 'Demo', 'nemmo', 'adrien-pdemo', 1589207820848, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('e8aecf5c-eb39-4914-bc29-2dd80fb5aea2', 'beatrice1@b1-nemmo.com', 'beatrice1@b1-nemmo.com', false, true, NULL, 'Béatrice', 'Renaud', 'nemmo', 'beatrice1', 1589207821178, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('8252e07f-f3eb-40b0-88d0-e91fb1e4a433', 'pierre2@p2-nemmo.com', 'pierre2@p2-nemmo.com', false, true, NULL, 'Pierre', 'Luchini', 'nemmo', 'pierre2', 1589207823560, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('d8abc769-e871-402a-ba00-d3683e05f5b7', NULL, '36c3c2e2-d1bc-4387-812e-bee2cb85c379', false, true, NULL, NULL, NULL, 'nemmo', 'nemmo-admin', 1593784466901, NULL, 0);
INSERT INTO keycloak.user_entity VALUES ('e30c2c51-b88c-4038-b01d-08dc40f937c2', 'louis.leroux-prestataire@ca-cib.com', 'louis.leroux-prestataire@ca-cib.com', false, true, NULL, 'Louis', 'LE ROUX', 'nemmo', 'ut2k77', 1599832029723, NULL, 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_group_membership VALUES ('afb24a57-8ba9-452f-8072-55dd5aa9e9f0', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_group_membership VALUES ('506ca814-ae9f-4c3a-be6a-ddb3ffa11bee', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_group_membership VALUES ('506ca814-ae9f-4c3a-be6a-ddb3ffa11bee', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_group_membership VALUES ('506ca814-ae9f-4c3a-be6a-ddb3ffa11bee', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_group_membership VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_group_membership VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_group_membership VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_group_membership VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_group_membership VALUES ('d8b5d185-5318-451f-99a2-6c76ae1bcf44', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_group_membership VALUES ('6137be69-54d4-4d49-8920-3a8d7ee91e84', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_group_membership VALUES ('6137be69-54d4-4d49-8920-3a8d7ee91e84', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_group_membership VALUES ('dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_group_membership VALUES ('e5d44a89-0d0e-48c9-b255-b40e20bea1c7', 'aae890b1-c978-444c-80e8-29c68bb005a0');
INSERT INTO keycloak.user_group_membership VALUES ('21455db9-ae33-4b61-8d82-923e33d090fe', '7e4ef3e4-efda-446a-acda-d4bd56c87877');
INSERT INTO keycloak.user_group_membership VALUES ('e5d44a89-0d0e-48c9-b255-b40e20bea1c7', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_group_membership VALUES ('dab5c617-770d-4c86-985d-8edc2ed1e2ab', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_group_membership VALUES ('21455db9-ae33-4b61-8d82-923e33d090fe', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_group_membership VALUES ('7750f4cb-7af6-4f74-8b5d-a6c5009846c7', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_group_membership VALUES ('2fc1fa19-4c72-4179-abeb-fe369913e1e5', '1d25652f-4446-4043-acd1-edf4174efe46');
INSERT INTO keycloak.user_group_membership VALUES ('a4c6e39f-ed38-459f-87e8-48e74044ad81', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_group_membership VALUES ('7750f4cb-7af6-4f74-8b5d-a6c5009846c7', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_group_membership VALUES ('2fc1fa19-4c72-4179-abeb-fe369913e1e5', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_group_membership VALUES ('a4c6e39f-ed38-459f-87e8-48e74044ad81', 'eaff208a-285d-4578-838f-2ed20d44e472');


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.user_role_mapping VALUES ('596b9808-292a-4ad6-8246-1ae80a7e1adc', 'ae630a84-d508-4f3b-b6fd-a118a202c824');
INSERT INTO keycloak.user_role_mapping VALUES ('d003d60a-c957-418c-92ca-e174734dfa49', 'ae630a84-d508-4f3b-b6fd-a118a202c824');
INSERT INTO keycloak.user_role_mapping VALUES ('b31953ee-700d-43e1-be79-80f083c55f6b', 'ae630a84-d508-4f3b-b6fd-a118a202c824');
INSERT INTO keycloak.user_role_mapping VALUES ('d6dc15b8-8878-4075-ba52-9c890ae1c8e1', 'ae630a84-d508-4f3b-b6fd-a118a202c824');
INSERT INTO keycloak.user_role_mapping VALUES ('35235cd6-5a58-45f9-84e2-47c626060ede', 'ae630a84-d508-4f3b-b6fd-a118a202c824');
INSERT INTO keycloak.user_role_mapping VALUES ('596b9808-292a-4ad6-8246-1ae80a7e1adc', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('d003d60a-c957-418c-92ca-e174734dfa49', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('b31953ee-700d-43e1-be79-80f083c55f6b', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('d6dc15b8-8878-4075-ba52-9c890ae1c8e1', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('58378ae6-c012-4e71-92aa-1b4ff0f12e09', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('0aa35266-c441-4431-9edc-a622eefb283b', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('cde2b875-7866-497a-b923-27cb8f5d0f1a', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('b6cb83a0-432d-4220-9204-45687193d33e', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('80f23bb0-0c54-400c-aff3-007dfa640892', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('287c9ba0-c6e3-4a13-ae92-1e832eefe57d', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('1d90fd03-d831-4f8a-b7f4-04208d6094cf', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('bd5f0a68-06ff-49b3-89dd-430a005daba7', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('aeedae19-13eb-4b1d-b84e-ab698cfc92b7', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('e0893c53-06da-4e0f-a369-8a45811e6493', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('d02fb1db-79b0-477f-9707-5b536af36d9e', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('710028e9-8b88-4ea6-9250-3bfe9a434be6', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('0ec4d644-7d8f-4e96-b8ca-cf33c59633a7', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('af266eb3-cbc8-4adb-920e-625114245d6b', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('6b8f8859-070d-4414-bf06-f4380db44682', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('c59e6760-7fda-4244-82d8-146dcd2507cf', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('91ee5515-f520-46c7-b608-a26a3879b79e', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('319d2046-fd16-484d-8b94-262a8453b02c', '14f5ce80-a57d-4d38-b3b6-710c6960340d');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '37eb8b5d-76ce-4a73-ab60-d403f8780144');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '4ec413fe-fecb-457e-8bea-8b5f4f5226cc');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '089f4481-bab9-42ac-ae50-278118ed4bff');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '6f49d28f-0bc2-4be0-8b7e-48a83addbbf2');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '08552046-8a91-479c-81de-7a5d6e98a156');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'fb8c0241-a614-471e-8af5-85301ded1d9e');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'aae890b1-c978-444c-80e8-29c68bb005a0');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'aae890b1-c978-444c-80e8-29c68bb005a0');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'aae890b1-c978-444c-80e8-29c68bb005a0');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'aae890b1-c978-444c-80e8-29c68bb005a0');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '7e4ef3e4-efda-446a-acda-d4bd56c87877');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '7e4ef3e4-efda-446a-acda-d4bd56c87877');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '7e4ef3e4-efda-446a-acda-d4bd56c87877');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '7e4ef3e4-efda-446a-acda-d4bd56c87877');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '1c97d99c-df2f-4064-a2b3-fce31e4beb9a');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'beef5e17-7811-4d38-b523-04054a7eeeec');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '1d25652f-4446-4043-acd1-edf4174efe46');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '1d25652f-4446-4043-acd1-edf4174efe46');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '1d25652f-4446-4043-acd1-edf4174efe46');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '1d25652f-4446-4043-acd1-edf4174efe46');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '1afdbf62-71cd-4b08-a50e-0e57a7d752aa');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '8252e07f-f3eb-40b0-88d0-e91fb1e4a433');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'eaff208a-285d-4578-838f-2ed20d44e472');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'e8aecf5c-eb39-4914-bc29-2dd80fb5aea2');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '2169089e-b586-4b3d-9704-e0d1ff1f1b7f');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '47119950-7d4d-4969-a6c2-3f8190f275c7');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', '36e5fa4d-560c-4c99-b72c-a3163caf39ab');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '22ce4d09-4285-470f-8480-ea0dc7e13bbc');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '1d9d71b2-69a0-4feb-aa86-efce0243a28b');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'ffd8356e-bf14-4d24-9b8e-2c87abe9e8e8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'd08cb28d-44bf-4746-978f-414e0ca7d807');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', '8ca3eede-8271-44fa-b824-3875103294e4');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'a59202ab-a3a9-4ed3-aa00-4dc29d62398e');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'b338f031-0465-4db4-bf74-8b1e6b4632c9');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'd8abc769-e871-402a-ba00-d3683e05f5b7');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'd8abc769-e871-402a-ba00-d3683e05f5b7');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'd8abc769-e871-402a-ba00-d3683e05f5b7');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'd8abc769-e871-402a-ba00-d3683e05f5b7');
INSERT INTO keycloak.user_role_mapping VALUES ('f1544f73-54bb-4bce-944b-94c04de771fd', 'd8abc769-e871-402a-ba00-d3683e05f5b7');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '755ef19b-4194-4681-9098-5c7192206456');
INSERT INTO keycloak.user_role_mapping VALUES ('f1544f73-54bb-4bce-944b-94c04de771fd', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '9d7d2d3b-242a-4220-8a06-921cfa4ec6fc');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', '26d55123-7d46-4271-aaad-3024214ae8c8');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'e963aa87-53d7-4dc8-90fe-2bf6a548dac8');
INSERT INTO keycloak.user_role_mapping VALUES ('0068e81f-3d76-4779-bc9a-82371b66c45b', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');
INSERT INTO keycloak.user_role_mapping VALUES ('e14daed3-9c78-43ab-a0e9-14595a3112be', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');
INSERT INTO keycloak.user_role_mapping VALUES ('86086e36-8675-47e5-ad23-14c7b9a15f5b', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');
INSERT INTO keycloak.user_role_mapping VALUES ('cbb68085-fd19-487d-a11d-5ef58cac65fc', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');
INSERT INTO keycloak.user_role_mapping VALUES ('ed87e98f-5a86-4020-a274-013536e17486', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');
INSERT INTO keycloak.user_role_mapping VALUES ('6bdd2b05-4f24-420d-9162-c81ec24757df', 'e30c2c51-b88c-4038-b01d-08dc40f937c2');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: keycloak; Owner: admin
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

INSERT INTO keycloak.web_origins VALUES ('f73f42ff-5026-4abe-a679-8d96f645dce3', '+');
INSERT INTO keycloak.web_origins VALUES ('055f28e6-65e2-41a4-9e97-050177016adb', '+');
INSERT INTO keycloak.web_origins VALUES ('f3d879da-578c-44e8-a63e-eb4b2fe316ef', '+');


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON keycloak.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON keycloak.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON keycloak.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON keycloak.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON keycloak.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_cl_clscope ON keycloak.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_def_roles_client ON keycloak.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_id ON keycloak.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON keycloak.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_session_session ON keycloak.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON keycloak.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_cl ON keycloak.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON keycloak.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_role ON keycloak.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON keycloak.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_component_provider_type ON keycloak.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_component_realm ON keycloak.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_composite ON keycloak.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_composite_child ON keycloak.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_defcls_realm ON keycloak.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_defcls_scope ON keycloak.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_event_time ON keycloak.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON keycloak.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON keycloak.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_attribute ON keycloak.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON keycloak.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_consent ON keycloak.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON keycloak.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_credential ON keycloak.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON keycloak.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON keycloak.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON keycloak.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_required_action ON keycloak.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON keycloak.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON keycloak.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON keycloak.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_group_attr_group ON keycloak.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON keycloak.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON keycloak.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON keycloak.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON keycloak.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON keycloak.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_uss_createdon ON keycloak.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON keycloak.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON keycloak.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_clscope ON keycloak.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON keycloak.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_def_roles_realm ON keycloak.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON keycloak.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON keycloak.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON keycloak.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON keycloak.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON keycloak.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON keycloak.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON keycloak.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON keycloak.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON keycloak.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON keycloak.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON keycloak.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_role_attribute ON keycloak.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_role_clscope ON keycloak.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON keycloak.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON keycloak.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_update_time ON keycloak.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON keycloak.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON keycloak.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_attribute ON keycloak.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_consent ON keycloak.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_credential ON keycloak.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_email ON keycloak.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON keycloak.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_reqactions ON keycloak.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON keycloak.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON keycloak.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON keycloak.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON keycloak.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_web_orig_client ON keycloak.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES keycloak.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES keycloak.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES keycloak.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES keycloak.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES keycloak.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES keycloak.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES keycloak.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES keycloak.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES keycloak.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES keycloak.identity_provider_mapper(id);


--
-- Name: keycloak_role fk_kjho5le2c0ral09fl8cm9wfw9; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT fk_kjho5le2c0ral09fl8cm9wfw9 FOREIGN KEY (client) REFERENCES keycloak.client(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES keycloak.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- Name: realm fk_traf444kk6qrkms7n56aiwq5y; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT fk_traf444kk6qrkms7n56aiwq5y FOREIGN KEY (master_admin_client) REFERENCES keycloak.client(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES keycloak.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--


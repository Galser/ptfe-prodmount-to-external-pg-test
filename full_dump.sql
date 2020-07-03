--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.22
-- Dumped by pg_dump version 9.5.22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: rails; Type: SCHEMA; Schema: -; Owner: hashicorp
--

CREATE SCHEMA rails;


ALTER SCHEMA rails OWNER TO hashicorp;

--
-- Name: registry; Type: SCHEMA; Schema: -; Owner: hashicorp
--

CREATE SCHEMA registry;


ALTER SCHEMA registry OWNER TO hashicorp;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: hashicorp
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO hashicorp;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA registry;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA rails;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA rails;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: visibility; Type: TYPE; Schema: rails; Owner: hashicorp
--

CREATE TYPE rails.visibility AS ENUM (
    'secret',
    'organization'
);


ALTER TYPE rails.visibility OWNER TO hashicorp;

--
-- Name: provider_tier; Type: TYPE; Schema: registry; Owner: hashicorp
--

CREATE TYPE registry.provider_tier AS ENUM (
    'official',
    'partner',
    'community'
);


ALTER TYPE registry.provider_tier OWNER TO hashicorp;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_settings_cost_estimation; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_cost_estimation (
    id integer NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    aws_access_key_id_encrypted text,
    aws_secret_key_encrypted text,
    gcp_credentials_encrypted text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    azure_subscription_id_encrypted text,
    azure_tenant_id_encrypted text,
    azure_client_id_encrypted text,
    azure_client_secret_encrypted text,
    aws_enabled boolean DEFAULT true NOT NULL,
    gcp_enabled boolean DEFAULT true NOT NULL,
    azure_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE rails.admin_settings_cost_estimation OWNER TO hashicorp;

--
-- Name: admin_settings_cost_estimation_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_cost_estimation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_cost_estimation_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_cost_estimation_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_cost_estimation_id_seq OWNED BY rails.admin_settings_cost_estimation.id;


--
-- Name: admin_settings_customization; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_customization (
    id integer NOT NULL,
    support_email_address text DEFAULT 'support@hashicorp.com'::text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    login_help text,
    footer text,
    error text,
    new_user text
);


ALTER TABLE rails.admin_settings_customization OWNER TO hashicorp;

--
-- Name: admin_settings_customization_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_customization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_customization_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_customization_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_customization_id_seq OWNED BY rails.admin_settings_customization.id;


--
-- Name: admin_settings_general; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_general (
    id integer NOT NULL,
    support_email_address text DEFAULT 'support@hashicorp.com'::text NOT NULL,
    security_email_address text DEFAULT 'security@hashicorp.com'::text NOT NULL,
    limit_user_organization_creation boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    api_rate_limiting_enabled boolean DEFAULT true NOT NULL,
    api_rate_limit integer DEFAULT 30 NOT NULL,
    require_two_factor_for_admins boolean DEFAULT false NOT NULL,
    limit_organizations_per_user boolean DEFAULT false NOT NULL,
    default_organizations_per_user_ceiling integer DEFAULT 100 NOT NULL,
    limit_workspaces_per_organization boolean DEFAULT false NOT NULL,
    default_workspaces_per_organization_ceiling integer DEFAULT 1000 NOT NULL,
    notification_retry_limit integer DEFAULT 5 NOT NULL,
    terraform_build_worker_plan_timeout text DEFAULT '2h'::text NOT NULL,
    terraform_build_worker_apply_timeout text DEFAULT '24h'::text NOT NULL,
    send_passing_statuses_for_untriggered_speculative_plans boolean DEFAULT true NOT NULL,
    allow_speculative_plans_on_pull_requests_from_forks boolean DEFAULT false NOT NULL
);


ALTER TABLE rails.admin_settings_general OWNER TO hashicorp;

--
-- Name: admin_settings_general_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_general_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_general_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_general_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_general_id_seq OWNED BY rails.admin_settings_general.id;


--
-- Name: admin_settings_saml; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_saml (
    id integer NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    idp_cert_encrypted text,
    slo_endpoint_url text,
    sso_endpoint_url text,
    attr_groups text DEFAULT 'MemberOf'::text,
    attr_site_admin text DEFAULT 'SiteAdmin'::text,
    site_admin_role text DEFAULT 'site-admins'::text,
    sso_api_token_session_timeout integer DEFAULT 1209600,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    debug boolean DEFAULT false NOT NULL,
    attr_username text DEFAULT 'Username'::text,
    team_management_enabled boolean DEFAULT true,
    old_idp_cert_encrypted text,
    certificate_encrypted text,
    private_key_encrypted text,
    authn_requests_signed boolean DEFAULT false,
    want_assertions_signed boolean DEFAULT false
);


ALTER TABLE rails.admin_settings_saml OWNER TO hashicorp;

--
-- Name: admin_settings_saml_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_saml_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_saml_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_saml_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_saml_id_seq OWNED BY rails.admin_settings_saml.id;


--
-- Name: admin_settings_smtp; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_smtp (
    id integer NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    host text,
    port integer,
    auth text DEFAULT 'none'::text NOT NULL,
    username text,
    password_encrypted text,
    sender text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.admin_settings_smtp OWNER TO hashicorp;

--
-- Name: admin_settings_smtp_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_smtp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_smtp_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_smtp_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_smtp_id_seq OWNED BY rails.admin_settings_smtp.id;


--
-- Name: admin_settings_twilio; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.admin_settings_twilio (
    id integer NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    account_sid text,
    auth_token_encrypted text,
    from_number text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.admin_settings_twilio OWNER TO hashicorp;

--
-- Name: admin_settings_twilio_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.admin_settings_twilio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.admin_settings_twilio_id_seq OWNER TO hashicorp;

--
-- Name: admin_settings_twilio_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.admin_settings_twilio_id_seq OWNED BY rails.admin_settings_twilio.id;


--
-- Name: applies; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.applies (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    run_id integer NOT NULL,
    archivist_upload_id character varying,
    status character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    logs_compress_encrypt boolean DEFAULT false NOT NULL,
    encryption_context text,
    resource_additions integer,
    resource_changes integer,
    resource_destructions integer,
    tokens_at_enqueue integer
);


ALTER TABLE rails.applies OWNER TO hashicorp;

--
-- Name: applies_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.applies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.applies_id_seq OWNER TO hashicorp;

--
-- Name: applies_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.applies_id_seq OWNED BY rails.applies.id;


--
-- Name: archivist_objects; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.archivist_objects (
    id integer NOT NULL,
    attachable_id integer,
    attachable_type text,
    archivist_upload_id text,
    uploaded_at timestamp without time zone,
    keypath text NOT NULL,
    encryption_context text NOT NULL,
    compress boolean DEFAULT false NOT NULL,
    max_size bigint,
    filename text NOT NULL,
    size bigint,
    deletable_after timestamp without time zone,
    metric_scope text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type text NOT NULL
);


ALTER TABLE rails.archivist_objects OWNER TO hashicorp;

--
-- Name: archivist_objects_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.archivist_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.archivist_objects_id_seq OWNER TO hashicorp;

--
-- Name: archivist_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.archivist_objects_id_seq OWNED BY rails.archivist_objects.id;


--
-- Name: audit_trails; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.audit_trails (
    id integer NOT NULL,
    uuid uuid DEFAULT rails.uuid_generate_v4(),
    "timestamp" timestamp without time zone NOT NULL,
    auth_accessor_id character varying NOT NULL,
    auth_description character varying NOT NULL,
    auth_type character varying DEFAULT 'client'::character varying NOT NULL,
    auth_impersonator_id character varying NOT NULL,
    auth_organization_id character varying NOT NULL,
    request_id character varying NOT NULL,
    request_remote_addr character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    resource_action character varying NOT NULL,
    resource_meta json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.audit_trails OWNER TO hashicorp;

--
-- Name: audit_trails_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.audit_trails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.audit_trails_id_seq OWNER TO hashicorp;

--
-- Name: audit_trails_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.audit_trails_id_seq OWNED BY rails.audit_trails.id;


--
-- Name: authentication_tokens; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.authentication_tokens (
    id integer NOT NULL,
    user_id integer,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_hidden boolean DEFAULT false,
    token_hash text NOT NULL,
    delete_at timestamp without time zone,
    authentication_tokenable_id integer,
    authentication_tokenable_type character varying,
    created_by_id integer,
    created_by_type character varying,
    last_used_at timestamp without time zone,
    external_id character varying NOT NULL
);


ALTER TABLE rails.authentication_tokens OWNER TO hashicorp;

--
-- Name: authentication_tokens_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.authentication_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.authentication_tokens_id_seq OWNER TO hashicorp;

--
-- Name: authentication_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.authentication_tokens_id_seq OWNED BY rails.authentication_tokens.id;


--
-- Name: configuration_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.configuration_versions (
    id integer NOT NULL,
    created_by_id integer,
    error text,
    metadata_encrypted text,
    status character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore,
    internal_error text,
    external_id character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer NOT NULL,
    source character varying DEFAULT 'terraform'::character varying NOT NULL,
    vcs_repo_id integer,
    trace_resource_id uuid DEFAULT rails.uuid_generate_v4(),
    encryption_context character varying,
    auto_queue_runs boolean DEFAULT true NOT NULL,
    skip_uploaded_callback boolean,
    speculative boolean DEFAULT false NOT NULL,
    changed_files text[] DEFAULT '{}'::text[]
);


ALTER TABLE rails.configuration_versions OWNER TO hashicorp;

--
-- Name: configuration_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.configuration_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.configuration_versions_id_seq OWNER TO hashicorp;

--
-- Name: configuration_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.configuration_versions_id_seq OWNED BY rails.configuration_versions.id;


--
-- Name: cost_estimates; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.cost_estimates (
    id integer NOT NULL,
    external_id text NOT NULL,
    run_id integer NOT NULL,
    results text DEFAULT '--- {}
'::text NOT NULL,
    status character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    error_message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nomad_job_id text
);


ALTER TABLE rails.cost_estimates OWNER TO hashicorp;

--
-- Name: cost_estimates_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.cost_estimates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.cost_estimates_id_seq OWNER TO hashicorp;

--
-- Name: cost_estimates_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.cost_estimates_id_seq OWNED BY rails.cost_estimates.id;


--
-- Name: email_recipients; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.email_recipients (
    id integer NOT NULL,
    notification_configuration_id integer NOT NULL,
    user_id integer NOT NULL,
    external_id text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.email_recipients OWNER TO hashicorp;

--
-- Name: email_recipients_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.email_recipients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.email_recipients_id_seq OWNER TO hashicorp;

--
-- Name: email_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.email_recipients_id_seq OWNED BY rails.email_recipients.id;


--
-- Name: feature_sets; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.feature_sets (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    plan_id text,
    name text,
    cost_estimation boolean DEFAULT false NOT NULL,
    sentinel boolean DEFAULT false NOT NULL,
    teams boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_current boolean DEFAULT true NOT NULL,
    cost integer,
    description text,
    comparison_description text,
    is_public boolean DEFAULT true NOT NULL,
    user_limit double precision DEFAULT 'Infinity'::double precision NOT NULL,
    identifier text NOT NULL,
    self_serve_billing boolean DEFAULT true NOT NULL,
    audit_logging boolean DEFAULT false NOT NULL,
    sso boolean DEFAULT false NOT NULL,
    private_networking boolean DEFAULT false NOT NULL
);


ALTER TABLE rails.feature_sets OWNER TO hashicorp;

--
-- Name: feature_sets_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.feature_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.feature_sets_id_seq OWNER TO hashicorp;

--
-- Name: feature_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.feature_sets_id_seq OWNED BY rails.feature_sets.id;


--
-- Name: github_app_apps; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.github_app_apps (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret_encrypted text,
    private_key_encrypted text,
    global boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    webhook_secret_encrypted text,
    app_id integer
);


ALTER TABLE rails.github_app_apps OWNER TO hashicorp;

--
-- Name: github_app_apps_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.github_app_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.github_app_apps_id_seq OWNER TO hashicorp;

--
-- Name: github_app_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.github_app_apps_id_seq OWNED BY rails.github_app_apps.id;


--
-- Name: github_app_installations; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.github_app_installations (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    app_id integer NOT NULL,
    installation_id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    icon_url text NOT NULL
);


ALTER TABLE rails.github_app_installations OWNER TO hashicorp;

--
-- Name: github_app_installations_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.github_app_installations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.github_app_installations_id_seq OWNER TO hashicorp;

--
-- Name: github_app_installations_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.github_app_installations_id_seq OWNED BY rails.github_app_installations.id;


--
-- Name: github_app_oauth_tokens; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.github_app_oauth_tokens (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    user_id integer NOT NULL,
    app_id integer NOT NULL,
    value_encrypted text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    github_user_id integer
);


ALTER TABLE rails.github_app_oauth_tokens OWNER TO hashicorp;

--
-- Name: github_app_oauth_tokens_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.github_app_oauth_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.github_app_oauth_tokens_id_seq OWNER TO hashicorp;

--
-- Name: github_app_oauth_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.github_app_oauth_tokens_id_seq OWNED BY rails.github_app_oauth_tokens.id;


--
-- Name: hosted_files; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.hosted_files (
    id integer NOT NULL,
    hostable_id integer,
    hostable_type character varying,
    binstore_key character varying,
    disk_space bigint,
    uploaded_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    archivist_upload_id character varying,
    archivist_upload_url character varying,
    deleted_at timestamp without time zone,
    hostable_storage_key character varying,
    deletable_after timestamp without time zone,
    cached_metadata rails.hstore
);


ALTER TABLE rails.hosted_files OWNER TO hashicorp;

--
-- Name: hosted_files_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.hosted_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.hosted_files_id_seq OWNER TO hashicorp;

--
-- Name: hosted_files_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.hosted_files_id_seq OWNED BY rails.hosted_files.id;


--
-- Name: ingress_attributes; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.ingress_attributes (
    id integer NOT NULL,
    branch text,
    clone_url text NOT NULL,
    commit_sha text,
    commit_url text,
    compare_url text,
    is_pull_request boolean DEFAULT false NOT NULL,
    commit_message text,
    on_default_branch boolean DEFAULT false NOT NULL,
    pull_request_number integer,
    ingress_submodules boolean DEFAULT false NOT NULL,
    pull_request_url text,
    identifier text NOT NULL,
    tag text,
    sender_username text,
    created_by_id integer,
    ingress_attributable_id integer NOT NULL,
    ingress_attributable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    webhook_payload_id integer,
    sender_avatar_url character varying,
    sender_html_url character varying,
    external_id character varying NOT NULL,
    pull_request_title text,
    pull_request_body text
);


ALTER TABLE rails.ingress_attributes OWNER TO hashicorp;

--
-- Name: ingress_attributes_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.ingress_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.ingress_attributes_id_seq OWNER TO hashicorp;

--
-- Name: ingress_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.ingress_attributes_id_seq OWNED BY rails.ingress_attributes.id;


--
-- Name: ingress_triggers; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.ingress_triggers (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    vcs_repo_id integer NOT NULL,
    default_branch boolean DEFAULT true NOT NULL,
    branch character varying DEFAULT ''::character varying,
    tags boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ingress_submodules boolean DEFAULT false NOT NULL,
    ingressable_type character varying,
    ingressable_id integer
);


ALTER TABLE rails.ingress_triggers OWNER TO hashicorp;

--
-- Name: ingress_triggers_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.ingress_triggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.ingress_triggers_id_seq OWNER TO hashicorp;

--
-- Name: ingress_triggers_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.ingress_triggers_id_seq OWNED BY rails.ingress_triggers.id;


--
-- Name: memberships; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.memberships (
    id integer NOT NULL,
    team_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    organization_user_id integer NOT NULL
);


ALTER TABLE rails.memberships OWNER TO hashicorp;

--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.memberships_id_seq OWNER TO hashicorp;

--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.memberships_id_seq OWNED BY rails.memberships.id;


--
-- Name: notification_configurations; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.notification_configurations (
    id integer NOT NULL,
    name text NOT NULL,
    external_id text NOT NULL,
    url text,
    destination_type text NOT NULL,
    token_encrypted text,
    triggers text[] DEFAULT '{}'::text[],
    enabled boolean DEFAULT false NOT NULL,
    subscribable_id integer,
    subscribable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    delivery_response rails.hstore,
    email_addresses text
);


ALTER TABLE rails.notification_configurations OWNER TO hashicorp;

--
-- Name: notification_configurations_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.notification_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.notification_configurations_id_seq OWNER TO hashicorp;

--
-- Name: notification_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.notification_configurations_id_seq OWNED BY rails.notification_configurations.id;


--
-- Name: o_auth_clients; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.o_auth_clients (
    id integer NOT NULL,
    oauth_clientable_id integer,
    oauth_clientable_type character varying,
    service_provider text,
    secret_encrypted text,
    key text,
    http_url text,
    api_url text,
    webhook_secret_encrypted text,
    string text,
    uuid uuid NOT NULL,
    approved boolean DEFAULT false,
    global boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rsa_public_key text,
    request_token text,
    request_token_secret text,
    external_id character varying NOT NULL,
    name text
);


ALTER TABLE rails.o_auth_clients OWNER TO hashicorp;

--
-- Name: o_auth_clients_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.o_auth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.o_auth_clients_id_seq OWNER TO hashicorp;

--
-- Name: o_auth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.o_auth_clients_id_seq OWNED BY rails.o_auth_clients.id;


--
-- Name: o_auth_tokens; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.o_auth_tokens (
    id integer NOT NULL,
    oauth_tokenable_id integer,
    oauth_tokenable_type character varying,
    value_encrypted text,
    info_encrypted text,
    uid text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    oauth_client_id integer,
    anonymous boolean DEFAULT false,
    refresh_token_encrypted text DEFAULT ''::text,
    secret_encrypted text,
    ssh_key_encrypted text,
    external_id character varying NOT NULL
);


ALTER TABLE rails.o_auth_tokens OWNER TO hashicorp;

--
-- Name: o_auth_tokens_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.o_auth_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.o_auth_tokens_id_seq OWNER TO hashicorp;

--
-- Name: o_auth_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.o_auth_tokens_id_seq OWNED BY rails.o_auth_tokens.id;


--
-- Name: organization_permission_sets; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.organization_permission_sets (
    id integer NOT NULL,
    team_id integer NOT NULL,
    manage_policies boolean DEFAULT false NOT NULL,
    manage_workspaces boolean DEFAULT false NOT NULL,
    manage_vcs_settings boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rails.organization_permission_sets OWNER TO hashicorp;

--
-- Name: organization_permission_sets_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.organization_permission_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.organization_permission_sets_id_seq OWNER TO hashicorp;

--
-- Name: organization_permission_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.organization_permission_sets_id_seq OWNED BY rails.organization_permission_sets.id;


--
-- Name: organization_users; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.organization_users (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id text NOT NULL,
    status text DEFAULT 'active'::text NOT NULL
);


ALTER TABLE rails.organization_users OWNER TO hashicorp;

--
-- Name: organization_users_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.organization_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.organization_users_id_seq OWNER TO hashicorp;

--
-- Name: organization_users_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.organization_users_id_seq OWNED BY rails.organization_users.id;


--
-- Name: organizations; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.organizations (
    id integer NOT NULL,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    collaborator_auth_policy character varying DEFAULT 'password'::character varying,
    access_beta_tools boolean DEFAULT false,
    session_timeout integer,
    session_remember integer,
    external_id character varying NOT NULL,
    encryption_context character varying,
    owners_team_saml_role_id text,
    name character varying,
    runs_ceiling integer DEFAULT 1 NOT NULL,
    created_by_id integer,
    cost_estimation_enabled boolean DEFAULT false NOT NULL,
    terraform_worker_sudo_enabled boolean DEFAULT false NOT NULL,
    terraform_build_worker_apply_timeout text,
    terraform_build_worker_plan_timeout text,
    is_disabled boolean DEFAULT false NOT NULL
);


ALTER TABLE rails.organizations OWNER TO hashicorp;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.organizations_id_seq OWNER TO hashicorp;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.organizations_id_seq OWNED BY rails.organizations.id;


--
-- Name: plan_exports; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.plan_exports (
    id integer NOT NULL,
    external_id text NOT NULL,
    plan_id integer NOT NULL,
    data_type text NOT NULL,
    status character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    encryption_context character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nomad_job_id text,
    error_message text
);


ALTER TABLE rails.plan_exports OWNER TO hashicorp;

--
-- Name: plan_exports_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.plan_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.plan_exports_id_seq OWNER TO hashicorp;

--
-- Name: plan_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.plan_exports_id_seq OWNED BY rails.plan_exports.id;


--
-- Name: plans; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.plans (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    run_id integer NOT NULL,
    status character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    archivist_upload_id character varying,
    has_changes boolean DEFAULT false NOT NULL,
    encryption_context character varying,
    logs_compress_encrypt boolean DEFAULT false NOT NULL,
    resource_additions integer,
    resource_changes integer,
    resource_destructions integer,
    tokens_at_enqueue integer
);


ALTER TABLE rails.plans OWNER TO hashicorp;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.plans_id_seq OWNER TO hashicorp;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.plans_id_seq OWNED BY rails.plans.id;


--
-- Name: policies; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policies (
    id integer NOT NULL,
    holder_id integer NOT NULL,
    holder_type character varying NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying NOT NULL,
    description text
);


ALTER TABLE rails.policies OWNER TO hashicorp;

--
-- Name: policies_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policies_id_seq OWNER TO hashicorp;

--
-- Name: policies_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policies_id_seq OWNED BY rails.policies.id;


--
-- Name: policy_check_criteria; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_check_criteria (
    id integer NOT NULL,
    policy_check_id integer NOT NULL,
    policy_set_version_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.policy_check_criteria OWNER TO hashicorp;

--
-- Name: policy_check_criteria_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_check_criteria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_check_criteria_id_seq OWNER TO hashicorp;

--
-- Name: policy_check_criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_check_criteria_id_seq OWNED BY rails.policy_check_criteria.id;


--
-- Name: policy_checks; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_checks (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    run_id integer NOT NULL,
    status character varying,
    scope character varying,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    nomad_job_id character varying
);


ALTER TABLE rails.policy_checks OWNER TO hashicorp;

--
-- Name: policy_checks_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_checks_id_seq OWNER TO hashicorp;

--
-- Name: policy_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_checks_id_seq OWNED BY rails.policy_checks.id;


--
-- Name: policy_configs; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_configs (
    id integer NOT NULL,
    policy_id integer NOT NULL,
    enforce character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.policy_configs OWNER TO hashicorp;

--
-- Name: policy_configs_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_configs_id_seq OWNER TO hashicorp;

--
-- Name: policy_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_configs_id_seq OWNED BY rails.policy_configs.id;


--
-- Name: policy_results; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_results (
    id integer NOT NULL,
    policy_check_id integer NOT NULL,
    result boolean DEFAULT false NOT NULL,
    passed integer DEFAULT 0 NOT NULL,
    total_failed integer DEFAULT 0 NOT NULL,
    hard_failed integer DEFAULT 0 NOT NULL,
    soft_failed integer DEFAULT 0 NOT NULL,
    advisory_failed integer DEFAULT 0 NOT NULL,
    duration_ms integer DEFAULT 0 NOT NULL,
    sentinel character varying DEFAULT '--- {}
'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying NOT NULL,
    encryption_context character varying
);


ALTER TABLE rails.policy_results OWNER TO hashicorp;

--
-- Name: policy_results_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_results_id_seq OWNER TO hashicorp;

--
-- Name: policy_results_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_results_id_seq OWNED BY rails.policy_results.id;


--
-- Name: policy_set_policies; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_set_policies (
    id integer NOT NULL,
    policy_set_id integer NOT NULL,
    policy_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rails.policy_set_policies OWNER TO hashicorp;

--
-- Name: policy_set_policies_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_set_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_set_policies_id_seq OWNER TO hashicorp;

--
-- Name: policy_set_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_set_policies_id_seq OWNED BY rails.policy_set_policies.id;


--
-- Name: policy_set_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_set_versions (
    id integer NOT NULL,
    policy_set_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source text NOT NULL,
    status text NOT NULL,
    error text,
    internal_error text,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    trace_resource_id uuid DEFAULT rails.uuid_generate_v4(),
    created_by_id integer NOT NULL,
    vcs_repo_id integer,
    ingress_attributes_id integer,
    external_id text NOT NULL,
    monorepo boolean DEFAULT true NOT NULL
);


ALTER TABLE rails.policy_set_versions OWNER TO hashicorp;

--
-- Name: policy_set_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_set_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_set_versions_id_seq OWNER TO hashicorp;

--
-- Name: policy_set_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_set_versions_id_seq OWNED BY rails.policy_set_versions.id;


--
-- Name: policy_set_workspaces; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_set_workspaces (
    id integer NOT NULL,
    policy_set_id integer NOT NULL,
    workspace_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rails.policy_set_workspaces OWNER TO hashicorp;

--
-- Name: policy_set_workspaces_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_set_workspaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_set_workspaces_id_seq OWNER TO hashicorp;

--
-- Name: policy_set_workspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_set_workspaces_id_seq OWNED BY rails.policy_set_workspaces.id;


--
-- Name: policy_sets; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_sets (
    id integer NOT NULL,
    external_id text NOT NULL,
    organization_id integer NOT NULL,
    name text NOT NULL,
    description text,
    global boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    policies_path text
);


ALTER TABLE rails.policy_sets OWNER TO hashicorp;

--
-- Name: policy_sets_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_sets_id_seq OWNER TO hashicorp;

--
-- Name: policy_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_sets_id_seq OWNED BY rails.policy_sets.id;


--
-- Name: policy_snapshots; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_snapshots (
    id integer NOT NULL,
    policy_check_id integer NOT NULL,
    policy_version_id integer,
    policy_config_id integer,
    policy_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.policy_snapshots OWNER TO hashicorp;

--
-- Name: policy_snapshots_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_snapshots_id_seq OWNER TO hashicorp;

--
-- Name: policy_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_snapshots_id_seq OWNED BY rails.policy_snapshots.id;


--
-- Name: policy_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.policy_versions (
    id integer NOT NULL,
    policy_id integer NOT NULL,
    encryption_context character varying,
    files character varying,
    uploaded boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying NOT NULL
);


ALTER TABLE rails.policy_versions OWNER TO hashicorp;

--
-- Name: policy_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.policy_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.policy_versions_id_seq OWNER TO hashicorp;

--
-- Name: policy_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.policy_versions_id_seq OWNED BY rails.policy_versions.id;


--
-- Name: prospective_users; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.prospective_users (
    id integer NOT NULL,
    email text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    free_organizations_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE rails.prospective_users OWNER TO hashicorp;

--
-- Name: prospective_users_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.prospective_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.prospective_users_id_seq OWNER TO hashicorp;

--
-- Name: prospective_users_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.prospective_users_id_seq OWNED BY rails.prospective_users.id;


--
-- Name: registry_module_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.registry_module_versions (
    id integer NOT NULL,
    registry_module_id integer,
    external_id character varying NOT NULL,
    encryption_context character varying,
    version character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source character varying NOT NULL,
    error text,
    internal_error text,
    trace_resource_id uuid DEFAULT rails.uuid_generate_v4(),
    vcs_repo_id integer,
    ingress_attributes_id integer,
    created_by_id integer,
    status text,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL
);


ALTER TABLE rails.registry_module_versions OWNER TO hashicorp;

--
-- Name: registry_module_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.registry_module_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.registry_module_versions_id_seq OWNER TO hashicorp;

--
-- Name: registry_module_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.registry_module_versions_id_seq OWNED BY rails.registry_module_versions.id;


--
-- Name: registry_modules; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.registry_modules (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    name character varying NOT NULL,
    provider character varying NOT NULL,
    organization_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status text,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL
);


ALTER TABLE rails.registry_modules OWNER TO hashicorp;

--
-- Name: registry_modules_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.registry_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.registry_modules_id_seq OWNER TO hashicorp;

--
-- Name: registry_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.registry_modules_id_seq OWNED BY rails.registry_modules.id;


--
-- Name: run_events; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.run_events (
    id integer NOT NULL,
    action character varying NOT NULL,
    external_id character varying NOT NULL,
    actor_id integer,
    actor_type character varying,
    run_id integer,
    target_id integer,
    target_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.run_events OWNER TO hashicorp;

--
-- Name: run_events_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.run_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.run_events_id_seq OWNER TO hashicorp;

--
-- Name: run_events_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.run_events_id_seq OWNED BY rails.run_events.id;


--
-- Name: run_trigger_snapshots; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.run_trigger_snapshots (
    id integer NOT NULL,
    external_id text NOT NULL,
    run_id integer NOT NULL,
    run_trigger_workspace_id integer NOT NULL,
    triggered_run_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rails.run_trigger_snapshots OWNER TO hashicorp;

--
-- Name: run_trigger_snapshots_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.run_trigger_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.run_trigger_snapshots_id_seq OWNER TO hashicorp;

--
-- Name: run_trigger_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.run_trigger_snapshots_id_seq OWNED BY rails.run_trigger_snapshots.id;


--
-- Name: run_triggers; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.run_triggers (
    id integer NOT NULL,
    external_id text NOT NULL,
    workspace_id integer NOT NULL,
    sourceable_id integer NOT NULL,
    sourceable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT no_self_loops CHECK ((NOT (((sourceable_type)::text = 'Workspace'::text) AND (sourceable_id = workspace_id))))
);


ALTER TABLE rails.run_triggers OWNER TO hashicorp;

--
-- Name: run_triggers_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.run_triggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.run_triggers_id_seq OWNER TO hashicorp;

--
-- Name: run_triggers_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.run_triggers_id_seq OWNED BY rails.run_triggers.id;


--
-- Name: runs; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.runs (
    id integer NOT NULL,
    configuration_version_id integer NOT NULL,
    workspace_id integer NOT NULL,
    input_state_version_id integer,
    created_by_id integer NOT NULL,
    confirmed_by_id integer,
    canceled_by_id integer,
    external_id character varying NOT NULL,
    status text NOT NULL,
    status_timestamps rails.hstore DEFAULT ''::rails.hstore NOT NULL,
    auto_apply boolean DEFAULT false NOT NULL,
    source text NOT NULL,
    terraform_version text NOT NULL,
    is_destroy boolean DEFAULT false NOT NULL,
    error_text text,
    message text NOT NULL,
    metadata_encrypted text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    var_snapshot_encrypted text,
    trace_resource_id uuid DEFAULT rails.uuid_generate_v4(),
    authentication_token_id integer,
    canceled_at timestamp without time zone,
    force_canceled_at timestamp without time zone,
    trigger_reason text NOT NULL,
    target_addrs text[]
);


ALTER TABLE rails.runs OWNER TO hashicorp;

--
-- Name: runs_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.runs_id_seq OWNER TO hashicorp;

--
-- Name: runs_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.runs_id_seq OWNED BY rails.runs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE rails.schema_migrations OWNER TO hashicorp;

--
-- Name: sessions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.sessions (
    id integer NOT NULL,
    user_id integer,
    key text,
    ip_address text,
    user_agent text,
    last_sudo_at timestamp without time zone,
    last_accessed_at timestamp without time zone,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE rails.sessions OWNER TO hashicorp;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.sessions_id_seq OWNER TO hashicorp;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.sessions_id_seq OWNED BY rails.sessions.id;


--
-- Name: setting_storage_postgres; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.setting_storage_postgres (
    id integer NOT NULL,
    key text,
    value_encrypted text,
    value_class text DEFAULT 'string'::text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rails.setting_storage_postgres OWNER TO hashicorp;

--
-- Name: setting_storage_postgres_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.setting_storage_postgres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.setting_storage_postgres_id_seq OWNER TO hashicorp;

--
-- Name: setting_storage_postgres_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.setting_storage_postgres_id_seq OWNED BY rails.setting_storage_postgres.id;


--
-- Name: ssh_keys; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.ssh_keys (
    id integer NOT NULL,
    ssh_keyable_id integer,
    ssh_keyable_type character varying,
    value_encrypted text,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    external_id character varying NOT NULL
);


ALTER TABLE rails.ssh_keys OWNER TO hashicorp;

--
-- Name: ssh_keys_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.ssh_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.ssh_keys_id_seq OWNER TO hashicorp;

--
-- Name: ssh_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.ssh_keys_id_seq OWNED BY rails.ssh_keys.id;


--
-- Name: state_version_outputs; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.state_version_outputs (
    id integer NOT NULL,
    state_version_id integer,
    name character varying NOT NULL,
    external_id character varying NOT NULL,
    output_type character varying NOT NULL,
    sensitive boolean DEFAULT false NOT NULL,
    value_encrypted text
);


ALTER TABLE rails.state_version_outputs OWNER TO hashicorp;

--
-- Name: state_version_outputs_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.state_version_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.state_version_outputs_id_seq OWNER TO hashicorp;

--
-- Name: state_version_outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.state_version_outputs_id_seq OWNED BY rails.state_version_outputs.id;


--
-- Name: state_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.state_versions (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    serial integer NOT NULL,
    created_by_id integer,
    workspace_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    operation_id integer,
    operation_type character varying,
    run_id integer,
    md5 character varying,
    encryption_context character varying,
    lineage character varying,
    skip_uploaded_callback boolean,
    state_version integer,
    terraform_version text,
    modules jsonb,
    providers jsonb,
    resources jsonb
);


ALTER TABLE rails.state_versions OWNER TO hashicorp;

--
-- Name: state_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.state_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.state_versions_id_seq OWNER TO hashicorp;

--
-- Name: state_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.state_versions_id_seq OWNED BY rails.state_versions.id;


--
-- Name: stored_traces; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.stored_traces (
    id uuid DEFAULT rails.uuid_generate_v4() NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    source text NOT NULL,
    description text NOT NULL,
    error_message text,
    resource_id uuid,
    request_id uuid,
    user_id integer
);


ALTER TABLE rails.stored_traces OWNER TO hashicorp;

--
-- Name: subscriptions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.subscriptions (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    organization_id integer,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by_id integer NOT NULL,
    active boolean DEFAULT false NOT NULL,
    next_subscription_id integer,
    trial_status text,
    feature_set_id integer NOT NULL
);


ALTER TABLE rails.subscriptions OWNER TO hashicorp;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.subscriptions_id_seq OWNER TO hashicorp;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.subscriptions_id_seq OWNED BY rails.subscriptions.id;


--
-- Name: team_workspaces; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.team_workspaces (
    id integer NOT NULL,
    team_id integer NOT NULL,
    workspace_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    access character varying NOT NULL,
    external_id character varying NOT NULL,
    runs_permission text DEFAULT 'read'::text NOT NULL,
    variables_permission text DEFAULT 'none'::text NOT NULL,
    state_versions_permission text DEFAULT 'none'::text NOT NULL,
    sentinel_mocks_permission text DEFAULT 'none'::text NOT NULL,
    workspace_locking_permission boolean DEFAULT false NOT NULL
);


ALTER TABLE rails.team_workspaces OWNER TO hashicorp;

--
-- Name: team_workspaces_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.team_workspaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.team_workspaces_id_seq OWNER TO hashicorp;

--
-- Name: team_workspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.team_workspaces_id_seq OWNED BY rails.team_workspaces.id;


--
-- Name: teams; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.teams (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    external_id character varying NOT NULL,
    api_user_id integer,
    visibility rails.visibility DEFAULT 'secret'::rails.visibility NOT NULL
);


ALTER TABLE rails.teams OWNER TO hashicorp;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.teams_id_seq OWNER TO hashicorp;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.teams_id_seq OWNED BY rails.teams.id;


--
-- Name: tool_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.tool_versions (
    id integer NOT NULL,
    tool character varying,
    version character varying,
    url character varying,
    sha character varying,
    official boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    beta boolean DEFAULT false NOT NULL,
    external_id text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer
);


ALTER TABLE rails.tool_versions OWNER TO hashicorp;

--
-- Name: tool_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.tool_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.tool_versions_id_seq OWNER TO hashicorp;

--
-- Name: tool_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.tool_versions_id_seq OWNED BY rails.tool_versions.id;


--
-- Name: users; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    username character varying,
    encrypted_password character varying DEFAULT ''::character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    is_admin boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    suspended_at timestamp without time zone,
    two_factor_delivery character varying,
    two_factor_sms_number character varying,
    two_factor_secret_key character varying,
    two_factor_recovery_index integer DEFAULT 0,
    two_factor_recovery_secret_key character varying,
    two_factor_verified_at timestamp without time zone,
    two_factor_enabled_at timestamp without time zone,
    is_service_account boolean DEFAULT false NOT NULL,
    used_recovery_codes_encrypted text,
    last_auth_through_saml timestamp without time zone,
    external_id text NOT NULL,
    accepted_terms_at timestamp without time zone,
    accepted_privacy_policy_at timestamp without time zone,
    invitation_token text,
    invitation_created_at timestamp without time zone,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    is_cyborg boolean DEFAULT false,
    onboarding_status text,
    CONSTRAINT confirmed_users_require_username_and_password CHECK (((confirmed_at IS NULL) OR ((username IS NOT NULL) AND (encrypted_password IS NOT NULL))))
);


ALTER TABLE rails.users OWNER TO hashicorp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.users_id_seq OWNER TO hashicorp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.users_id_seq OWNED BY rails.users.id;


--
-- Name: vars; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.vars (
    id integer NOT NULL,
    key character varying NOT NULL,
    value_encrypted text,
    sensitive boolean DEFAULT false NOT NULL,
    hcl boolean DEFAULT false NOT NULL,
    category character varying NOT NULL,
    configurable_id integer,
    configurable_type character varying,
    variable_set_id integer,
    owner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying NOT NULL,
    description text
);


ALTER TABLE rails.vars OWNER TO hashicorp;

--
-- Name: vars_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.vars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.vars_id_seq OWNER TO hashicorp;

--
-- Name: vars_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.vars_id_seq OWNED BY rails.vars.id;


--
-- Name: vcs_hosts; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.vcs_hosts (
    id integer NOT NULL,
    api_url text,
    api_version text,
    service_provider text,
    http_url text,
    oauth_client_id integer,
    webhook_secret_encrypted text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    github_app_id integer,
    CONSTRAINT oauth_client_or_github_app CHECK (((((oauth_client_id IS NOT NULL))::integer + ((github_app_id IS NOT NULL))::integer) = 1))
);


ALTER TABLE rails.vcs_hosts OWNER TO hashicorp;

--
-- Name: vcs_hosts_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.vcs_hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.vcs_hosts_id_seq OWNER TO hashicorp;

--
-- Name: vcs_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.vcs_hosts_id_seq OWNED BY rails.vcs_hosts.id;


--
-- Name: vcs_repos; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.vcs_repos (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    identifier character varying NOT NULL,
    webhook_secret_encrypted text,
    webhook_identifier uuid DEFAULT rails.uuid_generate_v4(),
    oauth_token_id integer,
    organization_id integer NOT NULL,
    ssh_key_id integer,
    vcs_host_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by_id integer,
    display_identifier text,
    github_app_installation_id integer,
    CONSTRAINT oauth_token_or_github_app_installation CHECK (((((oauth_token_id IS NOT NULL))::integer + ((github_app_installation_id IS NOT NULL))::integer) < 2))
);


ALTER TABLE rails.vcs_repos OWNER TO hashicorp;

--
-- Name: vcs_repos_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.vcs_repos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.vcs_repos_id_seq OWNER TO hashicorp;

--
-- Name: vcs_repos_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.vcs_repos_id_seq OWNED BY rails.vcs_repos.id;


--
-- Name: webhook_payloads; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.webhook_payloads (
    id integer NOT NULL,
    vcs_repo_id integer,
    body text,
    event character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rails.webhook_payloads OWNER TO hashicorp;

--
-- Name: webhook_payloads_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.webhook_payloads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.webhook_payloads_id_seq OWNER TO hashicorp;

--
-- Name: webhook_payloads_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.webhook_payloads_id_seq OWNED BY rails.webhook_payloads.id;


--
-- Name: workspace_comments; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.workspace_comments (
    id integer NOT NULL,
    commentable_id integer NOT NULL,
    commentable_type character varying NOT NULL,
    user_id integer NOT NULL,
    run_event_id integer,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying NOT NULL
);


ALTER TABLE rails.workspace_comments OWNER TO hashicorp;

--
-- Name: workspace_comments_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.workspace_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.workspace_comments_id_seq OWNER TO hashicorp;

--
-- Name: workspace_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.workspace_comments_id_seq OWNED BY rails.workspace_comments.id;


--
-- Name: workspace_configuration_versions; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.workspace_configuration_versions (
    id integer NOT NULL,
    workspace_id integer NOT NULL,
    configuration_version_id integer NOT NULL,
    external_id character varying NOT NULL,
    plan_only boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trigger_decision text
);


ALTER TABLE rails.workspace_configuration_versions OWNER TO hashicorp;

--
-- Name: workspace_configuration_versions_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.workspace_configuration_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.workspace_configuration_versions_id_seq OWNER TO hashicorp;

--
-- Name: workspace_configuration_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.workspace_configuration_versions_id_seq OWNED BY rails.workspace_configuration_versions.id;


--
-- Name: workspaces; Type: TABLE; Schema: rails; Owner: hashicorp
--

CREATE TABLE rails.workspaces (
    id integer NOT NULL,
    name character varying NOT NULL,
    external_id character varying NOT NULL,
    organization_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    archived_at timestamp without time zone,
    auto_apply boolean DEFAULT false NOT NULL,
    periodic_run integer DEFAULT 0 NOT NULL,
    queue_run_on_artifact_upload boolean DEFAULT false NOT NULL,
    terraform_version text NOT NULL,
    variable_set_id integer,
    trace_resource_id uuid DEFAULT rails.uuid_generate_v4(),
    locked_by_id integer,
    locked_by_type character varying,
    locked_reason character varying DEFAULT ''::character varying,
    environment character varying DEFAULT 'default'::character varying,
    current_state_version_id integer,
    working_directory text,
    ssh_key_id integer,
    current_run_id integer,
    queue_all_runs boolean DEFAULT false NOT NULL,
    file_triggers_enabled boolean DEFAULT true NOT NULL,
    trigger_prefixes text[] DEFAULT '{}'::text[] NOT NULL,
    speculative_enabled boolean DEFAULT true NOT NULL,
    operations boolean DEFAULT true NOT NULL,
    source character varying,
    source_name character varying,
    source_url character varying,
    description text,
    allow_destroy_plan boolean DEFAULT true NOT NULL,
    auto_destroy_at timestamp without time zone
);


ALTER TABLE rails.workspaces OWNER TO hashicorp;

--
-- Name: workspaces_id_seq; Type: SEQUENCE; Schema: rails; Owner: hashicorp
--

CREATE SEQUENCE rails.workspaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails.workspaces_id_seq OWNER TO hashicorp;

--
-- Name: workspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: rails; Owner: hashicorp
--

ALTER SEQUENCE rails.workspaces_id_seq OWNED BY rails.workspaces.id;


--
-- Name: gpg_keys; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.gpg_keys (
    id integer NOT NULL,
    namespace text NOT NULL,
    ascii_armor text NOT NULL,
    source text NOT NULL,
    source_url text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    trust_signature text,
    key_id text NOT NULL,
    CONSTRAINT key_id_not_empty CHECK ((key_id <> ''::text))
);


ALTER TABLE registry.gpg_keys OWNER TO hashicorp;

--
-- Name: gpg_keys_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.gpg_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.gpg_keys_id_seq OWNER TO hashicorp;

--
-- Name: gpg_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.gpg_keys_id_seq OWNED BY registry.gpg_keys.id;


--
-- Name: last_modified_times; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.last_modified_times (
    id integer NOT NULL,
    entity registry.citext,
    last_modified timestamp without time zone
);


ALTER TABLE registry.last_modified_times OWNER TO hashicorp;

--
-- Name: last_modified_times_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.last_modified_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.last_modified_times_id_seq OWNER TO hashicorp;

--
-- Name: last_modified_times_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.last_modified_times_id_seq OWNED BY registry.last_modified_times.id;


--
-- Name: logprocessor_files_complete; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.logprocessor_files_complete (
    id integer NOT NULL,
    bucket text,
    file_name text
);


ALTER TABLE registry.logprocessor_files_complete OWNER TO hashicorp;

--
-- Name: logprocessor_files_complete_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.logprocessor_files_complete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.logprocessor_files_complete_id_seq OWNER TO hashicorp;

--
-- Name: logprocessor_files_complete_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.logprocessor_files_complete_id_seq OWNED BY registry.logprocessor_files_complete.id;


--
-- Name: module_deps; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_deps (
    id integer NOT NULL,
    module_submodule_id integer,
    name text,
    source text,
    version text
);


ALTER TABLE registry.module_deps OWNER TO hashicorp;

--
-- Name: module_deps_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_deps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_deps_id_seq OWNER TO hashicorp;

--
-- Name: module_deps_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_deps_id_seq OWNED BY registry.module_deps.id;


--
-- Name: module_outputs; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_outputs (
    id integer NOT NULL,
    module_submodule_id integer,
    name text,
    description text
);


ALTER TABLE registry.module_outputs OWNER TO hashicorp;

--
-- Name: module_outputs_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_outputs_id_seq OWNER TO hashicorp;

--
-- Name: module_outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_outputs_id_seq OWNED BY registry.module_outputs.id;


--
-- Name: module_provider_deps; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_provider_deps (
    id integer NOT NULL,
    module_submodule_id integer,
    provider text,
    version_constraints text,
    provider_id integer,
    source text
);


ALTER TABLE registry.module_provider_deps OWNER TO hashicorp;

--
-- Name: module_provider_deps_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_provider_deps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_provider_deps_id_seq OWNER TO hashicorp;

--
-- Name: module_provider_deps_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_provider_deps_id_seq OWNED BY registry.module_provider_deps.id;


--
-- Name: module_providers; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_providers (
    id integer NOT NULL,
    module_id integer,
    provider text,
    source text,
    downloads integer DEFAULT 0 NOT NULL,
    ingress text,
    ingress_meta text
);


ALTER TABLE registry.module_providers OWNER TO hashicorp;

--
-- Name: module_providers_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_providers_id_seq OWNER TO hashicorp;

--
-- Name: module_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_providers_id_seq OWNED BY registry.module_providers.id;


--
-- Name: module_resources; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_resources (
    id integer NOT NULL,
    module_submodule_id integer,
    name text,
    type text
);


ALTER TABLE registry.module_resources OWNER TO hashicorp;

--
-- Name: module_resources_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_resources_id_seq OWNER TO hashicorp;

--
-- Name: module_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_resources_id_seq OWNED BY registry.module_resources.id;


--
-- Name: module_submodules; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_submodules (
    id integer NOT NULL,
    module_version_id integer,
    path text,
    readme text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    empty boolean DEFAULT false NOT NULL
);


ALTER TABLE registry.module_submodules OWNER TO hashicorp;

--
-- Name: module_submodules_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_submodules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_submodules_id_seq OWNER TO hashicorp;

--
-- Name: module_submodules_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_submodules_id_seq OWNED BY registry.module_submodules.id;


--
-- Name: module_variables; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_variables (
    id integer NOT NULL,
    module_submodule_id integer,
    name text,
    description text,
    default_value text,
    type text
);


ALTER TABLE registry.module_variables OWNER TO hashicorp;

--
-- Name: module_variables_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_variables_id_seq OWNER TO hashicorp;

--
-- Name: module_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_variables_id_seq OWNED BY registry.module_variables.id;


--
-- Name: module_versions; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.module_versions (
    id integer NOT NULL,
    module_provider_id integer,
    version text,
    source text,
    description text,
    downloads integer DEFAULT 0 NOT NULL,
    ingress_meta text,
    published_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    tag text
);


ALTER TABLE registry.module_versions OWNER TO hashicorp;

--
-- Name: module_versions_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.module_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.module_versions_id_seq OWNER TO hashicorp;

--
-- Name: module_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.module_versions_id_seq OWNED BY registry.module_versions.id;


--
-- Name: modules; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.modules (
    id integer NOT NULL,
    namespace registry.citext,
    name registry.citext,
    user_id integer,
    verified boolean DEFAULT false NOT NULL,
    unlisted boolean DEFAULT false NOT NULL
);


ALTER TABLE registry.modules OWNER TO hashicorp;

--
-- Name: modules_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.modules_id_seq OWNER TO hashicorp;

--
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.modules_id_seq OWNED BY registry.modules.id;


--
-- Name: notifications; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.notifications (
    id integer NOT NULL,
    created_at timestamp with time zone,
    resource_type text NOT NULL,
    resource_id integer NOT NULL,
    level text NOT NULL,
    title text NOT NULL,
    description text,
    read_at timestamp with time zone,
    version text,
    code text
);


ALTER TABLE registry.notifications OWNER TO hashicorp;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.notifications_id_seq OWNER TO hashicorp;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.notifications_id_seq OWNED BY registry.notifications.id;


--
-- Name: provider_docs; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.provider_docs (
    id integer NOT NULL,
    provider_version_id integer,
    path text NOT NULL,
    title text NOT NULL,
    category text NOT NULL,
    content text NOT NULL,
    truncated boolean DEFAULT false,
    subcategory text,
    slug text NOT NULL
);


ALTER TABLE registry.provider_docs OWNER TO hashicorp;

--
-- Name: provider_docs_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.provider_docs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.provider_docs_id_seq OWNER TO hashicorp;

--
-- Name: provider_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.provider_docs_id_seq OWNED BY registry.provider_docs.id;


--
-- Name: provider_platforms; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.provider_platforms (
    id integer NOT NULL,
    provider_version_id integer,
    os registry.citext,
    arch registry.citext,
    downloads integer DEFAULT 0 NOT NULL,
    ingress_meta text,
    shasum text
);


ALTER TABLE registry.provider_platforms OWNER TO hashicorp;

--
-- Name: provider_platforms_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.provider_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.provider_platforms_id_seq OWNER TO hashicorp;

--
-- Name: provider_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.provider_platforms_id_seq OWNED BY registry.provider_platforms.id;


--
-- Name: provider_versions; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.provider_versions (
    id integer NOT NULL,
    provider_id integer,
    version text,
    source text,
    description text,
    downloads integer DEFAULT 0 NOT NULL,
    ingress_meta text,
    published_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    protocols text[],
    tag text,
    key_id text NOT NULL,
    CONSTRAINT key_id_not_empty CHECK ((key_id <> ''::text))
);


ALTER TABLE registry.provider_versions OWNER TO hashicorp;

--
-- Name: provider_versions_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.provider_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.provider_versions_id_seq OWNER TO hashicorp;

--
-- Name: provider_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.provider_versions_id_seq OWNED BY registry.provider_versions.id;


--
-- Name: providers; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.providers (
    id integer NOT NULL,
    namespace registry.citext,
    name registry.citext,
    user_id integer,
    source text,
    downloads integer DEFAULT 0 NOT NULL,
    ingress text,
    ingress_meta text,
    alias registry.citext,
    tier registry.provider_tier DEFAULT 'community'::registry.provider_tier NOT NULL
);


ALTER TABLE registry.providers OWNER TO hashicorp;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.providers_id_seq OWNER TO hashicorp;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.providers_id_seq OWNED BY registry.providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE registry.schema_migrations OWNER TO hashicorp;

--
-- Name: users; Type: TABLE; Schema: registry; Owner: hashicorp
--

CREATE TABLE registry.users (
    id integer NOT NULL,
    username registry.citext,
    ingress_meta text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE registry.users OWNER TO hashicorp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: registry; Owner: hashicorp
--

CREATE SEQUENCE registry.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry.users_id_seq OWNER TO hashicorp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: registry; Owner: hashicorp
--

ALTER SEQUENCE registry.users_id_seq OWNED BY registry.users.id;


--
-- Name: ptfe_config; Type: TABLE; Schema: vault; Owner: hashicorp
--

CREATE TABLE vault.ptfe_config (
    secret_id text,
    unseal_key text,
    root_token text,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE vault.ptfe_config OWNER TO hashicorp;

--
-- Name: vault_ha_locks; Type: TABLE; Schema: vault; Owner: hashicorp
--

CREATE TABLE vault.vault_ha_locks (
    ha_key text COLLATE pg_catalog."C" NOT NULL,
    ha_identity text COLLATE pg_catalog."C" NOT NULL,
    ha_value text COLLATE pg_catalog."C",
    valid_until timestamp with time zone NOT NULL
);


ALTER TABLE vault.vault_ha_locks OWNER TO hashicorp;

--
-- Name: vault_kv_store; Type: TABLE; Schema: vault; Owner: hashicorp
--

CREATE TABLE vault.vault_kv_store (
    parent_path text COLLATE pg_catalog."C" NOT NULL,
    path text COLLATE pg_catalog."C" NOT NULL,
    key text COLLATE pg_catalog."C" NOT NULL,
    value bytea
);


ALTER TABLE vault.vault_kv_store OWNER TO hashicorp;

--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_cost_estimation ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_cost_estimation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_customization ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_customization_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_general ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_general_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_saml ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_saml_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_smtp ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_smtp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_twilio ALTER COLUMN id SET DEFAULT nextval('rails.admin_settings_twilio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.applies ALTER COLUMN id SET DEFAULT nextval('rails.applies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.archivist_objects ALTER COLUMN id SET DEFAULT nextval('rails.archivist_objects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.audit_trails ALTER COLUMN id SET DEFAULT nextval('rails.audit_trails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.authentication_tokens ALTER COLUMN id SET DEFAULT nextval('rails.authentication_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.configuration_versions ALTER COLUMN id SET DEFAULT nextval('rails.configuration_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.cost_estimates ALTER COLUMN id SET DEFAULT nextval('rails.cost_estimates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.email_recipients ALTER COLUMN id SET DEFAULT nextval('rails.email_recipients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.feature_sets ALTER COLUMN id SET DEFAULT nextval('rails.feature_sets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_apps ALTER COLUMN id SET DEFAULT nextval('rails.github_app_apps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_installations ALTER COLUMN id SET DEFAULT nextval('rails.github_app_installations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_oauth_tokens ALTER COLUMN id SET DEFAULT nextval('rails.github_app_oauth_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.hosted_files ALTER COLUMN id SET DEFAULT nextval('rails.hosted_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_attributes ALTER COLUMN id SET DEFAULT nextval('rails.ingress_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_triggers ALTER COLUMN id SET DEFAULT nextval('rails.ingress_triggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.memberships ALTER COLUMN id SET DEFAULT nextval('rails.memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.notification_configurations ALTER COLUMN id SET DEFAULT nextval('rails.notification_configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.o_auth_clients ALTER COLUMN id SET DEFAULT nextval('rails.o_auth_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.o_auth_tokens ALTER COLUMN id SET DEFAULT nextval('rails.o_auth_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_permission_sets ALTER COLUMN id SET DEFAULT nextval('rails.organization_permission_sets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_users ALTER COLUMN id SET DEFAULT nextval('rails.organization_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organizations ALTER COLUMN id SET DEFAULT nextval('rails.organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.plan_exports ALTER COLUMN id SET DEFAULT nextval('rails.plan_exports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.plans ALTER COLUMN id SET DEFAULT nextval('rails.plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policies ALTER COLUMN id SET DEFAULT nextval('rails.policies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_check_criteria ALTER COLUMN id SET DEFAULT nextval('rails.policy_check_criteria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_checks ALTER COLUMN id SET DEFAULT nextval('rails.policy_checks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_configs ALTER COLUMN id SET DEFAULT nextval('rails.policy_configs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_results ALTER COLUMN id SET DEFAULT nextval('rails.policy_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_policies ALTER COLUMN id SET DEFAULT nextval('rails.policy_set_policies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_versions ALTER COLUMN id SET DEFAULT nextval('rails.policy_set_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_workspaces ALTER COLUMN id SET DEFAULT nextval('rails.policy_set_workspaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_sets ALTER COLUMN id SET DEFAULT nextval('rails.policy_sets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_snapshots ALTER COLUMN id SET DEFAULT nextval('rails.policy_snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_versions ALTER COLUMN id SET DEFAULT nextval('rails.policy_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.prospective_users ALTER COLUMN id SET DEFAULT nextval('rails.prospective_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.registry_module_versions ALTER COLUMN id SET DEFAULT nextval('rails.registry_module_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.registry_modules ALTER COLUMN id SET DEFAULT nextval('rails.registry_modules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_events ALTER COLUMN id SET DEFAULT nextval('rails.run_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_trigger_snapshots ALTER COLUMN id SET DEFAULT nextval('rails.run_trigger_snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_triggers ALTER COLUMN id SET DEFAULT nextval('rails.run_triggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.runs ALTER COLUMN id SET DEFAULT nextval('rails.runs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.sessions ALTER COLUMN id SET DEFAULT nextval('rails.sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.setting_storage_postgres ALTER COLUMN id SET DEFAULT nextval('rails.setting_storage_postgres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ssh_keys ALTER COLUMN id SET DEFAULT nextval('rails.ssh_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_version_outputs ALTER COLUMN id SET DEFAULT nextval('rails.state_version_outputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_versions ALTER COLUMN id SET DEFAULT nextval('rails.state_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.subscriptions ALTER COLUMN id SET DEFAULT nextval('rails.subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.team_workspaces ALTER COLUMN id SET DEFAULT nextval('rails.team_workspaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.teams ALTER COLUMN id SET DEFAULT nextval('rails.teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.tool_versions ALTER COLUMN id SET DEFAULT nextval('rails.tool_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.users ALTER COLUMN id SET DEFAULT nextval('rails.users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vars ALTER COLUMN id SET DEFAULT nextval('rails.vars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_hosts ALTER COLUMN id SET DEFAULT nextval('rails.vcs_hosts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_repos ALTER COLUMN id SET DEFAULT nextval('rails.vcs_repos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.webhook_payloads ALTER COLUMN id SET DEFAULT nextval('rails.webhook_payloads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_comments ALTER COLUMN id SET DEFAULT nextval('rails.workspace_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_configuration_versions ALTER COLUMN id SET DEFAULT nextval('rails.workspace_configuration_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspaces ALTER COLUMN id SET DEFAULT nextval('rails.workspaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.gpg_keys ALTER COLUMN id SET DEFAULT nextval('registry.gpg_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.last_modified_times ALTER COLUMN id SET DEFAULT nextval('registry.last_modified_times_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.logprocessor_files_complete ALTER COLUMN id SET DEFAULT nextval('registry.logprocessor_files_complete_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_deps ALTER COLUMN id SET DEFAULT nextval('registry.module_deps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_outputs ALTER COLUMN id SET DEFAULT nextval('registry.module_outputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_provider_deps ALTER COLUMN id SET DEFAULT nextval('registry.module_provider_deps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_providers ALTER COLUMN id SET DEFAULT nextval('registry.module_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_resources ALTER COLUMN id SET DEFAULT nextval('registry.module_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_submodules ALTER COLUMN id SET DEFAULT nextval('registry.module_submodules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_variables ALTER COLUMN id SET DEFAULT nextval('registry.module_variables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_versions ALTER COLUMN id SET DEFAULT nextval('registry.module_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.modules ALTER COLUMN id SET DEFAULT nextval('registry.modules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.notifications ALTER COLUMN id SET DEFAULT nextval('registry.notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_docs ALTER COLUMN id SET DEFAULT nextval('registry.provider_docs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_platforms ALTER COLUMN id SET DEFAULT nextval('registry.provider_platforms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_versions ALTER COLUMN id SET DEFAULT nextval('registry.provider_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.providers ALTER COLUMN id SET DEFAULT nextval('registry.providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.users ALTER COLUMN id SET DEFAULT nextval('registry.users_id_seq'::regclass);


--
-- Data for Name: admin_settings_cost_estimation; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_cost_estimation (id, enabled, aws_access_key_id_encrypted, aws_secret_key_encrypted, gcp_credentials_encrypted, created_at, updated_at, azure_subscription_id_encrypted, azure_tenant_id_encrypted, azure_client_id_encrypted, azure_client_secret_encrypted, aws_enabled, gcp_enabled, azure_enabled) FROM stdin;
1	f	\N	\N	\N	2020-07-03 10:28:34.365686	2020-07-03 10:28:34.365686	\N	\N	\N	\N	t	t	t
\.


--
-- Name: admin_settings_cost_estimation_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_cost_estimation_id_seq', 1, true);


--
-- Data for Name: admin_settings_customization; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_customization (id, support_email_address, created_at, updated_at, login_help, footer, error, new_user) FROM stdin;
1	support@hashicorp.com	2020-07-03 10:27:49.943923	2020-07-03 10:27:49.943923	\N	\N	\N	\N
\.


--
-- Name: admin_settings_customization_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_customization_id_seq', 1, true);


--
-- Data for Name: admin_settings_general; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_general (id, support_email_address, security_email_address, limit_user_organization_creation, created_at, updated_at, api_rate_limiting_enabled, api_rate_limit, require_two_factor_for_admins, limit_organizations_per_user, default_organizations_per_user_ceiling, limit_workspaces_per_organization, default_workspaces_per_organization_ceiling, notification_retry_limit, terraform_build_worker_plan_timeout, terraform_build_worker_apply_timeout, send_passing_statuses_for_untriggered_speculative_plans, allow_speculative_plans_on_pull_requests_from_forks) FROM stdin;
1	support@hashicorp.com	security@hashicorp.com	t	2020-07-03 10:27:49.930925	2020-07-03 10:27:49.930925	t	30	f	f	100	f	1000	5	2h	24h	t	f
\.


--
-- Name: admin_settings_general_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_general_id_seq', 1, true);


--
-- Data for Name: admin_settings_saml; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_saml (id, enabled, idp_cert_encrypted, slo_endpoint_url, sso_endpoint_url, attr_groups, attr_site_admin, site_admin_role, sso_api_token_session_timeout, created_at, updated_at, debug, attr_username, team_management_enabled, old_idp_cert_encrypted, certificate_encrypted, private_key_encrypted, authn_requests_signed, want_assertions_signed) FROM stdin;
1	f	\N	\N	\N	MemberOf	SiteAdmin	site-admins	1209600	2020-07-03 10:27:46.764999	2020-07-03 10:27:46.764999	f	Username	t	\N	\N	\N	f	f
\.


--
-- Name: admin_settings_saml_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_saml_id_seq', 1, true);


--
-- Data for Name: admin_settings_smtp; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_smtp (id, enabled, host, port, auth, username, password_encrypted, sender, created_at, updated_at) FROM stdin;
1	f	\N	\N	none	\N	\N	\N	2020-07-03 10:27:46.693859	2020-07-03 10:27:46.693859
\.


--
-- Name: admin_settings_smtp_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_smtp_id_seq', 1, true);


--
-- Data for Name: admin_settings_twilio; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.admin_settings_twilio (id, enabled, account_sid, auth_token_encrypted, from_number, created_at, updated_at) FROM stdin;
1	f	\N	\N	\N	2020-07-03 10:27:46.72552	2020-07-03 10:27:46.729601
\.


--
-- Name: admin_settings_twilio_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.admin_settings_twilio_id_seq', 1, true);


--
-- Data for Name: applies; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.applies (id, external_id, created_at, updated_at, run_id, archivist_upload_id, status, status_timestamps, logs_compress_encrypt, encryption_context, resource_additions, resource_changes, resource_destructions, tokens_at_enqueue) FROM stdin;
\.


--
-- Name: applies_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.applies_id_seq', 1, false);


--
-- Data for Name: archivist_objects; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.archivist_objects (id, attachable_id, attachable_type, archivist_upload_id, uploaded_at, keypath, encryption_context, compress, max_size, filename, size, deletable_after, metric_scope, created_at, updated_at, type) FROM stdin;
\.


--
-- Name: archivist_objects_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.archivist_objects_id_seq', 1, false);


--
-- Data for Name: audit_trails; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.audit_trails (id, uuid, "timestamp", auth_accessor_id, auth_description, auth_type, auth_impersonator_id, auth_organization_id, request_id, request_remote_addr, resource_id, resource_type, resource_action, resource_meta, created_at, updated_at) FROM stdin;
\.


--
-- Name: audit_trails_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.audit_trails_id_seq', 1, false);


--
-- Data for Name: authentication_tokens; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.authentication_tokens (id, user_id, description, created_at, updated_at, is_hidden, token_hash, delete_at, authentication_tokenable_id, authentication_tokenable_type, created_by_id, created_by_type, last_used_at, external_id) FROM stdin;
\.


--
-- Name: authentication_tokens_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.authentication_tokens_id_seq', 1, false);


--
-- Data for Name: configuration_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.configuration_versions (id, created_by_id, error, metadata_encrypted, status, status_timestamps, internal_error, external_id, created_at, updated_at, organization_id, source, vcs_repo_id, trace_resource_id, encryption_context, auto_queue_runs, skip_uploaded_callback, speculative, changed_files) FROM stdin;
\.


--
-- Name: configuration_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.configuration_versions_id_seq', 1, false);


--
-- Data for Name: cost_estimates; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.cost_estimates (id, external_id, run_id, results, status, status_timestamps, error_message, created_at, updated_at, nomad_job_id) FROM stdin;
\.


--
-- Name: cost_estimates_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.cost_estimates_id_seq', 1, false);


--
-- Data for Name: email_recipients; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.email_recipients (id, notification_configuration_id, user_id, external_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: email_recipients_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.email_recipients_id_seq', 1, false);


--
-- Data for Name: feature_sets; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.feature_sets (id, external_id, plan_id, name, cost_estimation, sentinel, teams, created_at, updated_at, is_current, cost, description, comparison_description, is_public, user_limit, identifier, self_serve_billing, audit_logging, sso, private_networking) FROM stdin;
\.


--
-- Name: feature_sets_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.feature_sets_id_seq', 1, false);


--
-- Data for Name: github_app_apps; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.github_app_apps (id, external_id, name, client_id, client_secret_encrypted, private_key_encrypted, global, created_at, updated_at, webhook_secret_encrypted, app_id) FROM stdin;
\.


--
-- Name: github_app_apps_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.github_app_apps_id_seq', 1, false);


--
-- Data for Name: github_app_installations; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.github_app_installations (id, external_id, app_id, installation_id, name, created_at, updated_at, icon_url) FROM stdin;
\.


--
-- Name: github_app_installations_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.github_app_installations_id_seq', 1, false);


--
-- Data for Name: github_app_oauth_tokens; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.github_app_oauth_tokens (id, external_id, user_id, app_id, value_encrypted, created_at, updated_at, github_user_id) FROM stdin;
\.


--
-- Name: github_app_oauth_tokens_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.github_app_oauth_tokens_id_seq', 1, false);


--
-- Data for Name: hosted_files; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.hosted_files (id, hostable_id, hostable_type, binstore_key, disk_space, uploaded_at, created_at, updated_at, archivist_upload_id, archivist_upload_url, deleted_at, hostable_storage_key, deletable_after, cached_metadata) FROM stdin;
\.


--
-- Name: hosted_files_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.hosted_files_id_seq', 1, false);


--
-- Data for Name: ingress_attributes; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.ingress_attributes (id, branch, clone_url, commit_sha, commit_url, compare_url, is_pull_request, commit_message, on_default_branch, pull_request_number, ingress_submodules, pull_request_url, identifier, tag, sender_username, created_by_id, ingress_attributable_id, ingress_attributable_type, created_at, updated_at, webhook_payload_id, sender_avatar_url, sender_html_url, external_id, pull_request_title, pull_request_body) FROM stdin;
\.


--
-- Name: ingress_attributes_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.ingress_attributes_id_seq', 1, false);


--
-- Data for Name: ingress_triggers; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.ingress_triggers (id, external_id, vcs_repo_id, default_branch, branch, tags, created_at, updated_at, ingress_submodules, ingressable_type, ingressable_id) FROM stdin;
\.


--
-- Name: ingress_triggers_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.ingress_triggers_id_seq', 1, false);


--
-- Data for Name: memberships; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.memberships (id, team_id, created_at, updated_at, status, status_timestamps, organization_user_id) FROM stdin;
1	1	2020-07-03 10:29:23.77975	2020-07-03 10:29:23.77975	active		1
\.


--
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.memberships_id_seq', 1, true);


--
-- Data for Name: notification_configurations; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.notification_configurations (id, name, external_id, url, destination_type, token_encrypted, triggers, enabled, subscribable_id, subscribable_type, created_at, updated_at, delivery_response, email_addresses) FROM stdin;
\.


--
-- Name: notification_configurations_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.notification_configurations_id_seq', 1, false);


--
-- Data for Name: o_auth_clients; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.o_auth_clients (id, oauth_clientable_id, oauth_clientable_type, service_provider, secret_encrypted, key, http_url, api_url, webhook_secret_encrypted, string, uuid, approved, global, created_at, updated_at, rsa_public_key, request_token, request_token_secret, external_id, name) FROM stdin;
\.


--
-- Name: o_auth_clients_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.o_auth_clients_id_seq', 1, false);


--
-- Data for Name: o_auth_tokens; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.o_auth_tokens (id, oauth_tokenable_id, oauth_tokenable_type, value_encrypted, info_encrypted, uid, created_at, updated_at, oauth_client_id, anonymous, refresh_token_encrypted, secret_encrypted, ssh_key_encrypted, external_id) FROM stdin;
\.


--
-- Name: o_auth_tokens_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.o_auth_tokens_id_seq', 1, false);


--
-- Data for Name: organization_permission_sets; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.organization_permission_sets (id, team_id, manage_policies, manage_workspaces, manage_vcs_settings, created_at, updated_at) FROM stdin;
1	1	f	f	f	2020-07-03 10:29:23.750745	2020-07-03 10:29:23.750745
\.


--
-- Name: organization_permission_sets_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.organization_permission_sets_id_seq', 1, true);


--
-- Data for Name: organization_users; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.organization_users (id, organization_id, user_id, created_at, updated_at, external_id, status) FROM stdin;
1	1	1	2020-07-03 10:29:23.770415	2020-07-03 10:29:23.770415	ou-rch5nFmEa1GccPui	active
\.


--
-- Name: organization_users_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.organization_users_id_seq', 1, true);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.organizations (id, email, created_at, updated_at, collaborator_auth_policy, access_beta_tools, session_timeout, session_remember, external_id, encryption_context, owners_team_saml_role_id, name, runs_ceiling, created_by_id, cost_estimation_enabled, terraform_worker_sudo_enabled, terraform_build_worker_apply_timeout, terraform_build_worker_plan_timeout, is_disabled) FROM stdin;
1	guseletov@gmail.com	2020-07-03 10:29:23.731436	2020-07-03 10:29:23.781973	password	f	\N	\N	org-Z7r5MRiQdqK7DfZN	\N	\N	testibit	1	1	f	f	\N	\N	f
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.organizations_id_seq', 1, true);


--
-- Data for Name: plan_exports; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.plan_exports (id, external_id, plan_id, data_type, status, status_timestamps, encryption_context, created_at, updated_at, nomad_job_id, error_message) FROM stdin;
\.


--
-- Name: plan_exports_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.plan_exports_id_seq', 1, false);


--
-- Data for Name: plans; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.plans (id, external_id, created_at, updated_at, run_id, status, status_timestamps, archivist_upload_id, has_changes, encryption_context, logs_compress_encrypt, resource_additions, resource_changes, resource_destructions, tokens_at_enqueue) FROM stdin;
\.


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.plans_id_seq', 1, false);


--
-- Data for Name: policies; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policies (id, holder_id, holder_type, name, created_at, updated_at, external_id, description) FROM stdin;
\.


--
-- Name: policies_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policies_id_seq', 1, false);


--
-- Data for Name: policy_check_criteria; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_check_criteria (id, policy_check_id, policy_set_version_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: policy_check_criteria_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_check_criteria_id_seq', 1, false);


--
-- Data for Name: policy_checks; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_checks (id, external_id, run_id, status, scope, status_timestamps, created_at, updated_at, nomad_job_id) FROM stdin;
\.


--
-- Name: policy_checks_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_checks_id_seq', 1, false);


--
-- Data for Name: policy_configs; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_configs (id, policy_id, enforce, created_at, updated_at) FROM stdin;
\.


--
-- Name: policy_configs_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_configs_id_seq', 1, false);


--
-- Data for Name: policy_results; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_results (id, policy_check_id, result, passed, total_failed, hard_failed, soft_failed, advisory_failed, duration_ms, sentinel, created_at, updated_at, external_id, encryption_context) FROM stdin;
\.


--
-- Name: policy_results_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_results_id_seq', 1, false);


--
-- Data for Name: policy_set_policies; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_set_policies (id, policy_set_id, policy_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: policy_set_policies_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_set_policies_id_seq', 1, false);


--
-- Data for Name: policy_set_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_set_versions (id, policy_set_id, created_at, updated_at, source, status, error, internal_error, status_timestamps, trace_resource_id, created_by_id, vcs_repo_id, ingress_attributes_id, external_id, monorepo) FROM stdin;
\.


--
-- Name: policy_set_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_set_versions_id_seq', 1, false);


--
-- Data for Name: policy_set_workspaces; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_set_workspaces (id, policy_set_id, workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: policy_set_workspaces_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_set_workspaces_id_seq', 1, false);


--
-- Data for Name: policy_sets; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_sets (id, external_id, organization_id, name, description, global, created_at, updated_at, policies_path) FROM stdin;
\.


--
-- Name: policy_sets_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_sets_id_seq', 1, false);


--
-- Data for Name: policy_snapshots; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_snapshots (id, policy_check_id, policy_version_id, policy_config_id, policy_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: policy_snapshots_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_snapshots_id_seq', 1, false);


--
-- Data for Name: policy_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.policy_versions (id, policy_id, encryption_context, files, uploaded, created_at, updated_at, external_id) FROM stdin;
\.


--
-- Name: policy_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.policy_versions_id_seq', 1, false);


--
-- Data for Name: prospective_users; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.prospective_users (id, email, created_at, updated_at, free_organizations_enabled) FROM stdin;
\.


--
-- Name: prospective_users_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.prospective_users_id_seq', 1, false);


--
-- Data for Name: registry_module_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.registry_module_versions (id, registry_module_id, external_id, encryption_context, version, created_at, updated_at, source, error, internal_error, trace_resource_id, vcs_repo_id, ingress_attributes_id, created_by_id, status, status_timestamps) FROM stdin;
\.


--
-- Name: registry_module_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.registry_module_versions_id_seq', 1, false);


--
-- Data for Name: registry_modules; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.registry_modules (id, external_id, name, provider, organization_id, created_at, updated_at, status, status_timestamps) FROM stdin;
\.


--
-- Name: registry_modules_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.registry_modules_id_seq', 1, false);


--
-- Data for Name: run_events; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.run_events (id, action, external_id, actor_id, actor_type, run_id, target_id, target_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: run_events_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.run_events_id_seq', 1, false);


--
-- Data for Name: run_trigger_snapshots; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.run_trigger_snapshots (id, external_id, run_id, run_trigger_workspace_id, triggered_run_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: run_trigger_snapshots_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.run_trigger_snapshots_id_seq', 1, false);


--
-- Data for Name: run_triggers; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.run_triggers (id, external_id, workspace_id, sourceable_id, sourceable_type, created_at) FROM stdin;
\.


--
-- Name: run_triggers_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.run_triggers_id_seq', 1, false);


--
-- Data for Name: runs; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.runs (id, configuration_version_id, workspace_id, input_state_version_id, created_by_id, confirmed_by_id, canceled_by_id, external_id, status, status_timestamps, auto_apply, source, terraform_version, is_destroy, error_text, message, metadata_encrypted, created_at, updated_at, var_snapshot_encrypted, trace_resource_id, authentication_token_id, canceled_at, force_canceled_at, trigger_reason, target_addrs) FROM stdin;
\.


--
-- Name: runs_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.runs_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.schema_migrations (version) FROM stdin;
20140122183426
20140122191656
20140122223900
20140122235432
20140123031200
20140123174231
20140131155837
20140202155910
20140225223823
20140307235845
20140312165847
20140324141954
20140325132453
20140326164023
20140326190303
20140403153028
20140403153036
20140403153140
20140404165606
20140408041820
20140408175354
20140414210611
20140506142312
20140506142332
20140506143422
20140518094209
20140518100819
20140519182714
20140528195715
20140528205056
20140529161625
20140610155143
20140611135813
20140612172508
20140717141340
20140916185122
20140917151920
20140919140851
20141001230415
20141009170259
20141009203005
20141013131116
20141023175840
20141023180212
20141023180326
20141023180601
20141023180714
20141023180755
20141023180820
20141027212841
20141028003455
20141028205141
20141030193001
20141031070754
20141103000000
20141104163813
20141105193650
20141105194812
20141106004554
20141106191819
20141113144404
20141113190123
20141114051138
20141114155433
20141115024319
20141117164413
20141117224148
20141118061050
20141118144654
20141118193637
20141119010359
20141120182208
20141124210411
20141125202759
20141126144930
20141126145225
20141126213601
20141201150840
20141201150856
20141203042210
20141203043227
20141203073611
20141204220033
20141206211453
20141208000634
20141209035954
20141209162529
20141212021826
20141216184403
20150121210949
20150123185553
20150123190353
20150126235107
20150206153241
20150219213249
20150303152022
20150303163225
20150303220219
20150304201839
20150306161933
20150306162105
20150306184543
20150306215549
20150306215904
20150313211827
20150323193352
20150324204049
20150324223525
20150331183152
20150331183318
20150331184643
20150331222510
20150401011452
20150401173228
20150401210642
20150402012213
20150402151048
20150402191756
20150402192622
20150403012544
20150403143704
20150404170552
20150404171434
20150407040449
20150409150142
20150409173306
20150415191122
20150420124901
20150421153612
20150422144052
20150427161124
20150427212648
20150427232203
20150428133657
20150501155104
20150501162730
20150504181959
20150505023435
20150505100942
20150505101242
20150505160531
20150506225307
20150507000923
20150507103841
20150507193819
20150507193820
20150508012915
20150508193246
20150511190023
20150512223806
20150513224304
20150515182144
20150518085426
20150520132058
20150521224047
20150525145233
20150526232031
20150527220335
20150528232810
20150529164433
20150529200050
20150603204630
20150604221704
20150604222333
20150605181757
20150609214502
20150610183920
20150610194528
20150611142439
20150611143525
20150611143534
20150611163416
20150612194915
20150612201242
20150617201814
20150618190502
20150619135818
20150619152612
20150619193600
20150622124133
20150622160442
20150622174653
20150622195401
20150622200607
20150622201216
20150623161103
20150623192940
20150623195054
20150623200008
20150623212413
20150624163246
20150624171234
20150624175803
20150624205417
20150625203445
20150625212625
20150626160456
20150629195908
20150630201846
20150630212537
20150710234136
20150711185338
20150713231354
20150715142528
20150719191443
20150720192447
20150720230530
20150721223354
20150722181842
20150728200608
20150728215146
20150728215148
20150728215149
20150730194028
20150803213921
20150804152325
20150806214739
20150807173917
20150811214403
20150813171929
20150818172344
20150820143645
20150820153139
20150820222120
20150821173337
20150821190759
20150821192303
20150821233028
20150824203112
20150824221000
20150825140051
20150827010223
20150827155746
20150827163038
20150827173741
20150827203815
20150827203901
20150828132251
20150828134537
20150828182048
20150828193515
20150901144551
20150901154038
20150901184248
20150904155621
20150908113401
20150914223249
20150915170059
20150918181249
20150925212555
20150926010823
20150927174403
20150929183018
20150930155910
20151002140540
20151002184757
20151012183009
20151015223132
20151021193839
20151021193840
20151027173736
20151027181006
20151028181309
20151104150138
20151105211137
20151111000015
20151111234037
20151113143219
20151113234616
20151116182457
20151118231651
20151123222746
20151208154716
20151208210009
20151218222703
20151218233928
20151221144131
20160106135943
20160114155025
20160114162924
20160114200429
20160121180734
20160129200052
20160203204203
20160211182425
20160211205606
20160211224025
20160212164553
20160217132942
20160217133229
20160219001447
20160226194335
20160301132746
20160302191017
20160305231747
20160308022209
20160324151847
20160324151956
20160324190225
20160325150355
20160328154437
20160329135358
20160408154709
20160414171704
20160414193947
20160420144106
20160422160942
20160502183054
20160512185227
20160512191810
20160517163418
20160601233536
20160617164517
20160621181023
20160621201955
20160622150422
20160624143428
20160624153515
20160720081633
20160721203110
20160722201147
20160725133652
20160810182340
20160811160340
20160815144325
20160815144833
20160819174110
20160819184140
20160823142851
20160823150841
20160823195424
20160823195825
20160826151559
20160831133439
20160915145840
20160915184028
20160916190602
20160928175226
20160929172526
20160930181240
20160930184005
20161011151143
20161018184218
20161025192030
20161025213828
20161026154132
20161026202658
20161027125407
20161027164454
20161103140112
20161109161916
20161121195937
20161121230756
20161128171656
20161128175831
20161130201749
20161206141430
20161213200810
20161213234258
20170106204452
20170106214917
20170118150544
20170125203105
20170127191056
20170130144531
20170130224419
20170203090917
20170221152329
20170224165938
20170227125042
20170306182901
20170309131307
20170309151031
20170405213956
20170418224452
20170419002025
20170424205035
20170425170833
20170518195342
20170522010102
20170522010404
20170522010600
20170522010829
20170522011139
20170522011235
20170522011340
20170522011612
20170522011841
20170522013726
20170522014249
20170522014439
20170522014515
20170522014606
20170522020801
20170522193603
20170523191248
20170523212212
20170523213029
20170523220726
20170524163517
20170524180537
20170524210336
20170524231659
20170525211427
20170525225643
20170525230749
20170525230946
20170526020102
20170530181401
20170530193153
20170531142428
20170531145724
20170601220456
20170602032335
20170605144353
20170605145515
20170605151613
20170605200827
20170605203651
20170605214715
20170606182804
20170606195720
20170606200658
20170606204616
20170606204633
20170607140948
20170609153438
20170609160229
20170609205203
20170612141443
20170612204731
20170614182315
20170614234015
20170614234023
20170614234033
20170615140550
20170615205658
20170619180739
20170619212700
20170630202412
20170630234439
20170701003456
20170701180057
20170705221417
20170706135447
20170707153525
20170709205452
20170710070544
20170719142308
20170719154644
20170720182711
20170731173926
20170731175254
20170731201856
20170802231137
20170808155910
20170808185923
20170814190027
20170814195214
20170817151846
20170821154316
20170823193637
20170824001510
20170825171708
20170825171759
20170828214448
20170830045612
20170830053139
20170830054446
20170830182155
20170831124625
20170831172714
20170831180229
20170831180252
20170831180317
20170831235506
20170901192330
20170901235318
20170907135516
20170913144812
20170913234651
20170915053202
20170916062506
20170918230205
20170919002208
20170924222319
20170926001929
20170927225103
20170928001234
20170928160148
20170928160944
20170928161032
20171003164127
20171003195818
20171003203050
20171003203554
20171004191738
20171005005201
20171005044233
20171018151639
20171018153755
20171018154411
20171018193400
20171019193721
20171024203159
20171024204156
20171031175536
20171102002602
20171106002602
20171107001512
20171108222651
20171108234115
20171114122218
20171121101835
20171201181049
20171201182541
20171201182644
20171201182813
20171213163659
20171215011606
20171215011634
20171215011642
20171215011736
20171216004501
20171216004527
20171216004553
20171216004601
20171218174359
20171218174419
20171218174438
20171218175801
20171218181945
20171218182001
20171218182611
20171218182629
20180103143427
20180108220536
20180116163918
20180119172317
20180122153247
20180206013213
20180214185324
20180216085148
20180227174021
20180306193102
20180319234410
20180323060348
20180403165601
20180406233431
20180409184812
20180409220648
20180411230402
20180427145629
20180501233617
20180501233735
20180501235717
20180501235813
20180507234629
20180508005409
20180508024446
20180529171731
20180531233011
20180531242409
20180604182341
20180606035915
20180611211604
20180617203739
20180627163234
20180627172656
20180629143210
20180705164718
20180706001712
20180706031033
20180709081735
20180709163550
20180710162416
20180710164401
20180711041600
20180716041426
20180717153207
20180717160832
20180717163256
20180717225030
20180719002832
20180809184137
20180809231900
20180810192603
20180810193001
20180813195852
20180814060047
20180814183103
20180814210358
20180815203941
20180816161509
20180816173856
20180816190621
20180816190753
20180820181100
20180820181113
20180831143907
20180906130532
20180906132633
20180906224912
20180920003747
20180920170642
20180921164736
20180921232555
20180921233140
20180925161654
20181003002730
20181005193122
20181009155413
20181009155754
20181009155944
20181009163630
20181009171051
20181011160635
20181015151010
20181015151020
20181102175537
20181102221129
20181111230657
20181113191956
20181119173449
20181119190936
20181128224552
20181203080256
20181203080908
20181203080915
20181207040143
20181207233246
20181212143605
20181212143735
20181212143838
20181213000713
20181213170451
20190104235032
20190108163510
20190110161806
20190110163226
20190110163613
20190110180555
20190111130402
20190111131051
20190111222035
20190115003922
20190115194628
20190115212610
20190123215052
20190130233027
20190206011026
20190206141024
20190209002648
20190209033436
20190212010624
20190213123657
20190213123819
20190215233803
20190222214023
20190304211835
20190304234710
20190304234741
20190306191604
20190306191617
20190306191631
20190306191701
20190306200126
20190306293805
20190321165158
20190321165407
20190321165541
20190325233909
20190327191459
20190329213242
20190329213251
20190329213320
20190403224246
20190408153036
20190416203751
20190417185904
20190418120059
20190418120306
20190425023658
20190429143615
20190430132952
20190501172315
20190503171555
20190503192330
20190506134915
20190508161937
20190508192817
20190508202406
20190511000518
20190511033020
20190515191824
20190517133733
20190522225944
20190527174033
20190603152157
20190603212506
20190604002604
20190604144842
20190604180551
20190604180646
20190604200941
20190604204317
20190605174857
20190606190545
20190607155525
20190607215522
20190607215643
20190607223923
20190612162024
20190614142905
20190619201753
20190624201515
20190708065007
20190708193058
20190708205327
20190710203409
20190723013452
20190731205637
20190801093934
20190801141731
20190801142547
20190801152455
20190801155338
20190802023204
20190805191634
20190805194758
20190808125743
20190808161702
20190808223114
20190808231411
20190809184561
20190819135622
20190820175628
20190822162931
20190829205716
20190830172923
20190830194405
20190904202141
20190905205112
20190909151416
20190909161940
20190917152943
20190917210110
20190919192631
20190919192847
20190919193147
20190924213810
20190930144135
20191002200328
20191002220600
20191002220654
20191003220657
20191015153248
20191015153703
20191016144005
20191017160802
20191018180140
20191018194250
20191018194435
20191018202809
20191022155708
20191023165551
20191024152322
20191024183311
20191024193801
20191024194954
20191025223169
20191025223223
20191025233740
20191029132608
20191029151526
20191029162407
20191030134757
20191031163607
20191031165349
20191101010249
20191105014112
20191105231637
20191114145830
20191115043800
20191115155706
20191118175920
20191118180115
20191118180930
20191122152451
20191204163830
20191210185329
20191211170818
20191211224550
20191213205607
20200102232236
20200102232546
20200102232810
20200107193955
20200108004618
20200109193955
20200115181148
20200115192207
20200115194017
20200122182052
20200123163007
20200211211852
20200218004246
20200222000145
20200222001545
20200309032118
20200309145059
20200309193628
20200323183130
20200323183151
20200324190230
20200331140136
20200414165940
20200422035113
20200504163716
20200505170550
20200505185721
20200505215329
20200511144854
20200519164011
20200521180003
20200528183717
20200528220746
20200528220811
20200601044332
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.sessions (id, user_id, key, ip_address, user_agent, last_sudo_at, last_accessed_at, revoked_at, created_at) FROM stdin;
1	1	2df7521fb50b10fefef23b4643bf1c9635fa4467fa94c3fea094608ea2ff5411	10.0.1.41	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36	\N	2020-07-03 10:29:01.115261	\N	2020-07-03 10:29:01.115119
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.sessions_id_seq', 1, true);


--
-- Data for Name: setting_storage_postgres; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.setting_storage_postgres (id, key, value_encrypted, value_class, created_at, updated_at) FROM stdin;
\.


--
-- Name: setting_storage_postgres_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.setting_storage_postgres_id_seq', 1, false);


--
-- Data for Name: ssh_keys; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.ssh_keys (id, ssh_keyable_id, ssh_keyable_type, value_encrypted, name, created_at, updated_at, external_id) FROM stdin;
\.


--
-- Name: ssh_keys_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.ssh_keys_id_seq', 1, false);


--
-- Data for Name: state_version_outputs; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.state_version_outputs (id, state_version_id, name, external_id, output_type, sensitive, value_encrypted) FROM stdin;
\.


--
-- Name: state_version_outputs_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.state_version_outputs_id_seq', 1, false);


--
-- Data for Name: state_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.state_versions (id, external_id, serial, created_by_id, workspace_id, created_at, updated_at, operation_id, operation_type, run_id, md5, encryption_context, lineage, skip_uploaded_callback, state_version, terraform_version, modules, providers, resources) FROM stdin;
\.


--
-- Name: state_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.state_versions_id_seq', 1, false);


--
-- Data for Name: stored_traces; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.stored_traces (id, "timestamp", source, description, error_message, resource_id, request_id, user_id) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.subscriptions (id, external_id, organization_id, start_at, end_at, created_at, updated_at, created_by_id, active, next_subscription_id, trial_status, feature_set_id) FROM stdin;
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.subscriptions_id_seq', 1, false);


--
-- Data for Name: team_workspaces; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.team_workspaces (id, team_id, workspace_id, created_at, updated_at, access, external_id, runs_permission, variables_permission, state_versions_permission, sentinel_mocks_permission, workspace_locking_permission) FROM stdin;
\.


--
-- Name: team_workspaces_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.team_workspaces_id_seq', 1, false);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.teams (id, organization_id, name, created_at, updated_at, external_id, api_user_id, visibility) FROM stdin;
1	1	owners	2020-07-03 10:29:23.747768	2020-07-03 10:29:23.781044	team-F5u9V3a15duUiFRz	\N	secret
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.teams_id_seq', 1, true);


--
-- Data for Name: tool_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.tool_versions (id, tool, version, url, sha, official, enabled, beta, external_id, created_at, updated_at, "position") FROM stdin;
88	terraform	0.7.9	https://releases.hashicorp.com/terraform/0.7.9/terraform_0.7.9_linux_amd64.zip	ac1d0302818ae17f1042dc26407e7ff94cd1e34ed260dae9d72c75a4d0b59cfc	t	t	f	tool-dy3thA7Y9grh4ERz	2020-07-03 10:27:56.097428	2020-07-03 10:27:56.097428	21
87	terraform	0.7.10	https://releases.hashicorp.com/terraform/0.7.10/terraform_0.7.10_linux_amd64.zip	a6da76d6228349855f7c503b769fb231e6b1009add5e5b2586ecb7624e9ecf15	t	t	f	tool-v4wLf97qgAFW82Zw	2020-07-03 10:27:55.977814	2020-07-03 10:27:55.977814	22
86	terraform	0.7.11	https://releases.hashicorp.com/terraform/0.7.11/terraform_0.7.11_linux_amd64.zip	1a1aa419d614ea38d93cc751e00874ace9414184c75e66480384c464e8a634db	t	t	f	tool-Dhg7SPx9imuAGp1B	2020-07-03 10:27:55.901958	2020-07-03 10:27:55.901958	23
85	terraform	0.7.12	https://releases.hashicorp.com/terraform/0.7.12/terraform_0.7.12_linux_amd64.zip	ba75875a9c61b010e217786f42c7b214b7bc4227922261604c67834638ad65f7	t	t	f	tool-VW8XMBLmKNRKyJB2	2020-07-03 10:27:55.801987	2020-07-03 10:27:55.801987	24
70	terraform	0.9.4	https://releases.hashicorp.com/terraform/0.9.4/terraform_0.9.4_linux_amd64.zip	cc1cffee3b82820b7f049bb290b841762ee920aef3cf4d95382cc7ea01135707	t	t	f	tool-3KScPnoWwj7VQx6H	2020-07-03 10:27:54.352008	2020-07-03 10:27:54.352008	39
69	terraform	0.9.5	https://releases.hashicorp.com/terraform/0.9.5/terraform_0.9.5_linux_amd64.zip	0cbb5474c76d878fbc99e7705ce6117f4ea0838175c13b2663286a207e38d783	t	t	f	tool-GXHMF37ifjVCTnsk	2020-07-03 10:27:54.269312	2020-07-03 10:27:54.269312	40
68	terraform	0.9.6	https://releases.hashicorp.com/terraform/0.9.6/terraform_0.9.6_linux_amd64.zip	7ec24a5d57da6ef7bdb5a3003791a4368489b32fa93be800655ccef0eceaf1ba	t	t	f	tool-x17emzjkYNFg174L	2020-07-03 10:27:54.184443	2020-07-03 10:27:54.184443	41
90	terraform	0.7.7	https://releases.hashicorp.com/terraform/0.7.7/terraform_0.7.7_linux_amd64.zip	478c4fe311392804ffc449995e8d7f903abab56f7483f317c1f120d8c21b1a81	t	t	f	tool-zoPfjHyygRBx8W6K	2020-07-03 10:27:56.31395	2020-07-03 10:27:56.31395	19
89	terraform	0.7.8	https://releases.hashicorp.com/terraform/0.7.8/terraform_0.7.8_linux_amd64.zip	b3394910c6a1069882f39ad590eead0414d34d5bd73d4d47fa44e66f53454b5a	t	t	f	tool-bFoJ7KTFpN1y4S8A	2020-07-03 10:27:56.221896	2020-07-03 10:27:56.221896	20
72	terraform	0.9.2	https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip	a916228ea4c19c91c9a5dee2905885f517eb7c31ba4dbf5d79f9f36606973313	t	t	f	tool-Bf8QxSXnRAm5JF4v	2020-07-03 10:27:54.512398	2020-07-03 10:27:54.512398	37
71	terraform	0.9.3	https://releases.hashicorp.com/terraform/0.9.3/terraform_0.9.3_linux_amd64.zip	f34b96f7b7edaf8c4dc65f6164ba0b8f21195f5cbe5b7288ad994aa9794bb607	t	t	f	tool-y1NgJbnuNBFQgPdq	2020-07-03 10:27:54.43784	2020-07-03 10:27:54.43784	38
56	terraform	0.10.3	https://releases.hashicorp.com/terraform/0.10.3/terraform_0.10.3_linux_amd64.zip	f316c6ff8b2abe257250d19cbe0e3cf745dedfa67b37bb4afaf95e0291efeade	t	t	f	tool-MdaJEby6kAJByXnh	2020-07-03 10:27:53.308779	2020-07-03 10:27:53.308779	53
55	terraform	0.10.4	https://releases.hashicorp.com/terraform/0.10.4/terraform_0.10.4_linux_amd64.zip	cff83f669d0e4ac315e792a57659d5aae8ea1fcfdca6931c7cc4679b4e6c60e3	t	t	f	tool-rZFqGE9vBk3igNYx	2020-07-03 10:27:53.251595	2020-07-03 10:27:53.251595	54
54	terraform	0.10.5	https://releases.hashicorp.com/terraform/0.10.5/terraform_0.10.5_linux_amd64.zip	acec7133ffa00da385ca97ab015b281c6e90e99a41076ede7025a4c78425e09f	t	t	f	tool-WbaQyzZ6moke3dF9	2020-07-03 10:27:53.173038	2020-07-03 10:27:53.173038	55
53	terraform	0.10.6	https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_linux_amd64.zip	fbb4c37d91ee34aff5464df509367ab71a90272b7fab0fbd1893b367341d6e23	t	t	f	tool-3pSLqGGQwSn62X7T	2020-07-03 10:27:53.116651	2020-07-03 10:27:53.116651	56
52	terraform	0.10.7	https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip	8fb5f587fcf67fd31d547ec53c31180e6ab9972e195905881d3dddb8038c5a37	t	t	f	tool-adm3USLdDeykEWoJ	2020-07-03 10:27:53.053076	2020-07-03 10:27:53.053076	57
47	terraform	0.11.1	https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip	4e3d5e4c6a267e31e9f95d4c1b00f5a7be5a319698f0370825b459cb786e2f35	t	t	f	tool-EP6ykVEGm6hXv67y	2020-07-03 10:27:52.735477	2020-07-03 10:27:52.735477	62
46	terraform	0.11.2	https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip	f728fa73ff2a4c4235a28de4019802531758c7c090b6ca4c024d48063ab8537b	t	t	f	tool-MyxZNQxQtGzWvdM8	2020-07-03 10:27:52.671642	2020-07-03 10:27:52.671642	63
91	terraform	0.7.6	https://releases.hashicorp.com/terraform/0.7.6/terraform_0.7.6_linux_amd64.zip	86ccdc048295dcc47f0a3611e39226b8961e08bdfa2969f495c89591c62fd2ed	t	t	f	tool-brdgPkfgYsaXjmhE	2020-07-03 10:27:56.423669	2020-07-03 10:27:56.423669	18
66	terraform	0.9.8	https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip	f951885f4e15deb4cf66f3b199964e3e74a0298bb46c9fe42e105df2ebcf3d16	t	t	f	tool-ZtLeyMUeNy2xZZsu	2020-07-03 10:27:53.996955	2020-07-03 10:27:53.996955	43
65	terraform	0.9.9	https://releases.hashicorp.com/terraform/0.9.9/terraform_0.9.9_linux_amd64.zip	5327b8fa93eb14ef57f4eff94f5380c2fbcefe0f9c135c8ab33425bec4054a6e	t	t	f	tool-A83z1WV8NsaYe1zk	2020-07-03 10:27:53.912769	2020-07-03 10:27:53.912769	44
64	terraform	0.9.10	https://releases.hashicorp.com/terraform/0.9.10/terraform_0.9.10_linux_amd64.zip	77f0d01182d665f7f3c63c326aa699b452fba043c2e2f9050c4bd114f98a1207	t	t	f	tool-AFixF6kziqBnFubs	2020-07-03 10:27:53.853092	2020-07-03 10:27:53.853092	45
63	terraform	0.9.11	https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_linux_amd64.zip	804d31cfa5fee5c2b1bff7816b64f0e26b1d766ac347c67091adccc2626e16f3	t	t	f	tool-6MCL99kqLAtXYfVN	2020-07-03 10:27:53.803736	2020-07-03 10:27:53.803736	46
45	terraform	0.11.3	https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip	6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b	t	t	f	tool-uJpj8h2DDVM2y45W	2020-07-03 10:27:52.627558	2020-07-03 10:27:52.627558	64
44	terraform	0.11.4	https://releases.hashicorp.com/terraform/0.11.4/terraform_0.11.4_linux_amd64.zip	817be651ca41b999c09250a9fcade541a941afab41c0c663bd25529a4d5cfd31	t	t	f	tool-VaNH7hFUW2zzkmrD	2020-07-03 10:27:52.573385	2020-07-03 10:27:52.573385	65
33	terraform	0.11.13	https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip	5925cd4d81e7d8f42a0054df2aafd66e2ab7408dbed2bd748f0022cfe592f8d2	t	t	f	tool-jvH1bJxG1kQ1KjKo	2020-07-03 10:27:51.90858	2020-07-03 10:27:51.90858	76
31	terraform	0.11.15-oci	https://releases.hashicorp.com/terraform/0.11.15-oci/terraform_0.11.15-oci_linux_amd64.zip	6f4edcb271ef332e7757193da6f84cb5fb48e1d8e6208cda69d556b4a903c30a	t	t	t	tool-PdRcNBD213ePc5Rx	2020-07-03 10:27:51.816927	2020-07-03 10:27:51.816927	78
30	terraform	0.12.0-alpha1	https://releases.hashicorp.com/terraform/0.12.0-alpha1/terraform_0.12.0-alpha1_linux_amd64.zip	75251f20455829358b38e28d5f3b726cd544f606e85c8161a34dea3bf924a9da	t	t	t	tool-5B9yGDifajdp3EBc	2020-07-03 10:27:51.773552	2020-07-03 10:27:51.773552	79
28	terraform	0.12.0-beta1	https://releases.hashicorp.com/terraform/0.12.0-beta1/terraform_0.12.0-beta1_linux_amd64.zip	3ca1a3126e17bbe8cf8aa677ff39f8b7a5cff71de91fa9286c3c7cacebba78e6	t	t	t	tool-69ehphTeZ7AtMg5a	2020-07-03 10:27:51.566968	2020-07-03 10:27:51.566968	81
22	terraform	0.12.3	https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip	75e4323b8514074f8c2118ea382fc677c8b1d1730eda323ada222e0fac57f7db	t	t	f	tool-oZtLjaRgUudCySSr	2020-07-03 10:27:51.317516	2020-07-03 10:27:51.317516	87
93	terraform	0.7.4	https://releases.hashicorp.com/terraform/0.7.4/terraform_0.7.4_linux_amd64.zip	8950ab77430d0ec04dc315f0d2d0433421221357b112d44aa33ed53cbf5838f6	t	t	f	tool-AZpuKzJDstxTM5u2	2020-07-03 10:27:56.641397	2020-07-03 10:27:56.641397	16
92	terraform	0.7.5	https://releases.hashicorp.com/terraform/0.7.5/terraform_0.7.5_linux_amd64.zip	7def82015b3a9a1bab13b4548e4c8d4ac960322a815cff7d9ebf76ef74a4cb34	t	t	f	tool-P9ueCUcbahJdt6Z4	2020-07-03 10:27:56.501198	2020-07-03 10:27:56.501198	17
21	terraform	0.12.4	https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip	0231562f26262de233e8e8fac668196af21b7aff355bb04f3ee1606cca239c0a	t	t	f	tool-UY3Watkw5d1KaxCs	2020-07-03 10:27:51.279439	2020-07-03 10:27:51.279439	88
15	terraform	0.12.10	https://releases.hashicorp.com/terraform/0.12.10/terraform_0.12.10_linux_amd64.zip	2215208822f1a183fb57e24289de417c9b3157affbe8a5e520b768edbcb420b4	t	t	f	tool-T4KsExQJeHmv4ut7	2020-07-03 10:27:50.960648	2020-07-03 10:27:50.960648	94
14	terraform	0.12.11	https://releases.hashicorp.com/terraform/0.12.11/terraform_0.12.11_linux_amd64.zip	d61f8758a25bc079bb0833b81f998fbc4cf03bb0f41b995e08204cf5978f700e	t	t	f	tool-5uQxE5qDezvwZbcQ	2020-07-03 10:27:50.924544	2020-07-03 10:27:50.924544	95
13	terraform	0.12.12	https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip	67bc7a49c0946ad48b14cc6e95482fdd3e7e9f7dc6811f4ce6ff531fc565bd3a	t	t	f	tool-7aLrRR9QUGVgQbjK	2020-07-03 10:27:50.894019	2020-07-03 10:27:50.894019	96
12	terraform	0.12.13	https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip	63f765a3f83987b67b046a9c31acff1ec9ee618990d0eab4db34eca6c0d861ec	t	t	f	tool-8HDC49xjDwAxPENX	2020-07-03 10:27:50.866872	2020-07-03 10:27:50.866872	97
11	terraform	0.12.14	https://releases.hashicorp.com/terraform/0.12.14/terraform_0.12.14_linux_amd64.zip	8db6b396eb2626f18bf5e98af824645bb96d8290e2ab761b2dace3a2574b8cee	t	t	f	tool-NjscJNMsuKih14PM	2020-07-03 10:27:50.840473	2020-07-03 10:27:50.840473	98
10	terraform	0.12.15	https://releases.hashicorp.com/terraform/0.12.15/terraform_0.12.15_linux_amd64.zip	2acb99936c32f04d0779c3aba3552d6d2a1fa32ed63cbca83a84e58714f22022	t	t	f	tool-NmRirBFpmQcmEjQp	2020-07-03 10:27:50.817968	2020-07-03 10:27:50.817968	99
9	terraform	0.12.16	https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip	fcc719314660adc66cbd688918d13baa1095301e2e507f9ac92c9e22acf4cc02	t	t	f	tool-HZWXXNhGhaHWWCUe	2020-07-03 10:27:50.7942	2020-07-03 10:27:50.7942	100
8	terraform	0.12.17	https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip	8124c7dfe5036377de0637378ad32cf530477403c29ab1ccefbaa50a05d059c2	t	t	f	tool-KV2Qh1aNUttLU3TQ	2020-07-03 10:27:50.772492	2020-07-03 10:27:50.772492	101
7	terraform	0.12.18	https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip	e7ebe3ca988768bffe0c239d107645bd53515354cff6cbe5651718195a151700	t	t	f	tool-npefh89otVdMRhmT	2020-07-03 10:27:50.749514	2020-07-03 10:27:50.749514	102
4	terraform	0.12.21	https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip	ca0d0796c79d14ee73a3d45649dab5e531f0768ee98da71b31e423e3278e9aa9	t	t	f	tool-hkLYhDCkb2fEpGQe	2020-07-03 10:27:50.697256	2020-07-03 10:27:50.697256	105
3	terraform	0.12.22	https://releases.hashicorp.com/terraform/0.12.22/terraform_0.12.22_linux_amd64.zip	98faa10a7da2055561339ce67436b37c0c760084e51f219102d87b155be088c5	t	t	f	tool-7kxFXUt76GzUnmug	2020-07-03 10:27:50.681953	2020-07-03 10:27:50.681953	106
96	terraform	0.7.1	https://releases.hashicorp.com/terraform/0.7.1/terraform_0.7.1_linux_amd64.zip	133766ed558af04255490f135fed17f497b9ba1e277ff985224e1287726ab2dc	t	t	f	tool-1k5nU9M7cdFCd9Ra	2020-07-03 10:27:57.036101	2020-07-03 10:27:57.036101	13
95	terraform	0.7.2	https://releases.hashicorp.com/terraform/0.7.2/terraform_0.7.2_linux_amd64.zip	b337c885526a8a653075551ac5363a09925ce9cf141f4e9a0d9f497842c85ad5	t	t	f	tool-nk6QsESaQSdAggdG	2020-07-03 10:27:56.908448	2020-07-03 10:27:56.908448	14
94	terraform	0.7.3	https://releases.hashicorp.com/terraform/0.7.3/terraform_0.7.3_linux_amd64.zip	4e985f222ec99616e8c730d737c9b400f9d73bf0c436661ec888b2406d3a6f39	t	t	f	tool-YbweWz4wrpqcZCA8	2020-07-03 10:27:56.777598	2020-07-03 10:27:56.777598	15
77	terraform	0.8.6	https://releases.hashicorp.com/terraform/0.8.6/terraform_0.8.6_linux_amd64.zip	2b4f330e70b757a640ba8d4e1eada86445240b5f8cd43194d878e0c05175f6c0	t	t	f	tool-mBGmGcRDmxeanm7K	2020-07-03 10:27:54.985734	2020-07-03 10:27:54.985734	32
76	terraform	0.8.7	https://releases.hashicorp.com/terraform/0.8.7/terraform_0.8.7_linux_amd64.zip	7ca424d8d0e06697cc7f492b162223aef525bfbcd69248134a0ce0b529285c8c	t	t	f	tool-KDjUjsjSZb8Fr6No	2020-07-03 10:27:54.89381	2020-07-03 10:27:54.89381	33
75	terraform	0.8.8	https://releases.hashicorp.com/terraform/0.8.8/terraform_0.8.8_linux_amd64.zip	403d65b8a728b8dffcdd829262b57949bce9748b91f2e82dfd6d61692236b376	t	t	f	tool-eKjPUiLLyGcouBLS	2020-07-03 10:27:54.808689	2020-07-03 10:27:54.808689	34
74	terraform	0.9.0	https://releases.hashicorp.com/terraform/0.9.0/terraform_0.9.0_linux_amd64.zip	0965cf0f9d373a550163aef4732438c201c7271ea5f96a902863248cb7f39f1c	t	t	t	tool-6sZGrmD7KciaNQLc	2020-07-03 10:27:54.70858	2020-07-03 10:27:54.70858	35
73	terraform	0.9.1	https://releases.hashicorp.com/terraform/0.9.1/terraform_0.9.1_linux_amd64.zip	b3b18a719258dcc02b7b972eedf417be0b497e4129063711bca82877dbe65553	t	t	f	tool-EoAZpqL2D9zSPwyZ	2020-07-03 10:27:54.626634	2020-07-03 10:27:54.626634	36
59	terraform	0.10.0	https://releases.hashicorp.com/terraform/0.10.0/terraform_0.10.0_linux_amd64.zip	f991039e3822f10d6e05eabf77c9f31f3831149b52ed030775b6ec5195380999	t	t	f	tool-pcygReuvK4JcU46y	2020-07-03 10:27:53.501337	2020-07-03 10:27:53.501337	50
58	terraform	0.10.1	https://releases.hashicorp.com/terraform/0.10.1/terraform_0.10.1_linux_amd64.zip	632e10925ae5de013d0d7e76e1c5ae8d5495182acf0b577e35d130de125d2c04	t	t	f	tool-MRDXEDCSeuZ9q7Aj	2020-07-03 10:27:53.446543	2020-07-03 10:27:53.446543	51
57	terraform	0.10.2	https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_amd64.zip	6c1b5ce1a78bc7bb895055052d9074e519f51293770871acfe2dbd289e2f2aaa	t	t	f	tool-37f2HDAuNhHQsycB	2020-07-03 10:27:53.370488	2020-07-03 10:27:53.370488	52
41	terraform	0.11.7	https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip	6b8ce67647a59b2a3f70199c304abca0ddec0e49fd060944c26f666298e23418	t	t	f	tool-qoWbAtSUT6TWNKaz	2020-07-03 10:27:52.389406	2020-07-03 10:27:52.389406	68
40	terraform	0.11.8	https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip	84ccfb8e13b5fce63051294f787885b76a1fedef6bdbecf51c5e586c9e20c9b7	t	t	f	tool-79tudNK3HhHjGY7T	2020-07-03 10:27:52.325103	2020-07-03 10:27:52.325103	69
100	terraform	0.6.14	https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip	6d93290f980df15a453e907ea9a2ca8f8fed41143c220953c911b5174c3e3ab0	t	t	f	tool-LV92pHS3H9Dkdb5p	2020-07-03 10:27:57.364723	2020-07-03 10:27:57.364723	9
99	terraform	0.6.15	https://releases.hashicorp.com/terraform/0.6.15/terraform_0.6.15_linux_amd64.zip	2a81faa54ed6c5e7c065444617fc999f0ab6d433e4e03a0ad599892e74ffff6b	t	t	f	tool-uRa7n2UpN7WtcJFM	2020-07-03 10:27:57.287135	2020-07-03 10:27:57.287135	10
98	terraform	0.6.16	https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip	e10987bca7ec15301bc2fd152795d51cfc9fdbe6c70c9708e6e2ed81eaa1f082	t	t	f	tool-wnqmbRHssRjccC7v	2020-07-03 10:27:57.208982	2020-07-03 10:27:57.208982	11
97	terraform	0.7.0	https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_linux_amd64.zip	a196c63b967967343f3ae9bb18ce324a18b27690e2d105e1f38c5a2d7c02038d	t	t	f	tool-finkZaEMV4kWpvg4	2020-07-03 10:27:57.115606	2020-07-03 10:27:57.115606	12
81	terraform	0.8.2	https://releases.hashicorp.com/terraform/0.8.2/terraform_0.8.2_linux_amd64.zip	a366fd2d7d8908d23acc23ab151fc692615a147f8832971bb43e42995554c652	t	t	f	tool-CbLCggq7gBi2S6di	2020-07-03 10:27:55.373354	2020-07-03 10:27:55.373354	28
80	terraform	0.8.3	https://releases.hashicorp.com/terraform/0.8.3/terraform_0.8.3_linux_amd64.zip	aa4c64b0595b8e49fc12da79d3efb7fb3f3653230349819699b9db1a76c51f3b	t	t	f	tool-7BMVqBQbNdYY5bZw	2020-07-03 10:27:55.284501	2020-07-03 10:27:55.284501	29
79	terraform	0.8.4	https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip	297d35d0b4311445cd87ef032d3dec917bcc7a8b163ead28a4c45d966a2f75cc	t	t	f	tool-Fp86N3ELUCQuztD3	2020-07-03 10:27:55.199004	2020-07-03 10:27:55.199004	30
78	terraform	0.8.5	https://releases.hashicorp.com/terraform/0.8.5/terraform_0.8.5_linux_amd64.zip	4b4324e354c26257f0b830eacb0e7cc7e2ced017d78855f74cb9377f1abf1dd7	t	t	f	tool-Ft4xqLBV6MhgzwVi	2020-07-03 10:27:55.111137	2020-07-03 10:27:55.111137	31
62	terraform	0.10.0-beta1	https://releases.hashicorp.com/terraform/0.10.0-beta1/terraform_0.10.0-beta1_linux_amd64.zip	9e14c850054faaaa3f40a1c28d8991fc4a42f0dc2d53564d8f60b12243c7ae5d	t	t	t	tool-qx6u7FQD3N9sZWnj	2020-07-03 10:27:53.717053	2020-07-03 10:27:53.717053	47
61	terraform	0.10.0-beta2	https://releases.hashicorp.com/terraform/0.10.0-beta2/terraform_0.10.0-beta2_linux_amd64.zip	31eb44cd3ffe12ec386668a2702c7040a69c63b3bd833f046758c1a91b3a79df	t	t	t	tool-XuEav4pLFCnA55Cw	2020-07-03 10:27:53.631168	2020-07-03 10:27:53.631168	48
60	terraform	0.10.0-rc1	https://releases.hashicorp.com/terraform/0.10.0-rc1/terraform_0.10.0-rc1_linux_amd64.zip	66820a4d12c25a6d0c83dd877d308aa0c8fce11ce63072f5753167e917464770	t	t	t	tool-jm11LMuLuyp2vTSh	2020-07-03 10:27:53.56708	2020-07-03 10:27:53.56708	49
43	terraform	0.11.5	https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_amd64.zip	131c440263382c79c7f783b70ff35cd1d03eb31c44f7738d153d95a0b8436ac9	t	t	f	tool-GCk3zuBAVnQnhmGV	2020-07-03 10:27:52.492045	2020-07-03 10:27:52.492045	66
101	terraform	0.6.13	https://releases.hashicorp.com/terraform/0.6.13/terraform_0.6.13_linux_amd64.zip	8eeddca53958d5c871de93a624eb0f5971f97cbaf107e0b2d1cc289f2ac21b79	t	t	f	tool-gpJSWHCxeBgHY1qh	2020-07-03 10:27:57.477993	2020-07-03 10:27:57.477993	8
84	terraform	0.7.13	https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip	5a4f762a194542d38406b9b92c722b57f7910344db084e24c9c43d7719f4aa18	t	t	f	tool-N1CShPGKfDwVbsmx	2020-07-03 10:27:55.697933	2020-07-03 10:27:55.697933	25
83	terraform	0.8.0	https://releases.hashicorp.com/terraform/0.8.0/terraform_0.8.0_linux_amd64.zip	9f99258396dad71746fb96036bf421e05fb3f36f402b89c3f16b453f3f0ee9cf	t	t	f	tool-GM1NYbyX8xSrrDtw	2020-07-03 10:27:55.604591	2020-07-03 10:27:55.604591	26
82	terraform	0.8.1	https://releases.hashicorp.com/terraform/0.8.1/terraform_0.8.1_linux_amd64.zip	da98894a79b7e97ddcb2a1fed7700d3f53c3660f294fb709e1d52c9baaee5c59	t	t	f	tool-a7dHUywSYgedQJt9	2020-07-03 10:27:55.472085	2020-07-03 10:27:55.472085	27
42	terraform	0.11.6	https://releases.hashicorp.com/terraform/0.11.6/terraform_0.11.6_linux_amd64.zip	aed5c7388a3c54dc816986903d4dea32e182a002d746295e1016f6db741f472d	t	t	f	tool-JiDGuijyrUWHaj7M	2020-07-03 10:27:52.442205	2020-07-03 10:27:52.442205	67
39	terraform	0.11.9-beta1	https://releases.hashicorp.com/terraform/0.11.9-beta1/terraform_0.11.9-beta1_linux_amd64.zip	6f235d05a3e0b3cd79264834448064b52079c4268ed0c2de25e10c79386f746e	t	t	t	tool-8VFVbHSVdxjUww1y	2020-07-03 10:27:52.257864	2020-07-03 10:27:52.257864	70
38	terraform	0.11.9	https://releases.hashicorp.com/terraform/0.11.9/terraform_0.11.9_linux_amd64.zip	5d674e7b83945c37f7f14d0e4f655787dad86ba15b26e185604aa0c3812394ab	t	t	f	tool-P1TNdXMMgGN29h6z	2020-07-03 10:27:52.200448	2020-07-03 10:27:52.200448	71
37	terraform	0.11.10	https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip	43543a0e56e31b0952ea3623521917e060f2718ab06fe2b2d506cfaa14d54527	t	t	f	tool-J4QkEjtEQWFQbgbY	2020-07-03 10:27:52.137806	2020-07-03 10:27:52.137806	72
36	terraform	0.11.11	https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip	94504f4a67bad612b5c8e3a4b7ce6ca2772b3c1559630dfd71e9c519e3d6149c	t	t	f	tool-f9vDD8MtwuauEUMt	2020-07-03 10:27:52.088435	2020-07-03 10:27:52.088435	73
35	terraform	0.11.12-beta1	https://releases.hashicorp.com/terraform/0.11.12-beta1/terraform_0.11.12-beta1_linux_amd64.zip	5a8c4f734ae58a3b2583d9b93c619fe7ab0e7b76c5a7d51ecc956166fb279258	t	t	t	tool-ZxdSNnx4FAoNtfxw	2020-07-03 10:27:52.031815	2020-07-03 10:27:52.031815	74
103	terraform	0.6.11	https://releases.hashicorp.com/terraform/0.6.11/terraform_0.6.11_linux_amd64.zip	f451411db521fc4d22c9fe0c80105cf028eb8df0639bac7c1e781880353d9a5f	t	t	f	tool-M77HTK3Yqthhonn4	2020-07-03 10:27:57.669926	2020-07-03 10:27:57.669926	6
102	terraform	0.6.12	https://releases.hashicorp.com/terraform/0.6.12/terraform_0.6.12_linux_amd64.zip	37513aba20f751705f8f98cd0518ebb6a4a9c2148453236b9a5c30074e2edd8d	t	t	f	tool-gvkfB2SM4a6dnnt1	2020-07-03 10:27:57.57699	2020-07-03 10:27:57.57699	7
34	terraform	0.11.12	https://releases.hashicorp.com/terraform/0.11.12/terraform_0.11.12_linux_amd64.zip	d3bb9c958c56a178528ef3b18e27a24cfd96c9aa6da3c7b6dc8d7dd8a4b9dab9	t	t	f	tool-ANN212o5GKkA7jHK	2020-07-03 10:27:51.983036	2020-07-03 10:27:51.983036	75
32	terraform	0.11.14	https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip	9b9a4492738c69077b079e595f5b2a9ef1bc4e8fb5596610f69a6f322a8af8dd	t	t	f	tool-ANSQpTzqtTWHoWXA	2020-07-03 10:27:51.862613	2020-07-03 10:27:51.862613	77
29	terraform	0.12.0-alpha2	https://releases.hashicorp.com/terraform/0.12.0-alpha2/terraform_0.12.0-alpha2_linux_amd64.zip	14d222094f10fc605131ed0629c34008943c10eb782d4c02db05032d7928c048	t	t	t	tool-ixxWDcZQcTtweVH3	2020-07-03 10:27:51.721156	2020-07-03 10:27:51.721156	80
27	terraform	0.12.0-beta2	https://releases.hashicorp.com/terraform/0.12.0-beta2/terraform_0.12.0-beta2_linux_amd64.zip	ad7515000955fe4a32757dc92e36f7b4d046bc51f3d683cf1e691bb7a6dc09a4	t	t	t	tool-mABd9R9AMWQ9Y33u	2020-07-03 10:27:51.509886	2020-07-03 10:27:51.509886	82
26	terraform	0.12.0-rc1	https://releases.hashicorp.com/terraform/0.12.0-rc1/terraform_0.12.0-rc1_linux_amd64.zip	b16b32c39de9597b381c0ba189c08a37ea1c56cbca23122a3675a0481158944e	t	t	t	tool-TnAiBf4pB7ZbM2za	2020-07-03 10:27:51.469855	2020-07-03 10:27:51.469855	83
25	terraform	0.12.0	https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip	42ffd2db97853d5249621d071f4babeed8f5fdba40e3685e6c1013b9b7b25830	t	t	f	tool-7cYbma1FQR882RWV	2020-07-03 10:27:51.432349	2020-07-03 10:27:51.432349	84
24	terraform	0.12.1	https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip	c9a30d3e3abf751b3b3e323897e9c7cb411d5c4bb7473a3284a2a2b4b89f93ed	t	t	f	tool-8HWEmNhLn8qZVY5i	2020-07-03 10:27:51.39807	2020-07-03 10:27:51.39807	85
23	terraform	0.12.2	https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip	d9a96b646420d7f0a80aa5d51bb7b2a125acead537ab13c635f76668de9b8e32	t	t	f	tool-P5QYE7V5cngcREid	2020-07-03 10:27:51.359929	2020-07-03 10:27:51.359929	86
20	terraform	0.12.5	https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip	babb4a30b399fb6fc87a6aa7435371721310c2e2102a95a763ef2c979ab06ce2	t	t	f	tool-LMNZNgovYr1RUf9M	2020-07-03 10:27:51.240148	2020-07-03 10:27:51.240148	89
19	terraform	0.12.6	https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip	6544eb55b3e916affeea0a46fe785329c36de1ba1bdb51ca5239d3567101876f	t	t	f	tool-SNk8YkbLrEfccRQs	2020-07-03 10:27:51.148986	2020-07-03 10:27:51.148986	90
18	terraform	0.12.7	https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip	a0fa11217325f76bf1b4f53b0f7a6efb1be1826826ef8024f2f45e60187925e7	t	t	f	tool-m4aF7ViPjWA7jcPJ	2020-07-03 10:27:51.104431	2020-07-03 10:27:51.104431	91
17	terraform	0.12.8	https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_linux_amd64.zip	43806e68f7af396449dd4577c6e5cb63c6dc4a253ae233e1dddc46cf423d808b	t	t	f	tool-sPRdrnESLCLVU7jj	2020-07-03 10:27:51.061962	2020-07-03 10:27:51.061962	92
109	terraform	0.6.5	https://releases.hashicorp.com/terraform/0.6.5/terraform_0.6.5_linux_amd64.zip	29618f11e9af410e4ed69d79084c33ad5faa3f475651556e039bb27ff69b3c74	t	t	f	tool-w7ws12x52rct1wfb	2020-07-03 10:27:58.380504	2020-07-03 10:27:58.380504	0
108	terraform	0.6.6	https://releases.hashicorp.com/terraform/0.6.6/terraform_0.6.6_linux_amd64.zip	497e9f9ace4c3da9afd8240222f6f29a7209b3a9ac5b143cefe117e41d5985f4	t	t	f	tool-thzeHDpWSVSy7mBm	2020-07-03 10:27:58.269447	2020-07-03 10:27:58.269447	1
107	terraform	0.6.7	https://releases.hashicorp.com/terraform/0.6.7/terraform_0.6.7_linux_amd64.zip	2e5de08f545e117eb9825b697c5ad290ee3fdcaae7d6de4b0e99830e58b38b2e	t	t	f	tool-ry3apb8Z1XMr22en	2020-07-03 10:27:58.153213	2020-07-03 10:27:58.153213	2
106	terraform	0.6.8	https://releases.hashicorp.com/terraform/0.6.8/terraform_0.6.8_linux_amd64.zip	fd61718820c3f2334276517a89694cebe82db354b584ea90c376f1c6d34bb92d	t	t	f	tool-s8ZoTrfCjn61dyQG	2020-07-03 10:27:58.003737	2020-07-03 10:27:58.003737	3
105	terraform	0.6.9	https://releases.hashicorp.com/terraform/0.6.9/terraform_0.6.9_linux_amd64.zip	c7d3e76de165be9f47eff8f54b41bb873f6f1881d2fb778a54bb8aaf69abfae6	t	t	f	tool-zW1rac14KSCXXAMk	2020-07-03 10:27:57.886351	2020-07-03 10:27:57.886351	4
104	terraform	0.6.10	https://releases.hashicorp.com/terraform/0.6.10/terraform_0.6.10_linux_amd64.zip	d7c07e2bf587257673bae710c776430a8cc5a755a9ad4a2cbae066d0cd02a862	t	t	f	tool-XnVb2dTBeGBaW6jJ	2020-07-03 10:27:57.777735	2020-07-03 10:27:57.777735	5
67	terraform	0.9.7	https://releases.hashicorp.com/terraform/0.9.7/terraform_0.9.7_linux_amd64.zip	df6aecbddca9ea4e0f32290ed5efb92c1b4173d8afd1d95470424f635c41d242	t	t	f	tool-JK5bZ6r4ZkxAPite	2020-07-03 10:27:54.123469	2020-07-03 10:27:54.123469	42
51	terraform	0.10.8	https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip	b786c0cf936e24145fad632efd0fe48c831558cc9e43c071fffd93f35e3150db	t	t	f	tool-cbLMH4P7KdbNGj9k	2020-07-03 10:27:52.989413	2020-07-03 10:27:52.989413	58
50	terraform	0.11.0-beta1	https://releases.hashicorp.com/terraform/0.11.0-beta1/terraform_0.11.0-beta1_linux_amd64.zip	f6bcdc1e159ee0aea2892cda996cd8ae1b3350a57e963a1d7e70d10be73c4120	t	t	t	tool-QwHLknagFTEG7he1	2020-07-03 10:27:52.922177	2020-07-03 10:27:52.922177	59
49	terraform	0.11.0-rc1	https://releases.hashicorp.com/terraform/0.11.0-rc1/terraform_0.11.0-rc1_linux_amd64.zip	e28701040fbc210c94ff0d1fb786dd7a1bbeb54021ad305eb396f139ac5d07c6	t	t	t	tool-Yr8JpmvxS4J55jCY	2020-07-03 10:27:52.856813	2020-07-03 10:27:52.856813	60
48	terraform	0.11.0	https://releases.hashicorp.com/terraform/0.11.0/terraform_0.11.0_linux_amd64.zip	402b4333792967986383670134bb52a8948115f83ab6bda35f57fa2c3c9e9279	t	t	f	tool-9J21HvAbVx7RX4L8	2020-07-03 10:27:52.806877	2020-07-03 10:27:52.806877	61
16	terraform	0.12.9	https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip	69712c6216cc09b7eca514b9fb137d4b1fead76559c66f338b4185e1c347ace5	t	t	f	tool-guL1mPNUa7tpzAT9	2020-07-03 10:27:51.013426	2020-07-03 10:27:51.013426	93
6	terraform	0.12.19	https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip	a549486112f5350075fb540cfd873deb970a9baf8a028a86ee7b4472fc91e167	t	t	f	tool-bCu5kxreZBJnkSdx	2020-07-03 10:27:50.731066	2020-07-03 10:27:50.731066	103
5	terraform	0.12.20	https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip	46bd906f8cb9bbb871905ecb23ae7344af8017d214d735fbb6d6c8e0feb20ff3	t	t	f	tool-ADWRK2op8JZmDnqc	2020-07-03 10:27:50.716468	2020-07-03 10:27:50.716468	104
2	terraform	0.12.23	https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip	78fd53c0fffd657ee0ab5decac604b0dea2e6c0d4199a9f27db53f081d831a45	t	t	f	tool-DiYyfECiU3x4U5Wr	2020-07-03 10:27:50.66846	2020-07-03 10:27:50.66846	107
1	terraform	0.12.24	https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip	602d2529aafdaa0f605c06adb7c72cfb585d8aa19b3f4d8d189b42589e27bf11	t	t	f	tool-Me9Db7rep4x8FPgV	2020-07-03 10:27:50.645885	2020-07-03 10:27:50.645885	108
\.


--
-- Name: tool_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.tool_versions_id_seq', 109, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.users (id, email, username, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, is_admin, created_at, updated_at, suspended_at, two_factor_delivery, two_factor_sms_number, two_factor_secret_key, two_factor_recovery_index, two_factor_recovery_secret_key, two_factor_verified_at, two_factor_enabled_at, is_service_account, used_recovery_codes_encrypted, last_auth_through_saml, external_id, accepted_terms_at, accepted_privacy_policy_at, invitation_token, invitation_created_at, failed_attempts, unlock_token, locked_at, is_cyborg, onboarding_status) FROM stdin;
1	guseletov@gmail.com	admin	$2a$10$iXy4b9Y78DkRlOiLvfXcMu27yzBpxvVYc/.I6uw4j/Dhy0lB8W3Wy	\N	\N	\N	\N	2020-07-03 10:29:01.119244	\N	\N	1	2020-07-03 10:29:01.117525	2020-07-03 10:29:01.117525	172.17.0.1	172.17.0.1	t	2020-07-03 10:29:01.086628	2020-07-03 10:29:01.119612	\N	\N	\N	\N	0	\N	\N	\N	f	\N	\N	user-zG5TnFBY2ysWcdwY	\N	\N	\N	\N	0	\N	\N	f	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.users_id_seq', 1, true);


--
-- Data for Name: vars; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.vars (id, key, value_encrypted, sensitive, hcl, category, configurable_id, configurable_type, variable_set_id, owner_id, created_at, updated_at, external_id, description) FROM stdin;
\.


--
-- Name: vars_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.vars_id_seq', 1, false);


--
-- Data for Name: vcs_hosts; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.vcs_hosts (id, api_url, api_version, service_provider, http_url, oauth_client_id, webhook_secret_encrypted, created_at, updated_at, github_app_id) FROM stdin;
\.


--
-- Name: vcs_hosts_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.vcs_hosts_id_seq', 1, false);


--
-- Data for Name: vcs_repos; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.vcs_repos (id, external_id, identifier, webhook_secret_encrypted, webhook_identifier, oauth_token_id, organization_id, ssh_key_id, vcs_host_id, created_at, updated_at, created_by_id, display_identifier, github_app_installation_id) FROM stdin;
\.


--
-- Name: vcs_repos_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.vcs_repos_id_seq', 1, false);


--
-- Data for Name: webhook_payloads; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.webhook_payloads (id, vcs_repo_id, body, event, created_at, updated_at) FROM stdin;
\.


--
-- Name: webhook_payloads_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.webhook_payloads_id_seq', 1, false);


--
-- Data for Name: workspace_comments; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.workspace_comments (id, commentable_id, commentable_type, user_id, run_event_id, body, created_at, updated_at, external_id) FROM stdin;
\.


--
-- Name: workspace_comments_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.workspace_comments_id_seq', 1, false);


--
-- Data for Name: workspace_configuration_versions; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.workspace_configuration_versions (id, workspace_id, configuration_version_id, external_id, plan_only, created_at, updated_at, trigger_decision) FROM stdin;
\.


--
-- Name: workspace_configuration_versions_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.workspace_configuration_versions_id_seq', 1, false);


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: rails; Owner: hashicorp
--

COPY rails.workspaces (id, name, external_id, organization_id, created_at, updated_at, archived_at, auto_apply, periodic_run, queue_run_on_artifact_upload, terraform_version, variable_set_id, trace_resource_id, locked_by_id, locked_by_type, locked_reason, environment, current_state_version_id, working_directory, ssh_key_id, current_run_id, queue_all_runs, file_triggers_enabled, trigger_prefixes, speculative_enabled, operations, source, source_name, source_url, description, allow_destroy_plan, auto_destroy_at) FROM stdin;
1	workitiggi	ws-p6cck81qngBLLFBd	1	2020-07-03 10:29:35.126893	2020-07-03 10:29:35.126893	\N	f	0	f	0.12.24	\N	db596ff0-22e0-4bb1-99eb-cf09e2dcd684	\N	\N		default	\N		\N	\N	f	f	{}	t	t	tfe-ui	\N	\N	\N	t	\N
\.


--
-- Name: workspaces_id_seq; Type: SEQUENCE SET; Schema: rails; Owner: hashicorp
--

SELECT pg_catalog.setval('rails.workspaces_id_seq', 1, true);


--
-- Data for Name: gpg_keys; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.gpg_keys (id, namespace, ascii_armor, source, source_url, created_at, updated_at, trust_signature, key_id) FROM stdin;
\.


--
-- Name: gpg_keys_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.gpg_keys_id_seq', 1, false);


--
-- Data for Name: last_modified_times; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.last_modified_times (id, entity, last_modified) FROM stdin;
\.


--
-- Name: last_modified_times_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.last_modified_times_id_seq', 1, false);


--
-- Data for Name: logprocessor_files_complete; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.logprocessor_files_complete (id, bucket, file_name) FROM stdin;
\.


--
-- Name: logprocessor_files_complete_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.logprocessor_files_complete_id_seq', 1, false);


--
-- Data for Name: module_deps; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_deps (id, module_submodule_id, name, source, version) FROM stdin;
\.


--
-- Name: module_deps_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_deps_id_seq', 1, false);


--
-- Data for Name: module_outputs; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_outputs (id, module_submodule_id, name, description) FROM stdin;
\.


--
-- Name: module_outputs_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_outputs_id_seq', 1, false);


--
-- Data for Name: module_provider_deps; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_provider_deps (id, module_submodule_id, provider, version_constraints, provider_id, source) FROM stdin;
\.


--
-- Name: module_provider_deps_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_provider_deps_id_seq', 1, false);


--
-- Data for Name: module_providers; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_providers (id, module_id, provider, source, downloads, ingress, ingress_meta) FROM stdin;
\.


--
-- Name: module_providers_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_providers_id_seq', 1, false);


--
-- Data for Name: module_resources; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_resources (id, module_submodule_id, name, type) FROM stdin;
\.


--
-- Name: module_resources_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_resources_id_seq', 1, false);


--
-- Data for Name: module_submodules; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_submodules (id, module_version_id, path, readme, created_at, updated_at, empty) FROM stdin;
\.


--
-- Name: module_submodules_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_submodules_id_seq', 1, false);


--
-- Data for Name: module_variables; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_variables (id, module_submodule_id, name, description, default_value, type) FROM stdin;
\.


--
-- Name: module_variables_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_variables_id_seq', 1, false);


--
-- Data for Name: module_versions; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.module_versions (id, module_provider_id, version, source, description, downloads, ingress_meta, published_at, created_at, updated_at, tag) FROM stdin;
\.


--
-- Name: module_versions_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.module_versions_id_seq', 1, false);


--
-- Data for Name: modules; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.modules (id, namespace, name, user_id, verified, unlisted) FROM stdin;
\.


--
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.modules_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.notifications (id, created_at, resource_type, resource_id, level, title, description, read_at, version, code) FROM stdin;
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.notifications_id_seq', 1, false);


--
-- Data for Name: provider_docs; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.provider_docs (id, provider_version_id, path, title, category, content, truncated, subcategory, slug) FROM stdin;
\.


--
-- Name: provider_docs_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.provider_docs_id_seq', 1, false);


--
-- Data for Name: provider_platforms; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.provider_platforms (id, provider_version_id, os, arch, downloads, ingress_meta, shasum) FROM stdin;
\.


--
-- Name: provider_platforms_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.provider_platforms_id_seq', 1, false);


--
-- Data for Name: provider_versions; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.provider_versions (id, provider_id, version, source, description, downloads, ingress_meta, published_at, created_at, updated_at, protocols, tag, key_id) FROM stdin;
\.


--
-- Name: provider_versions_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.provider_versions_id_seq', 1, false);


--
-- Data for Name: providers; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.providers (id, namespace, name, user_id, source, downloads, ingress, ingress_meta, alias, tier) FROM stdin;
\.


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.providers_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.schema_migrations (version, dirty) FROM stdin;
39	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: registry; Owner: hashicorp
--

COPY registry.users (id, username, ingress_meta, created_at, updated_at, admin) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: registry; Owner: hashicorp
--

SELECT pg_catalog.setval('registry.users_id_seq', 1, false);


--
-- Data for Name: ptfe_config; Type: TABLE DATA; Schema: vault; Owner: hashicorp
--

COPY vault.ptfe_config (secret_id, unseal_key, root_token, updated_at) FROM stdin;
fZekIBF61U2qqISzyPQe1nkEBpBLVUfVVWdE8yrzB64	tuPBvpM/gUzDUnFmhWH/b+wdZd1RAGJqHvgKfgcuW0MyMuCMjyW/5V1XboDRDkDmuCKl0be8uVDay/cFYn6EaVVIJh0H+89X	sDYSnscV2Tdhuz3EHG7FPm4opYIoj7sCZ4RKUtkL0sCn6aGWm7WkQaCeZDxQmQJopM8AdSzR	2020-07-03 10:26:59.36846
\.


--
-- Data for Name: vault_ha_locks; Type: TABLE DATA; Schema: vault; Owner: hashicorp
--

COPY vault.vault_ha_locks (ha_key, ha_identity, ha_value, valid_until) FROM stdin;
\.


--
-- Data for Name: vault_kv_store; Type: TABLE DATA; Schema: vault; Owner: hashicorp
--

COPY vault.vault_kv_store (parent_path, path, key, value) FROM stdin;
/	/core/	keyring	\\x0000000102f010502f8d551c9c8343e9286d116333759e8995f4c074f47f109bfed6c6f68debe9b33272fdc12b909a7d478492baf732e9c9244e88f82e361a642015c91e5ec8947a5f9c4270ff121c4e77bbfe5e62effbbc30bdecbadd134db129e41e57337c4eb271617c0922d0cfa6237c665fef0aafdc92910a03a7534bb92816b23eb9b9a6552d5c661345df9b9cc171185dca332b6e68e72367ce97b4b4e44ea8b3c3370f4f51b5f38ffbfa5c7dfd82b25d89be9109d597ed2f21fa37ad1ff90ae0146625dd6c0dd775d60a2448e2fa22228956328851e6a3ddb6e388b893e7c6
/	/core/	master	\\x00000001022ed7fad83400ab6db433e21e9d27b6bae6c7eb94cf9999180daa39a1dea6fa0e428e6b6926a643030f293ea2be1a4276b1c0d994dd48f026d8f74bd47e54294826e7bdcf90ffbb2c47537ca105603cd151bd9845ef6997ed06646cb252db284cc878bbb246b4d19d66b638e8dc04d6151dceb020afc118400ef330bf569d0bbbe5b7be88958afc7701242d49e26e
/	/core/	seal-config	\\x7b2274797065223a227368616d6972222c227365637265745f736861726573223a312c227365637265745f7468726573686f6c64223a312c227067705f6b657973223a6e756c6c2c226e6f6e6365223a22222c226261636b7570223a66616c73652c2273746f7265645f736861726573223a307d
/core/cluster/	/core/cluster/local/	info	\\x0000000102871c7d2b4203d22eb60a79fe6655b9679dbdd07dd443ce8c8ea3e83a553e654f7da170987de3efbc3111c466bcd5c0bdffb101b2cabb2e9a6ce2146f5e636f7a8793ffba557479427c2ecbc83273dc7779ba9c467c51668555453413bfa461a25e063c4adbf95d3878
/core/	/core/wrapping/	jwtkey	\\x0000000102ba18a6af6894c132e1e043cc98bae70891d5c3c1dce7e2e3aa8acba84ef8cecf50c14e5d829847a7212f1add2944c47e7831cfaabeb184d9da508a5234f95aa8f6680369fb8500d2743a1341ab2305c27ca3f4fdafdc776bb236f8bf4914a33088f70df9765e5f2731e65b490d2723e6432e8c362b1696b8d1616fa66b371296985274a67bf5cc7a50a659d65817d317ef4ea5cb6da187328192cdf8cf19dab9e07ff1e0f06c50eb62396c6afcbf6b58fa71987083d744360a5213c6a64373b6f0d28c8b45ce85aaba5c93b95ad911659c309a54ce9db10ceed49d2ce9e2ed5ee21f868a42ee03e6be4549b6545d859bb3d4d482dab4342d8f3a4cc42be3f88d22fdb14389a387b8149891a27ed0d05848a325ef9102d2a20ae5f661c60c1d7099af45fb8bfff273a61eda6522356aa14ea16cfd1e68ec75e446d3b3feffa74844c3de25b20120cbf0ecc18ae29e72cacbd2f5bc7f9c0f19096c2ffbe1f43e265b7fb18748cb28f8572aaf1ac47612fcb6ecfc7056be3c6239965c6bf8244b3069847087d61a70c3badb94dd53479e6c155c46fe30d66df5b9d6cda2d7ebc87838239feea9c5a1aef1817bf3b266ae31a3fa8fcbb92608917932ca5db2b4996a83079aebbe461c881e32393e49f8c601de870c494a47ff9ff001699d15b5350b29b3971e30ba1b6856a50b9d6fb337e7d8327d06ffe3be7552c79aa8cfd43244a5564c9ef911b4b52d9e981e4289f80773c8
/	/core/	local-mounts	\\x0000000102279c7184303e2654c1ad39968581c6b480a843be6f471a045ff45afc3b65af0a1fde69ca26137a78842ca9f706b8b51b88ac084cec7992dc1587cae3cb89bda2a93a8015b11b5131c3aaa70d6cc70cfeb832876deac63356d76ea9902625b4e0e32f9a1c850d231c88bfa33717a2ce1bad7173c60d195d1df55743c7d2c14bc829caa7bd08cd4bcd337f323ff3ae93a2f59872dc39aed3489b5ff693fd82136e564fbecd3be7069a00a6d6f1b3f4c5aa962555379226976b270666a348ad91013626c1609959148a8b0e39abb70ac12dcd45a63283cf052bc52edb40f137dffeb6d2e07f4347432a8bfe3d1508b2f35d2b202eaff548965cd85eb04c1dfcb73e7317cd058d463cba7bb07d126c4a7e61346e709e1f66ed5ca884a7993455c4fe4940f17ed857b203880ba726e8726ac137a649bdd0595b7daaf39800182a72f31c2b9c33a46c9c490a71
/sys/	/sys/policy/	default	\\x00000001023d5be6d839d6230c9f8f591312ccec2bcd625abf03beea250c7a9885fcf0949fcaea3ef65bd734034c2e880949b63413747479df3f61574d89337828fde4e9d3a74399dda282c4547edcbba9d44513a436c3778549d98472aa37be8db52b4cb3426bfe6ddca2c6193f4cbe665460fdc5432443ca51b1acb65a77ec6ea3c738c895b0ddc0f5ecbe450c3a1f39e95a754cfa69beb81ed9123fd9e99e5da65b1454276c3eebdc13a3f1c75bf2ada2ca09383972796d0dd809cc7e14b1832e30140f2a7c99d4ef9e32a279c727b4384cc1dead46df00f9e9e03a4aafcc975930c52360725168096142af0bc91a8795d31f55ae8d8ff24618b4c6064e8b27e49b82ad868d3b3e321e3f31f1935109fbfcce15c3d06f2a82f207777c58db5613f753ec088739777b6349546691daed096d09166ef2456f4dbaec82993ea869e2e8955724b3e1209d0ce65c76fe06fb54a4a81a1ae0cd0873ddab72bd1cf751403bb83aadab20504e2500dac626e09aff82733d1e1c580dd5be858aeeb84c65903db5f6a8a6f58772b6aff74c7dd23425f6050f6a5b9ccc60b2a49725285a17b119aa08a362cbea8bdcead5d5ce6087c80f75ae3f5e65292b29e564d410c1ce7de1e37c3599dd30e4526a43c01be9cf5b4d9eee21507f387f1c1bc3668fcc429cda31bcee702113c503a08c94a4e0f272cf0a891fd54fec3566540fab9a73ac2eb739853c5f88d90a999e9405e324f2d83b05d6f759be53d4ac78e8916e38f97dea08404bd79763ef3463c7059ccd59f91da66a81b717ce5608e223dd89b78ba28c551486e073acf004b387a47f57cd56d5b7b7327d8bd3f7bf3ac0c06ed1452da5da1bc956d205eaf412db768552f74c97cd50940e6c6c90ff94257f5f55b65acdde8603e9c0d421ab9db7b7b324d312208f2eb5e7fe94b9155cae6156c7f8ebe1752e09d885c30192ce614e8dd69a0620a451930fc5bdebad41f660da8f0368b6dccf8f92dd9793c978cff4fabaef2af936fcb88b20e1da1f9377c9e4e68f903a5d2bf6684a4c6f34cd1c5361bbf8aff00f33c9ff1452f72137c6a3f7e5567cea871a30723b58e85d9358d0906dd7d5b76ba2fa780c524d7e7d5ec0d0129faa4986865df7edfdcae2aeb4d71c64d0dcf4e4914dda19c97c520172107970d569deeb823b671da78e9b638413d522a2bcc13a77c2104547b24d0cfb2e735a262cb756fb53f1c1ba765e21f27954b0f666b7946e3063e3f642ecda6ca4789b2007a0033a43a88b68086dca0d2f2efbe0e563049a0fe821bbe83dde9a4ec6b576163150bfea643a6cd576cf1f8496336a6e3bc04d1378521ee3d4fd168ab4594ae8f41ac98bc74ed379ba339746dc41fe4826cb38d01d6d5fb3d7c9aa4ac9bded1c414df6e30b0171ff727679ca700deaf7ae9ccfc78a7577d760fd2d41f64ba77aaa2979f7679afdec105cf12201c2e433eee7fde5b82e7ff1bfb238c1159a95b057a4829ce0c6f52cb6a25dd87e99142410a0df2c59c7b1c8783e646577b5d7ea7ab01e1af0bb29012780bc80e6aad37eb3fcb2d3ec0211531fa47c7783e71f4a6611a14c9c0d5bd84f32300d1b69a2de7ab9a62d607140d5fc504ada945ac813b34f9587c4dd463eba672af25303e137101177bd1384c31a9147e8839cffbc7d0893ac8d9605e2941f8be464602ce735a532773ce8f606c6798c499778681729e344c5a5313df4b5eaa5267c3c0e6c13bc8e7fd87bbe36781e5eb58f142cc570dc90d769c84384bf3b7c9696cb0337e38f1567109bb48c15a9ba368125aa477a68a83dcc55383df071169134f92a83c79839d17d2e0b5b35a23ad4eec8d51864a79a29fe0f6450541de6a89165e4ead300c5de473574b6a7bdcd12472ce7af26da487a2462e2d9a202dcde3f4a6824ccdcbc6ff44d62ec7f5634fa0849ffe6f2d49f2ddf1eddcb56b963003375e88c5fced09f41bef892b217d9021c5d65bbe685362942234f63d02f4a11a3be0f0babb454023dc23d32ad5acd932f7300a7d97f3d28b3394e86ca2d9496713a5aa4773171e836cf697e4c0db1c88e1ab028616a67bb866adba1e9cf55559387f39d2c0b6c1dea3d57fb5aa54391e24d83953d4965b7866f7ea435f6531be402402b349e17de3ae5d66ca7a4afa929d14c60b0d84a58f650541a7b657a7e139b5b3de3e0aa5f9db2e435f112c6397b9771da8a10feead51c7b9f4675250dd52fed4dd41ef9488c7b791e76fe1e2d37013c638131a5db114fcea4fe2ca2890bd768717c8350e0b96d305b249ddf99343ca9bf050bfb39292f5d5de83e176ccc0e884aa06fb856c3a63325decad9c446cc7d89fe2c05c9abb33e2b75f0be197837bce4a5384556ea753c15fe2e131f19e45eb97c2962ba5d5d29a19c88cf5e23b6e6909113c6f9cbe685106d44ebdf8cd20d55301e0ec468c8514b4c134c72671c2a5a061df359a33dc861eb1387b97c97399b7bd816c1f025adc0ff5f5c65cd6d2b0b0340a3c64df4fb20607cb2d1f5e7babbe4d4bc1f927bd6fd055725168fff5c82a77742887f490be4e1ea573f43266f73caf8b6c2bf09f5930a33828cc6032136c4febde818679c6480a7636b1bacd71a7dd261fd48cf13b6cc0debe72d48013d42a9856df9a0c4f43fe335c701d275a08a1bb234e184a8f4d2e78e8a2d8b0ada78be7262e1e9004a1558712074e00849fa8dbe0f06becba93dd2fe4547ac1a3782ea5afe04762360d152027acc12b423b9c2803de835a468453649b7b6ac50ef2e83b1a320463402827b3854f6d1c766601ff837880f081477ecadf351c5fe9e7a44f1cb17b28b3047c962772f396d786009cc51ea27804c80298e0a7c17e17667296b6599310b0d799c9e906fa23ea654b610b07523a552c59901621291659f3260d3ff9d376af276fcade12e858b8b110abc13103c197d7b388182f364e9c001124fcf3f803134e6c36de7d670caac354050a745811bff9a34e793c1a6d2e6f6e52d13dbfa40cb78d1093c53d372ac8c4a5b43df2c91ed0c39cdd74e706a9178376c5d78248e8b16fadca72e58c1ff32fe48da275226dc2a1c8dea5a9f771a670e80ece471fd683b2063fc94879ba8b99fc3cbc08828b56abf01607a8f62c23b984748b6b2c297e36209971efbaed6b3a70a582f25ad716c440d547d272859a8430200a730fcb401a306cac515ad0fd1c5ee2330dc2c26375fc28e6c74a4a83df04bd145c9598688d0a96d372d1c7b8ea9aeaa72eb200f7c264d3f858ee4af7b15e7e005ccfb96677ecf8d9f5dc3aabd28ba753edcee12cac576a971421d55003086fc95e309ffe24dd730c5c1f6174b25e9c98be7642f7e48ccb521434c5cfdbceb5dbf107d16110f565b690dab8e4da0a98d241fa5dda4ce0900273b3a311192001847a0c55fe2f1de51932a182eeecba12a342cccd9ebacca21500bd38db19bf579e10dfbd15c34f6927528d3431a4b1ff07bd4d733aa3a615a3f65dae007b857e7f69e3b019d2f8f0a1a068e100ab90124e883301f177d6ce9712553a2cacb29d049c75b4515b47d8538a9f2b6098b300b87bf12a824b20b807f5f6c74a1f70e740af33b43
/sys/	/sys/policy/	response-wrapping	\\x0000000102c19be9647b459de6245c2ece7d89d21b5245d9d98131fd8eebb3fe9ce2f9ef4cb38bc9c99227eb72612a7a5f4f0ad30618a3f1b233a201a7186bba0be86c8241b4065ecba94564536517f638ab830652823dfea8d785f0b6251989ddf87180f6cfea22ecacdb50c0f1386c5d09f23f16da119d5d0e8e1e628ed5595594ddafcdf08e6dcf00cd087b357e16427532806e0d6a1e5f4fbcb0cbd69e424d2bacea5c8c302eeb164906da007dde2b0e1203acc411f5de5b9e50a91bb2775471a7fd0cac7efea22fd3a783edcb06dd2eb7950f31af320c47a957cbbc8cae17ed7f15a7c69584
/sys/	/sys/policy/	control-group	\\x0000000102d47e23066a795e8253cc16e43fe197216573eb0c664ea990d0baeee2ac455ce52b5cb62ebf2b20d63c34cb9b36932bbbff67ed731bb855e8f99dcb0bc986b147458da0368cbf40b809943b824848ceba6ca7a5f7099ef62bfc06002260b82b216f9dca90719e9f3224c7d246351e672b7be5a26f6413f2979ef2191302255ff94a7e2458ba84bb67463029571eec6e1aa737e11b44eedb0e36c5246b24d30acda3be3901daf4402c4b635d100f11a8c2593c2669f2c93741baed9850f5dd14190c421dc05e737449e7e96393adae07140976a0912dae54e54c3567028309a59f046497df771c36015ef6c93350f987771b9cc504
/	/core/	local-auth	\\x000000010233893ac28f9e34d13c9918f30f33e8ff6f68ec291fdc86fe3e5b73b8a006aa469b0352232c5874785634c6e8c4845fad2287a40a3852138c4376b7f70c19394afeb220ad1acb88665d544a8ee5b8132bf5db319d
/	/core/	audit	\\x00000001027f67263d5c8af54f657711383b8904283d9abf1b2b219aa8ccaf63a77f0f13049a4cc97ed6a63abfe329a5a35f52365239784d7460e38bb853da42e8260ceba9c7c83b89b70885fdf1508a12cf4126310226d88807
/	/core/	local-audit	\\x00000001023f2169cffe71080a686a43452ff439947a0b7ecd97707eb12bb270a6792880f4a28c95318452be6b9ef11f1f204b1bf267fb9c6b3c13945c64bc3c586f37dc04688571cccfca6319bcda665f15281274b614afff55
/sys/	/sys/token/	salt	\\x00000001024679cb33f3f4a6d2a89b2c3afe19f604c897d43d17d63ea175c5b2d97f6ed9ba35e660c4e516ac317dc75d189a30cce4498a0cf26b8fa39e24ec5c81c57b0ef7
/sys/token/	/sys/token/accessor/	84eabd1e7725bd94029927e306497454b800c0ef	\\x00000001026a0094443bc6648e67c0bc3258e2c323fbadceb4c7345a8dc2eb7127491c953fbb11c76059fd3ef7c76583e150c03cbbfb00650fee0b7140567a8c06bb9be43e1c3c879493ec3996787783c9c108515cf51ef808b97959efc8667837c47e17eeaac26e6d0da059e0948c5a351dd49015eb8fcfbe1e1a8dc2b513538a6ad015deb91b1e7830
/sys/token/	/sys/token/id/	hb475209a7dcca7c43a6cb9ed64d8917bf7870ed413bb649e588ab385faaafc9c	\\x0000000102801e5e9e02d63650487afcbece0282c38c3a183be845fb7071a5e89c1ce3ec529478b0df6a6c457cc1f431ea1a543d373f5d46e821a7744a13c2cb5a29a96b75d0af2349fa61827fbd1e19fad35c3bde536c1b3d226b066ee5377c9e34a20e35a83e40403a97e987ac5f12a52af462689c77ab40945d219f3e667e10fc994aa2d6a448894c194b4e1b64cbe1b66b985ead1f1ea2487f0af7dd4d75c91e78968a4ec13e3d778c7ab8ce27e92a25f03656e693f96d7930e59a89ea2a6717f9083354b0ffb146ee67ba7f331464e95961517841121285c96ca7050495766a13baa147ec51f141c3d5838dbb94e23976f02118639355ed13abb9e9432598c3df3964d0cfef4f58fb7272c228b28d72cc7fd86e40ded47eb2b28f2a3db42ff413124a8bee64a83723aff44411157911925caa995b3f023db825a194f7e2c37296b0cca788755b11a085bf81b9497ddb665b9f810ba9a455d21705f576b4077be28c462ac57bcd91214909e64867917cf879ccae5e7a96c6768d4be96dfbfc9da059887a03b1779be41762ef712d03e44bfc37dfd419f1a59f5fc71a5737fbda229803c1e6a0ceab80ee9e0d8f8ebe5cabb63e358edcc730f7f2f83f8b79ce7e7c149951a37f2f4cc3
/	/core/	mounts	\\x00000001022ac46d12b6ac072db5644d442966a7e2ba77697922a5b6c1a123257e5226bfd65f6ac9e30ac0bd5d258ecdf6be17960becf2f028bf8a4c4bf8946c12bae46544722435012f1e5f4621a109a658b9237ddc78c8c40403ed155bf69d44d377ba5f7e02c598031a3312c05e9b6a8fcb25827c6e737931472c2b045f7b2aa5c3a7de83b4d82ac2c293bca9fe753e82086fd9ed4e3dd14793b227bf26765275a44d7a22cee56fbadd42ddf60b43431b1c5b42f611a5f86dfd57abde1c312b14fd087e919a29d54edae25e2aef6fc29546387c3216b6c487e1b14ea1e0fa0b7ce296dca772208d3cbb0fc98a699ee38a3cbfba2e43138410e4d693f046333e6f24a7c489fd5fa5db9b8623cae71aafe2a885f6750801b43f9127aecfadf966d59c3fa6d5d9e4d50654b59b0c65f4317fe275d81095ab61de98938b9797f463a0ef4782a47e2937ba0f9125bf7e63ae271c1fb55290d8aea6c4c2c623ae666a60b16e45261f5bbcc33e890a17697ede41d53e5f5c4ee7dfc4e9ddd157a0b82bd0092b01848251db0ed83b946a6a7fb0f2e79432e66220b165670e9d94a48cf80069e6fc0a1c2bfdeeb9cf1d8a4a2d606908b95142d2b2ab52612efeaf6cb4a4608c152405552a40afb81cc93453b9c3ca4a0ccb445dc3765ec4a054f8ac8d22e43fc07b09596f51b4a3ad7fff85b061f46c2215aabfffed41d379d73dd1c7db990cf6a62a633e22ad0120ee7b8706f0f79e9affacca7f91289c7bf8c6db80
/	/core/	auth	\\x0000000102f0399710a0294e55e80c05655d7e5e18ca169158034005feeead19923118afc9ceeebdc3b4b3383a67b751371efd1bb90ca4bb4dcef7229f252dbf03f35490ebef1a9308461ca442aed1d0719982068c7b85ada9e6cd45292a0700668c0bae6036ff6cfc1bbc3b0a26173d1e47ef3a06b44f089abd7e70be4ed64d47ffd680a7a52de59d66326c740b4a5f9ceda9634ee9df32fedf6d30cf2459fa6dbcd80b7bb6f6cc2d750ade246d57eeb71c6cb250db0e8f6bba8b638879320a260a8cc044d96364ed015bf3dbf6daed754b803ec5782379823e65dea72cd48bb9f4b098b6cda652f13dfa3bc36f1eaa8867728dbb3888b42617eb60b9aed81700408eaa87f1cea59ebf6e5999fce4e44337cf474f91bbdfc8b37a302b211dc4d9863e6a8a99ddcde4f9e1dc950be14f2f1c00d5e91fb4ede299a4110a9d2aac67698a3998118b9bc64f
/sys/	/sys/policy/	atlas	\\x000000010266b52e9725415a84b29a90c2bd2039cc8ddedeaa3a18a322886bfb2de351d36ed0f7904c708cf3298bccfee100c142cef4336c9f3fc031f61612b22c68c7507e850f2310ed427c869a7ce5eed4fd2f02af6fcfc14de06030195b1284f2cfa1ba5d1a30868b08f9a92bdcbea4565a6641800fa0302c11538dd73fc2711acfe524345e72b60df53bdf173182c66c57a7b65a6c12f84de87b25c32ebcd713b14b23e72bed1211c8aff4bcf004ab6cb86ccfcc4e61d07a3f97051cdfe9fbada997dd1f847e115f2cf06a674d3e72f5121a0b7e6f30301bf7c8276941a43a15cf78f572102420e418f6dd7c224a8d9ab767a9890acece0db0c4751c06182debd6cd7cb8277575a82cae3e4c8e2fd58468e7cc411009945ef1f89d56ea93513f86d2df276261e7384a32c55a81b096f0fb5b684d165595ee0673ce17bcb08d177f318c351a48a6db8d29af67be7e513e11eca7da5e3550b35e1f366bdf0592392e5177d9e7e408b9593e9eda16c6fa63fcd9ca36569c80b9924613e613ac4078f5858e70f025de308b12d5a8bbec536e831a987a6487c31c34f74b
/sys/token/	/sys/token/accessor/	3b73270e35979a80d778ae572264202e5ceb7de2	\\x0000000102583ed13ab34153746a9c17650f149506cb5cd8a04bceada6006b388b75c340d1831593a5db3634a6fc43903754ff1d205b0fc324140d34bf4be6de2de69cfd1d9b4313a51d5f3ec9d5078f53dbacd9358f7cc7d5351f6ad7559d565e71323a48c20b4a2e3f413e7d8f29c9082be78e9feb854017e979f9a4aa4b56a2b63bcad9cac4ab14e9
/sys/token/parent/	/sys/token/parent/hb475209a7dcca7c43a6cb9ed64d8917bf7870ed413bb649e588ab385faaafc9c/	h03a22165b822bf1eede68c4df56021ce101c2f0e4d501043e71bc5247691707e	\\x0000000102d0678dafa176749336ac7349fca552045750d555b30318fb3858096d
/sys/token/	/sys/token/id/	h03a22165b822bf1eede68c4df56021ce101c2f0e4d501043e71bc5247691707e	\\x0000000102761565d1ccd6a915f1b612f75b2e07fc1b6e8070eaa4588227fba78625bd15ce17b9d7f80e25280b92757e2957167bf2f32e55a0d913f961c66ac8e6b7c799356fc3d22ce1bc89ece9b207b7d6e621e8a2cca6a8bcaaefb4654c20b616491aac2e271889dcc37223acaec479894c05d4f510ff255603c0bb2448a0474948dc169dad7c6342de1c276c2284e4b72fe33dcaa4d09b74f710894573b033cddee903d7abe1dc23dc5517883c41321232dd965132d72883834586df161eee5df9040c930755df52179594549c6298db44d125adc50936691c1725cfe1f37929d7fa0d7d538c727d43def8eb191d30dd1197adb7ba6732b7166d5bacf588e053a0e23acd6afc615759cc504aea24cd3cde60bf5c0dfd6f85d649e4c95ff214032cd3996c63d61f57581ce597ba58269e1bc5650026b28f7afb4f24e892b8d8ea749187a20f5b576c01f6c4be05954f30bac5683d2f5c25ae72b309bc60be61ef6e89ac9e9ea6f65882e73939f16a8b292e5c4757457cb6f35927b3a24ea52ceed6f86681dc906452abce93008c71f662a3a1b0802519921fcaf145b05647bf7dbbf5c0c990d8d504e5e2f39b75bfae307bb5b9e15459cc4ee0dca402b8085d0166beef61c862b5f3331e6d1b6ed2f0df32c0a17878fef061902d0d83cf9be8f426d062c97fce0d0e59344b86e74fd34958f7fde67fbfc6ed8c48008aaa912718
/sys/expire/id/auth/token/	/sys/expire/id/auth/token/create/	h03a22165b822bf1eede68c4df56021ce101c2f0e4d501043e71bc5247691707e	\\x0000000102885bb1fc946c7e3c5ea065d05822ebc1e13c04f38fbcd0318b81dfa96c000f660fe7237bc189b6a60dc0a12a963d5a24526988cdbc07b0d6a96139d8a32446dc215f2c8a72baefbcaa8ac404e3511fe5eae3cae552fda740c25517c25b87d8232fc5921e3e814c53f838fc782566f1e1765656af90cba7c946d062dc56306dfc54929d2780d98c42a1cb58664b198cb1c26011b89ca9f865ae76772ac9a4a06ad60e417871b2f83ade5a6f771823d65d0448bd1b46fa373ec5d8a4358cc0ccb0ee18a00ce2757ca2d514df900e4901b16202288e0c1269e5d48ed37c2dffe73fa82b09fe674b6e18e8fa7e095ee10b4fb9c9b7a5568992843d3399ce98d4b51f3831e7928937028b23d34fc78340fbb843d8c6d3ed2ab4e2c3f4a794e7222aaa88bcd3cb7a3a785638b8b8065df5536419acc538f1b6b04dab15199dd00533d3d624b3e531ad35252baf3d8c6da14a6b8846b49b8ce18b0827466c753821820f1c4c9f0f2a330491955e4f89ba8d4e74576047a0af0dd7db3845067fb80fa1d45e15c69a2e3aab4a14c9208cee94e34cd272fca440f278c170139b438703dc1f370c02f4eb1ec34eaaca985f7eb801ca000e48bde01577098446cd1020dd6d77dad9ac4c355e8f9db7cc339e27b889c685f0f2a21e4dc99a2aea02adb70cd2623a7cd1f6ad85b50ac9c4a326e793b22cb7ab72d9ffb9029bbac940f837b1af3fa6624656fcede28265ea1a7514a2f72de430ffe6e6b4fd196d8d1ac48401a9e96ef709c1072ad739f622bde679fc408c41d7d93ae226f3a8591c59256ad4cfce4ad24f81a9515c687f739a1081bde4dbbcbdc554b846793553f198dbf95a8e70d783110f3db32f003fd8b660536b3885b25708c65eefce9e3feb57bc65c47ea8006ce1c8a9bf4c2e11f5bc2872d065bfd2b98212f652afd71978ef937298895d7b21a8942a64db8d5e3dc3944badd8957efa604663cd77df5822096c94c4d8e900dfb1e7783b83bf60b7f4f8d2e54d841c4dc785c432ea8919c8d0273eaacdfe570207138cdee76099ada45aa3a46756fcfac6dc2b4288481b47057f68c7d52cadb2c0dcc5c3163f950b247333741f345267fff2ba616e29e57105741e78dedf047390d573f137bda8fe85444e227ee85412392a2b0bdadfa0a9a7b202b888684417e961eca58b9de643ce1f040ae9cdec3532354bda6f4986532ded7f53abde666fed923408bfd1eb38edd4848d5ddd5938ae82d8399fb986a27db9be19b6cf9a6435a0487b6f8e4b08df3c95ea
/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/	/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/archive/	archivist_kdf	\\x000000010280b47900d99440828e9fa85d5c3a2b9fa1c148cffd46eb4722154f2a2ffc9344673007c4f19832652061389fa283ab91c38097d6cbdd5075653d50b95e805df03203618f815bf3eeae613b8f22411b3d9322e78e78abaab3ea833638ab9fe7bd931be59e41e6ddad1e5e302e5107186c8a60b6c5830a5aeef0514a88e774509c4399ce5c522c68ff8b4a40dddd6725cb32152cedbc7ea1451eb201cc55fe41ef85601f18617cefabd8845327c9019a85a52a97ac8f6df2a78d1a0c0576217ae0a66ecd0abb896595776a4c0e24b2043f442ccbebf6bed0eb29a3a848ebf23a823a3f0299b72dd634a3f1daad365bfe079da0b9dd2ff81c9e64792f96bd9ffcdbd91aad5dc4a061a085c877825d42e7d8c34e290058ac4ab2294b2c21d55fe85381fc482da861e5592e3e4bea4941bf5bc1947338dafa7e0cefd14a6ab015d95735be5858fe55b946b03aa6f8f32bf6d1881bd1af95a3fb275514981e4975659f3f9f10a52b0197def8c86e4645a89bd631362190ec4670dccc4112ad30e2c83d4798546854b0482e4898d46dbdb570a03cd2dca344d22d5d9e84945ff76fa66f38c43a0abab66bca8473b15550fd403607b1b9a2c388452faab3e3d535b4be14a6367dfc61ccdb11b5b115bb17f62df1694fd3922358eb521c9096
/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/	/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/policy/	atlas_health_check	\\x00000001023c7b84580790b2538ecec4298071bd572e2d6fca03f5aee223013737e6ffa1a9808e30159465c5ad8f28b8e49abe6e1ea0bcb60dfdf170694b993b3b33caaa3ae54eed3a17ab0f658195f4d4db1bd45971e93393c7f4f30d061017a1a90a284eb18fa2bb7f4449083d484b1135030283884d6e59bb316ebaf71e8f7c3e97a21a8e1cea50fff2af6fe0791301301276e3b7acea1d7eaa7ffc684f8060190a9445a9b84a5455b0c2a353cca02d018db8f9c2f89d44715971b915c4abb90f18ba11147ecea9b4fd97b3ed72909cb1ac509dc74bbce51f1cbcf487cccd3d05a38226e35bf51bc5aa3583578662c844cc49c9d6a7edeabac344ca6e7678bc18f8c561f175d7062884917bf1ba207f233e3fbeb9ad81c198446f967d51db725f1ccd502443e6eb12491c90659003751d4fbc0d3872e55512475e4abf87dfe71ec010162e6f2452472a8bbe9ca8818152e256ddaa20c72f32d5b251b69f0971a3dbe85bb8a498c0986aa5e66f8cbf4058ca7201da34ff974c0ae78a25fc11ee205868fed6fb3eeccd092ec2accd63ab447aee3b52c4362c4d9b6c00ab178b726abe35670b892cd00e1a96a01b53576a170acc21927c7f2ab9e8198a1cd51de9239f9faf0101775ff27b0f18c9fc8abc99cbef40a2cc17f055a0945ec95cd79ed708df36dc86227581eb01e98162e784af3cedfa3f59300acdfa93a7c8d5e27e8ed30caaa55f6457eee028dfbbc7b641f038efec9c922c5d6787ab08b9237876d4a1c25bfb66290f8a912f9aef44fa5b4b59f22dcdde1091840a3ea7a5f139846439425f2f0a7ea197d4c50b44a6899d0a397c0db04acfce4f5d6bba52e4624d1f3a7490198a37c63e3cc9846219dfc4860d6dacdfd5fc3df89dfb7bc4777edf527bbcf588755ef1688a43b8286895dfe99b59909e712d235d44236c2da9a05bb2c20838744819dfaae1b2a8a28e4c142048bec1e929a66b75f22afc0a5c05feb910fbf01caf11af9b5fe2b49b504980d7071632dacf8cda5d
/sys/counters/requests/	/sys/counters/requests/2020/	07	\\x000000010245f303b0588cda20e5fa84518b094197b5d8162e31e01ad4d7e37d516c3a6d8074510cb2e8b4b2d0
/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/	/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/policy/	archivist_kdf	\\x0000000102e90ba27df82726b079bd5f5fa9ff9efc007c4e13e058c5082d4ab45d655e5a59ec20380d6e334ea76a4462f6ce486cce08e5e8872fa50ed6bbd9f63e04b7743c55e6e3946c5a6f0368c807e3f2eb19d324ae2433ce5653f0ebaab7e2be2aa18162829e50bea20ffcef6800d58511f198049e2e24589b344cd56bc1d1a549f8e255d0dc422b33a464c0f5551c58185a621b9ee7f2f17a6e94345e54cf025c76e38ab82b965abbe90e8faf9f0c200aea7548c317e4c5a8cdf58694ab36238f13296fa6d83e2cdf529def02a6cda0d1557cab9a6d476d82c83d1663b1990fe73ef5c9f0e83f148d3cdd803ff58a369d4b999b405d21117f0c3f7f6ae65b585afb7359598f2f40fdcde6c7206cb582c7a00c973cfbe3de7387440f0f67516c00e7db1d0dd9d3823b211a299291591807d68261d9f1e2fb02d2310ac2829ec2e67494050a9b5a5f68d7c808254c4430414540053f69dbb42ed2e90709700e923e75e90a57db6ae4162ebfdb334c5b7bf49532984a3a00da7b5e2d350a5fd788e7f7a0935ae36ec9cadf5be2cf5ed5b9eb09c1bd2c11c4f0f6fe8f3d70224e6d953fc8ed19b60e53fe76dd8c3a772faed72cb8197fb57028f7162966600683cd48156930c714430eb0423c492c27b8ee785012f13d0aef143ed2528f2e46adf502f84c84f213cfeea9a09db4ba1c17e346e895407d2efe39b0368adb81b3fbff1b5f5b3d86669618bf7e355d0a4c2389d99ed473c3f853a4020230db221b4c10c755b5ba3f9eaf82e708c74a8f8b3d48f082158c8881f6fa5466be56a87ec6c86776b21765faf5514349961124fc27a826cf4d1e68b665e66a959f9ba59d60d2a82928d906c7d9b1d58a4bc181e28dd5739f9ead6f25c022865088106e8cc3b6662cc0e5c61db1a0098adf56bb3c772d275a0f5b1823ac537430bad06b953e41ffdc0831d864069b31d7af1f5d217b4e0dae9a30b59a5647403609b7d4eb0a1fe10b4bff2fb02fe4e1a69aca76bbc1659e20
/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/	/logical/eb04f08e-f591-2f5d-863f-d5927616b3e5/archive/	atlas_health_check	\\x0000000102b81aac85ca3ef561570043053dc4a62902ce05fa0746d698682110194561fdfb1e3224651fa1b960f48d808358c29c64f9623ada79e41b317ad914c6f6bb9d5ac3828cc8d5b346573d036833a20ef9c03d0025b8c56ff6a3492ab74065ba4110f769bda392583c57bc6a5fa7dd2a8f881fb7a40972157e554717a7337034a89a46c516247d8640b3bf22e0114b1a06a4b996129c447ff8050e0641c55c352426c6d004114b1ac0774cf44e7bd4452f1c719ed896b9851c83aad33031702af8b965c1cdb235b6eddb8230a37e500ac34c4a449ddd4317376156d7815365ebc24b8634b36c1bcf9b2bc31447182731a6311635af735435ebd54ddf2297e02bc285872679fa4d79060e18a5770babc39c2f78bc8c35b50873ce44657b360d1491d7fcfc79085ec4b70783de07b5ce116e542b385e3ececed444275693f99dea87fbb42950314897bb82dfa9fb5d9409ddfd349f5075b6ac8e351f4e72fa361b8fe9544e1f11f99ef2fb845bb41c05e0117591d255ca3809bc9b99d6880d337aa1d1c17bb61b3204a85bbefe027882ff272b21a3ff83b30da6d5a41ae4c0cbda3ab330e6472a7f4dd74a01b7b2d37c5d2a41ff6478394148aaba6a9fcd5ce53ee7411737221a58fb32718a239a0e024ba8722224313a3d433d43643b8a
\.


--
-- Name: admin_settings_cost_estimation_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_cost_estimation
    ADD CONSTRAINT admin_settings_cost_estimation_pkey PRIMARY KEY (id);


--
-- Name: admin_settings_customization_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_customization
    ADD CONSTRAINT admin_settings_customization_pkey PRIMARY KEY (id);


--
-- Name: admin_settings_general_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_general
    ADD CONSTRAINT admin_settings_general_pkey PRIMARY KEY (id);


--
-- Name: admin_settings_saml_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_saml
    ADD CONSTRAINT admin_settings_saml_pkey PRIMARY KEY (id);


--
-- Name: admin_settings_smtp_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_smtp
    ADD CONSTRAINT admin_settings_smtp_pkey PRIMARY KEY (id);


--
-- Name: admin_settings_twilio_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.admin_settings_twilio
    ADD CONSTRAINT admin_settings_twilio_pkey PRIMARY KEY (id);


--
-- Name: applies_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.applies
    ADD CONSTRAINT applies_pkey PRIMARY KEY (id);


--
-- Name: archivist_objects_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.archivist_objects
    ADD CONSTRAINT archivist_objects_pkey PRIMARY KEY (id);


--
-- Name: audit_trails_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.audit_trails
    ADD CONSTRAINT audit_trails_pkey PRIMARY KEY (id);


--
-- Name: authentication_tokens_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.authentication_tokens
    ADD CONSTRAINT authentication_tokens_pkey PRIMARY KEY (id);


--
-- Name: configuration_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.configuration_versions
    ADD CONSTRAINT configuration_versions_pkey PRIMARY KEY (id);


--
-- Name: cost_estimates_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.cost_estimates
    ADD CONSTRAINT cost_estimates_pkey PRIMARY KEY (id);


--
-- Name: email_recipients_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.email_recipients
    ADD CONSTRAINT email_recipients_pkey PRIMARY KEY (id);


--
-- Name: feature_sets_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.feature_sets
    ADD CONSTRAINT feature_sets_pkey PRIMARY KEY (id);


--
-- Name: github_app_apps_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_apps
    ADD CONSTRAINT github_app_apps_pkey PRIMARY KEY (id);


--
-- Name: github_app_installations_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_installations
    ADD CONSTRAINT github_app_installations_pkey PRIMARY KEY (id);


--
-- Name: github_app_oauth_tokens_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_oauth_tokens
    ADD CONSTRAINT github_app_oauth_tokens_pkey PRIMARY KEY (id);


--
-- Name: hosted_files_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.hosted_files
    ADD CONSTRAINT hosted_files_pkey PRIMARY KEY (id);


--
-- Name: ingress_attributes_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_attributes
    ADD CONSTRAINT ingress_attributes_pkey PRIMARY KEY (id);


--
-- Name: ingress_triggers_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_triggers
    ADD CONSTRAINT ingress_triggers_pkey PRIMARY KEY (id);


--
-- Name: memberships_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: notification_configurations_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.notification_configurations
    ADD CONSTRAINT notification_configurations_pkey PRIMARY KEY (id);


--
-- Name: o_auth_clients_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.o_auth_clients
    ADD CONSTRAINT o_auth_clients_pkey PRIMARY KEY (id);


--
-- Name: o_auth_tokens_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.o_auth_tokens
    ADD CONSTRAINT o_auth_tokens_pkey PRIMARY KEY (id);


--
-- Name: organization_permission_sets_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_permission_sets
    ADD CONSTRAINT organization_permission_sets_pkey PRIMARY KEY (id);


--
-- Name: organization_users_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_users
    ADD CONSTRAINT organization_users_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: plan_exports_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.plan_exports
    ADD CONSTRAINT plan_exports_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: policies_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (id);


--
-- Name: policy_check_criteria_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_check_criteria
    ADD CONSTRAINT policy_check_criteria_pkey PRIMARY KEY (id);


--
-- Name: policy_checks_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_checks
    ADD CONSTRAINT policy_checks_pkey PRIMARY KEY (id);


--
-- Name: policy_configs_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_configs
    ADD CONSTRAINT policy_configs_pkey PRIMARY KEY (id);


--
-- Name: policy_results_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_results
    ADD CONSTRAINT policy_results_pkey PRIMARY KEY (id);


--
-- Name: policy_set_policies_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_policies
    ADD CONSTRAINT policy_set_policies_pkey PRIMARY KEY (id);


--
-- Name: policy_set_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_versions
    ADD CONSTRAINT policy_set_versions_pkey PRIMARY KEY (id);


--
-- Name: policy_set_workspaces_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_set_workspaces
    ADD CONSTRAINT policy_set_workspaces_pkey PRIMARY KEY (id);


--
-- Name: policy_sets_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_sets
    ADD CONSTRAINT policy_sets_pkey PRIMARY KEY (id);


--
-- Name: policy_snapshots_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_snapshots
    ADD CONSTRAINT policy_snapshots_pkey PRIMARY KEY (id);


--
-- Name: policy_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.policy_versions
    ADD CONSTRAINT policy_versions_pkey PRIMARY KEY (id);


--
-- Name: prospective_users_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.prospective_users
    ADD CONSTRAINT prospective_users_pkey PRIMARY KEY (id);


--
-- Name: registry_module_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.registry_module_versions
    ADD CONSTRAINT registry_module_versions_pkey PRIMARY KEY (id);


--
-- Name: registry_modules_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.registry_modules
    ADD CONSTRAINT registry_modules_pkey PRIMARY KEY (id);


--
-- Name: run_events_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_events
    ADD CONSTRAINT run_events_pkey PRIMARY KEY (id);


--
-- Name: run_trigger_snapshots_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_trigger_snapshots
    ADD CONSTRAINT run_trigger_snapshots_pkey PRIMARY KEY (id);


--
-- Name: run_triggers_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_triggers
    ADD CONSTRAINT run_triggers_pkey PRIMARY KEY (id);


--
-- Name: runs_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: setting_storage_postgres_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.setting_storage_postgres
    ADD CONSTRAINT setting_storage_postgres_pkey PRIMARY KEY (id);


--
-- Name: ssh_keys_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ssh_keys
    ADD CONSTRAINT ssh_keys_pkey PRIMARY KEY (id);


--
-- Name: state_version_outputs_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_version_outputs
    ADD CONSTRAINT state_version_outputs_pkey PRIMARY KEY (id);


--
-- Name: state_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_versions
    ADD CONSTRAINT state_versions_pkey PRIMARY KEY (id);


--
-- Name: stored_traces_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.stored_traces
    ADD CONSTRAINT stored_traces_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: team_workspaces_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.team_workspaces
    ADD CONSTRAINT team_workspaces_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tool_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.tool_versions
    ADD CONSTRAINT tool_versions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vars_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vars
    ADD CONSTRAINT vars_pkey PRIMARY KEY (id);


--
-- Name: vcs_hosts_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_hosts
    ADD CONSTRAINT vcs_hosts_pkey PRIMARY KEY (id);


--
-- Name: vcs_repos_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_repos
    ADD CONSTRAINT vcs_repos_pkey PRIMARY KEY (id);


--
-- Name: webhook_payloads_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.webhook_payloads
    ADD CONSTRAINT webhook_payloads_pkey PRIMARY KEY (id);


--
-- Name: workspace_comments_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_comments
    ADD CONSTRAINT workspace_comments_pkey PRIMARY KEY (id);


--
-- Name: workspace_configuration_versions_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_configuration_versions
    ADD CONSTRAINT workspace_configuration_versions_pkey PRIMARY KEY (id);


--
-- Name: workspaces_pkey; Type: CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: gpg_keys_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.gpg_keys
    ADD CONSTRAINT gpg_keys_pkey PRIMARY KEY (id);


--
-- Name: idx_module_provider_name; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_providers
    ADD CONSTRAINT idx_module_provider_name UNIQUE (module_id, provider);


--
-- Name: last_modified_times_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.last_modified_times
    ADD CONSTRAINT last_modified_times_pkey PRIMARY KEY (id);


--
-- Name: logprocessor_files_complete_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.logprocessor_files_complete
    ADD CONSTRAINT logprocessor_files_complete_pkey PRIMARY KEY (id);


--
-- Name: module_deps_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_deps
    ADD CONSTRAINT module_deps_pkey PRIMARY KEY (id);


--
-- Name: module_outputs_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_outputs
    ADD CONSTRAINT module_outputs_pkey PRIMARY KEY (id);


--
-- Name: module_provider_deps_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_provider_deps
    ADD CONSTRAINT module_provider_deps_pkey PRIMARY KEY (id);


--
-- Name: module_providers_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_providers
    ADD CONSTRAINT module_providers_pkey PRIMARY KEY (id);


--
-- Name: module_resources_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_resources
    ADD CONSTRAINT module_resources_pkey PRIMARY KEY (id);


--
-- Name: module_submodules_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_submodules
    ADD CONSTRAINT module_submodules_pkey PRIMARY KEY (id);


--
-- Name: module_variables_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_variables
    ADD CONSTRAINT module_variables_pkey PRIMARY KEY (id);


--
-- Name: module_versions_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_versions
    ADD CONSTRAINT module_versions_pkey PRIMARY KEY (id);


--
-- Name: modules_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- Name: namespace_name; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.modules
    ADD CONSTRAINT namespace_name UNIQUE (namespace, name);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: provider_docs_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_docs
    ADD CONSTRAINT provider_docs_pkey PRIMARY KEY (id);


--
-- Name: provider_docs_slug; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_docs
    ADD CONSTRAINT provider_docs_slug UNIQUE (provider_version_id, category, slug);


--
-- Name: provider_platforms_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_platforms
    ADD CONSTRAINT provider_platforms_pkey PRIMARY KEY (id);


--
-- Name: provider_version; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_versions
    ADD CONSTRAINT provider_version UNIQUE (provider_id, version);


--
-- Name: provider_version_doc; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_docs
    ADD CONSTRAINT provider_version_doc UNIQUE (provider_version_id, path);


--
-- Name: provider_version_platform; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_platforms
    ADD CONSTRAINT provider_version_platform UNIQUE (provider_version_id, os, arch);


--
-- Name: provider_versions_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_versions
    ADD CONSTRAINT provider_versions_pkey PRIMARY KEY (id);


--
-- Name: providers_alias_key; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.providers
    ADD CONSTRAINT providers_alias_key UNIQUE (alias);


--
-- Name: providers_namespace_name; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.providers
    ADD CONSTRAINT providers_namespace_name UNIQUE (namespace, name);


--
-- Name: providers_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ha_key; Type: CONSTRAINT; Schema: vault; Owner: hashicorp
--

ALTER TABLE ONLY vault.vault_ha_locks
    ADD CONSTRAINT ha_key PRIMARY KEY (ha_key);


--
-- Name: pkey; Type: CONSTRAINT; Schema: vault; Owner: hashicorp
--

ALTER TABLE ONLY vault.vault_kv_store
    ADD CONSTRAINT pkey PRIMARY KEY (path, key);


--
-- Name: configuration_version; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX configuration_version ON rails.workspace_configuration_versions USING btree (configuration_version_id);


--
-- Name: idx_hosted_files_on_uploaded_at_deleted_at_and_deletable_after; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX idx_hosted_files_on_uploaded_at_deleted_at_and_deletable_after ON rails.hosted_files USING btree (uploaded_at, deleted_at, deletable_after);


--
-- Name: index_applies_on_archivist_upload_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_applies_on_archivist_upload_id ON rails.applies USING btree (archivist_upload_id);


--
-- Name: index_applies_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_applies_on_external_id ON rails.applies USING btree (external_id);


--
-- Name: index_applies_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_applies_on_run_id ON rails.applies USING btree (run_id);


--
-- Name: index_applies_where_status_pending; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_applies_where_status_pending ON rails.applies USING btree (id) WHERE ((status)::text = 'pending'::text);


--
-- Name: index_archivist_objects_on_archivist_upload_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_archivist_objects_on_archivist_upload_id ON rails.archivist_objects USING btree (archivist_upload_id);


--
-- Name: index_archivist_objects_on_attachable_and_filename; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_archivist_objects_on_attachable_and_filename ON rails.archivist_objects USING btree (attachable_id, attachable_type, filename);


--
-- Name: index_archivist_objects_on_keypath; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_archivist_objects_on_keypath ON rails.archivist_objects USING btree (keypath);


--
-- Name: index_archivist_objects_on_uploaded_at_and_created_at; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_archivist_objects_on_uploaded_at_and_created_at ON rails.archivist_objects USING btree (uploaded_at, created_at) WHERE (uploaded_at IS NULL);


--
-- Name: index_archivist_objects_on_uploaded_at_and_deletable_after; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_archivist_objects_on_uploaded_at_and_deletable_after ON rails.archivist_objects USING btree (uploaded_at, deletable_after) WHERE (uploaded_at IS NOT NULL);


--
-- Name: index_audit_trails_on_auth_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_audit_trails_on_auth_organization_id ON rails.audit_trails USING btree (auth_organization_id);


--
-- Name: index_audit_trails_on_timestamp; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_audit_trails_on_timestamp ON rails.audit_trails USING btree ("timestamp");


--
-- Name: index_authentication_tokens_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_authentication_tokens_on_external_id ON rails.authentication_tokens USING btree (external_id);


--
-- Name: index_authentication_tokens_on_token_hash; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_authentication_tokens_on_token_hash ON rails.authentication_tokens USING btree (token_hash);


--
-- Name: index_authentication_tokens_on_tokenable; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_authentication_tokens_on_tokenable ON rails.authentication_tokens USING btree (authentication_tokenable_type, authentication_tokenable_id);


--
-- Name: index_authentication_tokens_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_authentication_tokens_on_user_id ON rails.authentication_tokens USING btree (user_id);


--
-- Name: index_configuration_versions_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_configuration_versions_on_created_by_id ON rails.configuration_versions USING btree (created_by_id);


--
-- Name: index_configuration_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_configuration_versions_on_external_id ON rails.configuration_versions USING btree (external_id);


--
-- Name: index_configuration_versions_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_configuration_versions_on_organization_id ON rails.configuration_versions USING btree (organization_id);


--
-- Name: index_configuration_versions_on_trace_resource_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_configuration_versions_on_trace_resource_id ON rails.configuration_versions USING btree (trace_resource_id);


--
-- Name: index_configuration_versions_on_vcs_repo_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_configuration_versions_on_vcs_repo_id ON rails.configuration_versions USING btree (vcs_repo_id);


--
-- Name: index_cost_estimates_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_cost_estimates_on_external_id ON rails.cost_estimates USING btree (external_id);


--
-- Name: index_cost_estimates_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_cost_estimates_on_run_id ON rails.cost_estimates USING btree (run_id);


--
-- Name: index_email_recipients_on_notification_configuration_and_user; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_email_recipients_on_notification_configuration_and_user ON rails.email_recipients USING btree (notification_configuration_id, user_id);


--
-- Name: index_email_recipients_on_notification_configuration_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_email_recipients_on_notification_configuration_id ON rails.email_recipients USING btree (notification_configuration_id);


--
-- Name: index_email_recipients_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_email_recipients_on_user_id ON rails.email_recipients USING btree (user_id);


--
-- Name: index_feature_sets_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_feature_sets_on_external_id ON rails.feature_sets USING btree (external_id);


--
-- Name: index_feature_sets_on_identifier; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_feature_sets_on_identifier ON rails.feature_sets USING btree (identifier);


--
-- Name: index_github_app_apps_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_github_app_apps_on_external_id ON rails.github_app_apps USING btree (external_id);


--
-- Name: index_github_app_installations_on_app_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_github_app_installations_on_app_id ON rails.github_app_installations USING btree (app_id);


--
-- Name: index_github_app_installations_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_github_app_installations_on_external_id ON rails.github_app_installations USING btree (external_id);


--
-- Name: index_github_app_installations_on_installation_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_github_app_installations_on_installation_id ON rails.github_app_installations USING btree (installation_id);


--
-- Name: index_github_app_oauth_tokens_on_app_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_github_app_oauth_tokens_on_app_id ON rails.github_app_oauth_tokens USING btree (app_id);


--
-- Name: index_github_app_oauth_tokens_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_github_app_oauth_tokens_on_external_id ON rails.github_app_oauth_tokens USING btree (external_id);


--
-- Name: index_github_app_oauth_tokens_on_github_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_github_app_oauth_tokens_on_github_user_id ON rails.github_app_oauth_tokens USING btree (github_user_id);


--
-- Name: index_github_app_oauth_tokens_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_github_app_oauth_tokens_on_user_id ON rails.github_app_oauth_tokens USING btree (user_id);


--
-- Name: index_hosted_files_on_archivist_upload_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_hosted_files_on_archivist_upload_id ON rails.hosted_files USING btree (archivist_upload_id);


--
-- Name: index_hosted_files_on_deletable_after; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_hosted_files_on_deletable_after ON rails.hosted_files USING btree (deletable_after);


--
-- Name: index_hosted_files_on_hostable_id_and_hostable_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_hosted_files_on_hostable_id_and_hostable_type ON rails.hosted_files USING btree (hostable_id, hostable_type);


--
-- Name: index_ingress_attributes_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_ingress_attributes_on_external_id ON rails.ingress_attributes USING btree (external_id);


--
-- Name: index_ingress_triggers_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_ingress_triggers_on_external_id ON rails.ingress_triggers USING btree (external_id);


--
-- Name: index_ingress_triggers_on_ingressable_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_ingress_triggers_on_ingressable_id ON rails.ingress_triggers USING btree (ingressable_id);


--
-- Name: index_ingress_triggers_on_ingressable_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_ingress_triggers_on_ingressable_type ON rails.ingress_triggers USING btree (ingressable_type);


--
-- Name: index_ingress_triggers_on_vcs_repo_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_ingress_triggers_on_vcs_repo_id ON rails.ingress_triggers USING btree (vcs_repo_id);


--
-- Name: index_memberships_on_organization_user_id_and_team_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_memberships_on_organization_user_id_and_team_id ON rails.memberships USING btree (organization_user_id, team_id);


--
-- Name: index_memberships_on_team_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_memberships_on_team_id ON rails.memberships USING btree (team_id);


--
-- Name: index_notification_configurations_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_notification_configurations_on_external_id ON rails.notification_configurations USING btree (external_id);


--
-- Name: index_notification_configurations_subscribable; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_notification_configurations_subscribable ON rails.notification_configurations USING btree (subscribable_type, subscribable_id);


--
-- Name: index_o_auth_clients_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_o_auth_clients_on_external_id ON rails.o_auth_clients USING btree (external_id);


--
-- Name: index_o_auth_clients_on_uuid; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_o_auth_clients_on_uuid ON rails.o_auth_clients USING btree (uuid);


--
-- Name: index_o_auth_tokens_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_o_auth_tokens_on_external_id ON rails.o_auth_tokens USING btree (external_id);


--
-- Name: index_organization_permission_sets_on_team_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_organization_permission_sets_on_team_id ON rails.organization_permission_sets USING btree (team_id);


--
-- Name: index_organization_users_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_organization_users_on_external_id ON rails.organization_users USING btree (external_id);


--
-- Name: index_organization_users_on_organization_id_and_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_organization_users_on_organization_id_and_user_id ON rails.organization_users USING btree (organization_id, user_id);


--
-- Name: index_organization_users_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_organization_users_on_user_id ON rails.organization_users USING btree (user_id);


--
-- Name: index_organizations_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_organizations_on_created_by_id ON rails.organizations USING btree (created_by_id);


--
-- Name: index_organizations_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_organizations_on_external_id ON rails.organizations USING btree (external_id);


--
-- Name: index_organizations_on_lower_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_organizations_on_lower_name ON rails.organizations USING btree (lower((name)::text));


--
-- Name: index_organizations_on_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_organizations_on_name ON rails.organizations USING btree (name);


--
-- Name: index_plan_exports_on_data_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plan_exports_on_data_type ON rails.plan_exports USING btree (data_type);


--
-- Name: index_plan_exports_on_data_type_and_status; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plan_exports_on_data_type_and_status ON rails.plan_exports USING btree (data_type, status);


--
-- Name: index_plan_exports_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_plan_exports_on_external_id ON rails.plan_exports USING btree (external_id);


--
-- Name: index_plan_exports_on_plan_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plan_exports_on_plan_id ON rails.plan_exports USING btree (plan_id);


--
-- Name: index_plan_exports_on_status; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plan_exports_on_status ON rails.plan_exports USING btree (status);


--
-- Name: index_plans_on_archivist_upload_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plans_on_archivist_upload_id ON rails.plans USING btree (archivist_upload_id);


--
-- Name: index_plans_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_plans_on_external_id ON rails.plans USING btree (external_id);


--
-- Name: index_plans_on_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plans_on_id ON rails.plans USING btree (id) WHERE ((status)::text = 'queued'::text);


--
-- Name: index_plans_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plans_on_run_id ON rails.plans USING btree (run_id);


--
-- Name: index_plans_where_status_pending; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_plans_where_status_pending ON rails.plans USING btree (id) WHERE ((status)::text = 'pending'::text);


--
-- Name: index_policies_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policies_on_external_id ON rails.policies USING btree (external_id);


--
-- Name: index_policies_on_holder_id_and_holder_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policies_on_holder_id_and_holder_type ON rails.policies USING btree (holder_id, holder_type);


--
-- Name: index_policy_check_criteria_on_policy_check_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_check_criteria_on_policy_check_id ON rails.policy_check_criteria USING btree (policy_check_id);


--
-- Name: index_policy_check_criteria_on_policy_set_version_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_check_criteria_on_policy_set_version_id ON rails.policy_check_criteria USING btree (policy_set_version_id);


--
-- Name: index_policy_check_criterium_on_polchk_and_polsetver; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_check_criterium_on_polchk_and_polsetver ON rails.policy_check_criteria USING btree (policy_check_id, policy_set_version_id);


--
-- Name: index_policy_checks_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_checks_on_external_id ON rails.policy_checks USING btree (external_id);


--
-- Name: index_policy_checks_on_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_checks_on_id ON rails.policy_checks USING btree (id) WHERE ((status)::text = ANY (ARRAY['pending'::text, 'queued'::text]));


--
-- Name: index_policy_checks_on_nomad_job_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_checks_on_nomad_job_id ON rails.policy_checks USING btree (nomad_job_id);


--
-- Name: index_policy_checks_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_checks_on_run_id ON rails.policy_checks USING btree (run_id);


--
-- Name: index_policy_results_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_results_on_external_id ON rails.policy_results USING btree (external_id);


--
-- Name: index_policy_results_on_policy_check_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_results_on_policy_check_id ON rails.policy_results USING btree (policy_check_id);


--
-- Name: index_policy_set_policies_on_policy_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_policies_on_policy_id ON rails.policy_set_policies USING btree (policy_id);


--
-- Name: index_policy_set_policies_on_policy_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_policies_on_policy_set_id ON rails.policy_set_policies USING btree (policy_set_id);


--
-- Name: index_policy_set_policies_on_policy_set_id_and_policy_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_set_policies_on_policy_set_id_and_policy_id ON rails.policy_set_policies USING btree (policy_set_id, policy_id);


--
-- Name: index_policy_set_versions_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_versions_on_created_by_id ON rails.policy_set_versions USING btree (created_by_id);


--
-- Name: index_policy_set_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_set_versions_on_external_id ON rails.policy_set_versions USING btree (external_id);


--
-- Name: index_policy_set_versions_on_ingress_attributes_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_versions_on_ingress_attributes_id ON rails.policy_set_versions USING btree (ingress_attributes_id);


--
-- Name: index_policy_set_versions_on_policy_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_versions_on_policy_set_id ON rails.policy_set_versions USING btree (policy_set_id);


--
-- Name: index_policy_set_versions_on_vcs_repo_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_versions_on_vcs_repo_id ON rails.policy_set_versions USING btree (vcs_repo_id);


--
-- Name: index_policy_set_workspaces_on_policy_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_workspaces_on_policy_set_id ON rails.policy_set_workspaces USING btree (policy_set_id);


--
-- Name: index_policy_set_workspaces_on_policy_set_id_and_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_set_workspaces_on_policy_set_id_and_workspace_id ON rails.policy_set_workspaces USING btree (policy_set_id, workspace_id);


--
-- Name: index_policy_set_workspaces_on_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_set_workspaces_on_workspace_id ON rails.policy_set_workspaces USING btree (workspace_id);


--
-- Name: index_policy_sets_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_sets_on_external_id ON rails.policy_sets USING btree (external_id);


--
-- Name: index_policy_sets_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_sets_on_organization_id ON rails.policy_sets USING btree (organization_id);


--
-- Name: index_policy_snapshots_on_policy_check_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_snapshots_on_policy_check_id ON rails.policy_snapshots USING btree (policy_check_id);


--
-- Name: index_policy_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_policy_versions_on_external_id ON rails.policy_versions USING btree (external_id);


--
-- Name: index_policy_versions_on_policy_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_policy_versions_on_policy_id ON rails.policy_versions USING btree (policy_id);


--
-- Name: index_registry_module_versions_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_module_versions_on_created_by_id ON rails.registry_module_versions USING btree (created_by_id);


--
-- Name: index_registry_module_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_registry_module_versions_on_external_id ON rails.registry_module_versions USING btree (external_id);


--
-- Name: index_registry_module_versions_on_ingress_attributes_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_module_versions_on_ingress_attributes_id ON rails.registry_module_versions USING btree (ingress_attributes_id);


--
-- Name: index_registry_module_versions_on_registry_module_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_module_versions_on_registry_module_id ON rails.registry_module_versions USING btree (registry_module_id);


--
-- Name: index_registry_module_versions_on_status_timestamps; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_module_versions_on_status_timestamps ON rails.registry_module_versions USING btree (status_timestamps);


--
-- Name: index_registry_module_versions_on_vcs_repo_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_module_versions_on_vcs_repo_id ON rails.registry_module_versions USING btree (vcs_repo_id);


--
-- Name: index_registry_modules_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_registry_modules_on_external_id ON rails.registry_modules USING btree (external_id);


--
-- Name: index_registry_modules_on_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_modules_on_name ON rails.registry_modules USING btree (name);


--
-- Name: index_registry_modules_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_modules_on_organization_id ON rails.registry_modules USING btree (organization_id);


--
-- Name: index_registry_modules_on_provider; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_modules_on_provider ON rails.registry_modules USING btree (provider);


--
-- Name: index_registry_modules_on_status_timestamps; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_registry_modules_on_status_timestamps ON rails.registry_modules USING btree (status_timestamps);


--
-- Name: index_run_events_on_actor_type_and_actor_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_run_events_on_actor_type_and_actor_id ON rails.run_events USING btree (actor_type, actor_id);


--
-- Name: index_run_events_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_run_events_on_external_id ON rails.run_events USING btree (external_id);


--
-- Name: index_run_events_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_run_events_on_run_id ON rails.run_events USING btree (run_id);


--
-- Name: index_run_events_on_target_type_and_target_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_run_events_on_target_type_and_target_id ON rails.run_events USING btree (target_type, target_id);


--
-- Name: index_run_trigger_snapshots_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_run_trigger_snapshots_on_external_id ON rails.run_trigger_snapshots USING btree (external_id);


--
-- Name: index_run_trigger_snapshots_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_run_trigger_snapshots_on_run_id ON rails.run_trigger_snapshots USING btree (run_id);


--
-- Name: index_run_triggers_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_run_triggers_on_external_id ON rails.run_triggers USING btree (external_id);


--
-- Name: index_run_triggers_on_sourceable_id_and_sourceable_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_run_triggers_on_sourceable_id_and_sourceable_type ON rails.run_triggers USING btree (sourceable_id, sourceable_type);


--
-- Name: index_run_triggers_on_workspace_and_sourceable; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_run_triggers_on_workspace_and_sourceable ON rails.run_triggers USING btree (workspace_id, sourceable_id, sourceable_type);


--
-- Name: index_runs_on_authentication_token_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_authentication_token_id ON rails.runs USING btree (authentication_token_id);


--
-- Name: index_runs_on_canceled_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_canceled_by_id ON rails.runs USING btree (canceled_by_id);


--
-- Name: index_runs_on_configuration_version_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_configuration_version_id ON rails.runs USING btree (configuration_version_id);


--
-- Name: index_runs_on_confirmed_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_confirmed_by_id ON rails.runs USING btree (confirmed_by_id);


--
-- Name: index_runs_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_created_by_id ON rails.runs USING btree (created_by_id);


--
-- Name: index_runs_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_runs_on_external_id ON rails.runs USING btree (external_id);


--
-- Name: index_runs_on_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_id ON rails.runs USING btree (id) WHERE (status = ANY (ARRAY['pending'::text, 'plan_queued'::text, 'confirmed'::text, 'apply_queued'::text]));


--
-- Name: index_runs_on_input_state_version_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_input_state_version_id ON rails.runs USING btree (input_state_version_id);


--
-- Name: index_runs_on_trace_resource_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_trace_resource_id ON rails.runs USING btree (trace_resource_id);


--
-- Name: index_runs_on_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_on_workspace_id ON rails.runs USING btree (workspace_id);


--
-- Name: index_runs_where_status_confirmed; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_where_status_confirmed ON rails.runs USING btree (id) WHERE (status = 'confirmed'::text);


--
-- Name: index_runs_where_status_pending; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_where_status_pending ON rails.runs USING btree (id) WHERE (status = 'pending'::text);


--
-- Name: index_runs_where_status_planning_or_applying; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_runs_where_status_planning_or_applying ON rails.runs USING btree (id) WHERE (status = ANY (ARRAY['planning'::text, 'applying'::text]));


--
-- Name: index_sessions_on_key; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_sessions_on_key ON rails.sessions USING btree (key);


--
-- Name: index_sessions_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_sessions_on_user_id ON rails.sessions USING btree (user_id);


--
-- Name: index_setting_storage_postgres_on_key; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_setting_storage_postgres_on_key ON rails.setting_storage_postgres USING btree (key);


--
-- Name: index_ssh_keys_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_ssh_keys_on_external_id ON rails.ssh_keys USING btree (external_id);


--
-- Name: index_ssh_keys_on_ssh_keyable_type_and_ssh_keyable_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_ssh_keys_on_ssh_keyable_type_and_ssh_keyable_id ON rails.ssh_keys USING btree (ssh_keyable_type, ssh_keyable_id);


--
-- Name: index_state_version_outputs_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_state_version_outputs_on_external_id ON rails.state_version_outputs USING btree (external_id);


--
-- Name: index_state_version_outputs_on_state_version_id_and_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_state_version_outputs_on_state_version_id_and_name ON rails.state_version_outputs USING btree (state_version_id, name);


--
-- Name: index_state_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_state_versions_on_external_id ON rails.state_versions USING btree (external_id);


--
-- Name: index_state_versions_on_operation_type_and_operation_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_state_versions_on_operation_type_and_operation_id ON rails.state_versions USING btree (operation_type, operation_id);


--
-- Name: index_state_versions_on_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_state_versions_on_run_id ON rails.state_versions USING btree (run_id);


--
-- Name: index_state_versions_on_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_state_versions_on_workspace_id ON rails.state_versions USING btree (workspace_id);


--
-- Name: index_stored_traces_on_request_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_stored_traces_on_request_id ON rails.stored_traces USING btree (request_id);


--
-- Name: index_stored_traces_on_resource_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_stored_traces_on_resource_id ON rails.stored_traces USING btree (resource_id);


--
-- Name: index_stored_traces_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_stored_traces_on_user_id ON rails.stored_traces USING btree (user_id);


--
-- Name: index_subscription_uniq_next_subscription_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_subscription_uniq_next_subscription_id ON rails.subscriptions USING btree (next_subscription_id);


--
-- Name: index_subscription_uniq_organization_where_active; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_subscription_uniq_organization_where_active ON rails.subscriptions USING btree (organization_id) WHERE (active = true);


--
-- Name: index_subscriptions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_subscriptions_on_external_id ON rails.subscriptions USING btree (external_id);


--
-- Name: index_subscriptions_on_feature_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_subscriptions_on_feature_set_id ON rails.subscriptions USING btree (feature_set_id);


--
-- Name: index_subscriptions_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_subscriptions_on_organization_id ON rails.subscriptions USING btree (organization_id);


--
-- Name: index_team_workspaces_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_team_workspaces_on_external_id ON rails.team_workspaces USING btree (external_id);


--
-- Name: index_team_workspaces_on_team_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_team_workspaces_on_team_id ON rails.team_workspaces USING btree (team_id);


--
-- Name: index_team_workspaces_on_team_id_and_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_team_workspaces_on_team_id_and_workspace_id ON rails.team_workspaces USING btree (team_id, workspace_id);


--
-- Name: index_team_workspaces_on_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_team_workspaces_on_workspace_id ON rails.team_workspaces USING btree (workspace_id);


--
-- Name: index_teams_on_api_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_teams_on_api_user_id ON rails.teams USING btree (api_user_id);


--
-- Name: index_teams_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_teams_on_external_id ON rails.teams USING btree (external_id);


--
-- Name: index_teams_on_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_teams_on_name ON rails.teams USING btree (name);


--
-- Name: index_teams_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_teams_on_organization_id ON rails.teams USING btree (organization_id);


--
-- Name: index_teams_on_organization_id_and_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_teams_on_organization_id_and_name ON rails.teams USING btree (organization_id, name);


--
-- Name: index_teams_on_organization_id_lower_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_teams_on_organization_id_lower_name ON rails.teams USING btree (organization_id, lower((name)::text));


--
-- Name: index_tool_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_tool_versions_on_external_id ON rails.tool_versions USING btree (external_id);


--
-- Name: index_tool_versions_on_position; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_tool_versions_on_position ON rails.tool_versions USING btree ("position");


--
-- Name: index_tool_versions_on_tool_and_version; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_tool_versions_on_tool_and_version ON rails.tool_versions USING btree (tool, version);


--
-- Name: index_users_on_email; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_email ON rails.users USING btree (email);


--
-- Name: index_users_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_external_id ON rails.users USING btree (external_id);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON rails.users USING btree (invitation_token);


--
-- Name: index_users_on_lower_username; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_lower_username ON rails.users USING btree (lower((username)::text));


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON rails.users USING btree (reset_password_token);


--
-- Name: index_users_on_two_factor_enabled_at; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_users_on_two_factor_enabled_at ON rails.users USING btree (two_factor_enabled_at);


--
-- Name: index_users_on_two_factor_verified_at; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_users_on_two_factor_verified_at ON rails.users USING btree (two_factor_verified_at);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON rails.users USING btree (unlock_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_users_on_username ON rails.users USING btree (username);


--
-- Name: index_vars_on_configurable_id_and_configurable_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vars_on_configurable_id_and_configurable_type ON rails.vars USING btree (configurable_id, configurable_type);


--
-- Name: index_vars_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_vars_on_external_id ON rails.vars USING btree (external_id);


--
-- Name: index_vars_on_variable_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vars_on_variable_set_id ON rails.vars USING btree (variable_set_id);


--
-- Name: index_vcs_hosts_on_github_app_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_hosts_on_github_app_id ON rails.vcs_hosts USING btree (github_app_id);


--
-- Name: index_vcs_repos_on_created_by_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_created_by_id ON rails.vcs_repos USING btree (created_by_id);


--
-- Name: index_vcs_repos_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_vcs_repos_on_external_id ON rails.vcs_repos USING btree (external_id);


--
-- Name: index_vcs_repos_on_github_app_installation_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_github_app_installation_id ON rails.vcs_repos USING btree (github_app_installation_id);


--
-- Name: index_vcs_repos_on_oauth_token_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_oauth_token_id ON rails.vcs_repos USING btree (oauth_token_id);


--
-- Name: index_vcs_repos_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_organization_id ON rails.vcs_repos USING btree (organization_id);


--
-- Name: index_vcs_repos_on_ssh_key_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_ssh_key_id ON rails.vcs_repos USING btree (ssh_key_id);


--
-- Name: index_vcs_repos_on_vcs_host_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_vcs_repos_on_vcs_host_id ON rails.vcs_repos USING btree (vcs_host_id);


--
-- Name: index_webhook_payloads_on_vcs_repo_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_webhook_payloads_on_vcs_repo_id ON rails.webhook_payloads USING btree (vcs_repo_id);


--
-- Name: index_workspace_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspace_comments_on_commentable_type_and_commentable_id ON rails.workspace_comments USING btree (commentable_type, commentable_id);


--
-- Name: index_workspace_comments_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_workspace_comments_on_external_id ON rails.workspace_comments USING btree (external_id);


--
-- Name: index_workspace_comments_on_run_event_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspace_comments_on_run_event_id ON rails.workspace_comments USING btree (run_event_id);


--
-- Name: index_workspace_comments_on_user_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspace_comments_on_user_id ON rails.workspace_comments USING btree (user_id);


--
-- Name: index_workspace_configuration_versions_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_workspace_configuration_versions_on_external_id ON rails.workspace_configuration_versions USING btree (external_id);


--
-- Name: index_workspace_configuration_versions_on_workspace_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspace_configuration_versions_on_workspace_id ON rails.workspace_configuration_versions USING btree (workspace_id);


--
-- Name: index_workspaces_on_auto_destroy_at; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_auto_destroy_at ON rails.workspaces USING btree (auto_destroy_at);


--
-- Name: index_workspaces_on_current_run_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_current_run_id ON rails.workspaces USING btree (current_run_id);


--
-- Name: index_workspaces_on_current_state_version_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_current_state_version_id ON rails.workspaces USING btree (current_state_version_id);


--
-- Name: index_workspaces_on_external_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX index_workspaces_on_external_id ON rails.workspaces USING btree (external_id);


--
-- Name: index_workspaces_on_locked_by_id_and_locked_by_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_locked_by_id_and_locked_by_type ON rails.workspaces USING btree (locked_by_id, locked_by_type);


--
-- Name: index_workspaces_on_name; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_name ON rails.workspaces USING btree (name);


--
-- Name: index_workspaces_on_organization_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_organization_id ON rails.workspaces USING btree (organization_id);


--
-- Name: index_workspaces_on_ssh_key_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_ssh_key_id ON rails.workspaces USING btree (ssh_key_id);


--
-- Name: index_workspaces_on_trace_resource_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_trace_resource_id ON rails.workspaces USING btree (trace_resource_id);


--
-- Name: index_workspaces_on_variable_set_id; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX index_workspaces_on_variable_set_id ON rails.workspaces USING btree (variable_set_id);


--
-- Name: ingressable; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX ingressable ON rails.ingress_attributes USING btree (ingress_attributable_type, ingress_attributable_id);


--
-- Name: oauth_clientable_id_and_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX oauth_clientable_id_and_type ON rails.o_auth_clients USING btree (oauth_clientable_type, oauth_clientable_id);


--
-- Name: oauth_tokenable_id_and_type; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE INDEX oauth_tokenable_id_and_type ON rails.o_auth_tokens USING btree (oauth_tokenable_type, oauth_tokenable_id);


--
-- Name: uniq_future_subscription_for_organization; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX uniq_future_subscription_for_organization ON rails.subscriptions USING btree (organization_id) WHERE ((active = false) AND (end_at IS NULL));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: rails; Owner: hashicorp
--

CREATE UNIQUE INDEX unique_schema_migrations ON rails.schema_migrations USING btree (version);


--
-- Name: idx_gpg_keys_key_id_namespace; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_gpg_keys_key_id_namespace ON registry.gpg_keys USING btree (key_id, namespace);


--
-- Name: idx_last_modified_times_entity; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_last_modified_times_entity ON registry.last_modified_times USING btree (entity);


--
-- Name: idx_logprocessor_files_complete; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_logprocessor_files_complete ON registry.logprocessor_files_complete USING btree (bucket, file_name);


--
-- Name: idx_module_deps_module_submodule; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_deps_module_submodule ON registry.module_deps USING btree (module_submodule_id);


--
-- Name: idx_module_outputs_module_submodule; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_outputs_module_submodule ON registry.module_outputs USING btree (module_submodule_id);


--
-- Name: idx_module_provider_deps_module_submodule; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_module_provider_deps_module_submodule ON registry.module_provider_deps USING btree (module_submodule_id, provider);


--
-- Name: idx_module_providers_module; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_providers_module ON registry.module_providers USING btree (module_id);


--
-- Name: idx_module_resources_module_submodule; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_resources_module_submodule ON registry.module_resources USING btree (module_submodule_id);


--
-- Name: idx_module_submodules_module_version; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_submodules_module_version ON registry.module_submodules USING btree (module_version_id);


--
-- Name: idx_module_variables_module_submodule; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_variables_module_submodule ON registry.module_variables USING btree (module_submodule_id);


--
-- Name: idx_module_version_unique; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_module_version_unique ON registry.module_versions USING btree (module_provider_id, version);


--
-- Name: idx_module_versions_module_provider; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_module_versions_module_provider ON registry.module_versions USING btree (module_provider_id);


--
-- Name: idx_modules_user; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_modules_user ON registry.modules USING btree (user_id);


--
-- Name: idx_modules_verified; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_modules_verified ON registry.modules USING btree (verified);


--
-- Name: idx_notifications_code_read_at_version; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_notifications_code_read_at_version ON registry.notifications USING btree (code, read_at, version);


--
-- Name: idx_notifications_resource; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_notifications_resource ON registry.notifications USING btree (resource_type, resource_id);


--
-- Name: idx_provider_platforms_provider_version; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_provider_platforms_provider_version ON registry.provider_platforms USING btree (provider_version_id);


--
-- Name: idx_provider_versions_provider; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_provider_versions_provider ON registry.provider_versions USING btree (provider_id);


--
-- Name: idx_providers_user; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE INDEX idx_providers_user ON registry.providers USING btree (user_id);


--
-- Name: idx_users_username; Type: INDEX; Schema: registry; Owner: hashicorp
--

CREATE UNIQUE INDEX idx_users_username ON registry.users USING btree (username);


--
-- Name: parent_path_idx; Type: INDEX; Schema: vault; Owner: hashicorp
--

CREATE INDEX parent_path_idx ON vault.vault_kv_store USING btree (parent_path);


--
-- Name: fk_rails_08b8507fc9; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.email_recipients
    ADD CONSTRAINT fk_rails_08b8507fc9 FOREIGN KEY (notification_configuration_id) REFERENCES rails.notification_configurations(id);


--
-- Name: fk_rails_2e66bff017; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_repos
    ADD CONSTRAINT fk_rails_2e66bff017 FOREIGN KEY (vcs_host_id) REFERENCES rails.vcs_hosts(id);


--
-- Name: fk_rails_3e604d5023; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.subscriptions
    ADD CONSTRAINT fk_rails_3e604d5023 FOREIGN KEY (feature_set_id) REFERENCES rails.feature_sets(id);


--
-- Name: fk_rails_3e6d59991e; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspaces
    ADD CONSTRAINT fk_rails_3e6d59991e FOREIGN KEY (organization_id) REFERENCES rails.organizations(id);


--
-- Name: fk_rails_41a40100ff; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_versions
    ADD CONSTRAINT fk_rails_41a40100ff FOREIGN KEY (workspace_id) REFERENCES rails.workspaces(id);


--
-- Name: fk_rails_425d0d7dc7; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.teams
    ADD CONSTRAINT fk_rails_425d0d7dc7 FOREIGN KEY (api_user_id) REFERENCES rails.users(id);


--
-- Name: fk_rails_4eb720d97a; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_triggers
    ADD CONSTRAINT fk_rails_4eb720d97a FOREIGN KEY (vcs_repo_id) REFERENCES rails.vcs_repos(id);


--
-- Name: fk_rails_56ad32a20c; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_triggers
    ADD CONSTRAINT fk_rails_56ad32a20c FOREIGN KEY (workspace_id) REFERENCES rails.workspaces(id);


--
-- Name: fk_rails_5ac34def6b; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_repos
    ADD CONSTRAINT fk_rails_5ac34def6b FOREIGN KEY (github_app_installation_id) REFERENCES rails.github_app_installations(id);


--
-- Name: fk_rails_603b395535; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.plans
    ADD CONSTRAINT fk_rails_603b395535 FOREIGN KEY (run_id) REFERENCES rails.runs(id);


--
-- Name: fk_rails_6506b9726f; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_configuration_versions
    ADD CONSTRAINT fk_rails_6506b9726f FOREIGN KEY (workspace_id) REFERENCES rails.workspaces(id);


--
-- Name: fk_rails_769f552b68; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.configuration_versions
    ADD CONSTRAINT fk_rails_769f552b68 FOREIGN KEY (vcs_repo_id) REFERENCES rails.vcs_repos(id);


--
-- Name: fk_rails_7bb70024a1; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.email_recipients
    ADD CONSTRAINT fk_rails_7bb70024a1 FOREIGN KEY (user_id) REFERENCES rails.users(id);


--
-- Name: fk_rails_7f5da56894; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.team_workspaces
    ADD CONSTRAINT fk_rails_7f5da56894 FOREIGN KEY (team_id) REFERENCES rails.teams(id);


--
-- Name: fk_rails_8471abad75; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_users
    ADD CONSTRAINT fk_rails_8471abad75 FOREIGN KEY (organization_id) REFERENCES rails.organizations(id);


--
-- Name: fk_rails_89bbc625dc; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_hosts
    ADD CONSTRAINT fk_rails_89bbc625dc FOREIGN KEY (github_app_id) REFERENCES rails.github_app_apps(id);


--
-- Name: fk_rails_8d9b20725d; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organization_users
    ADD CONSTRAINT fk_rails_8d9b20725d FOREIGN KEY (user_id) REFERENCES rails.users(id);


--
-- Name: fk_rails_8e9e115f5f; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.run_events
    ADD CONSTRAINT fk_rails_8e9e115f5f FOREIGN KEY (run_id) REFERENCES rails.runs(id);


--
-- Name: fk_rails_99b58aaf00; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_oauth_tokens
    ADD CONSTRAINT fk_rails_99b58aaf00 FOREIGN KEY (app_id) REFERENCES rails.github_app_apps(id);


--
-- Name: fk_rails_9b984c03b2; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.vcs_repos
    ADD CONSTRAINT fk_rails_9b984c03b2 FOREIGN KEY (organization_id) REFERENCES rails.organizations(id);


--
-- Name: fk_rails_ac7405301c; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.memberships
    ADD CONSTRAINT fk_rails_ac7405301c FOREIGN KEY (organization_user_id) REFERENCES rails.organization_users(id);


--
-- Name: fk_rails_b0219cfa87; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.ingress_attributes
    ADD CONSTRAINT fk_rails_b0219cfa87 FOREIGN KEY (webhook_payload_id) REFERENCES rails.webhook_payloads(id);


--
-- Name: fk_rails_b213b82af9; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_installations
    ADD CONSTRAINT fk_rails_b213b82af9 FOREIGN KEY (app_id) REFERENCES rails.github_app_apps(id);


--
-- Name: fk_rails_b21f6c07a7; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.state_versions
    ADD CONSTRAINT fk_rails_b21f6c07a7 FOREIGN KEY (run_id) REFERENCES rails.runs(id);


--
-- Name: fk_rails_d2963d3c7e; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.team_workspaces
    ADD CONSTRAINT fk_rails_d2963d3c7e FOREIGN KEY (workspace_id) REFERENCES rails.workspaces(id);


--
-- Name: fk_rails_d3145903eb; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspace_configuration_versions
    ADD CONSTRAINT fk_rails_d3145903eb FOREIGN KEY (configuration_version_id) REFERENCES rails.configuration_versions(id);


--
-- Name: fk_rails_de8333073d; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.github_app_oauth_tokens
    ADD CONSTRAINT fk_rails_de8333073d FOREIGN KEY (user_id) REFERENCES rails.users(id);


--
-- Name: fk_rails_edec76c076; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.organizations
    ADD CONSTRAINT fk_rails_edec76c076 FOREIGN KEY (created_by_id) REFERENCES rails.users(id);


--
-- Name: fk_rails_f52db258a4; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.applies
    ADD CONSTRAINT fk_rails_f52db258a4 FOREIGN KEY (run_id) REFERENCES rails.runs(id);


--
-- Name: fk_rails_fa65302f73; Type: FK CONSTRAINT; Schema: rails; Owner: hashicorp
--

ALTER TABLE ONLY rails.workspaces
    ADD CONSTRAINT fk_rails_fa65302f73 FOREIGN KEY (ssh_key_id) REFERENCES rails.ssh_keys(id);


--
-- Name: module_deps_module_submodule_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_deps
    ADD CONSTRAINT module_deps_module_submodule_id_fkey FOREIGN KEY (module_submodule_id) REFERENCES registry.module_submodules(id) ON DELETE CASCADE;


--
-- Name: module_outputs_module_submodule_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_outputs
    ADD CONSTRAINT module_outputs_module_submodule_id_fkey FOREIGN KEY (module_submodule_id) REFERENCES registry.module_submodules(id) ON DELETE CASCADE;


--
-- Name: module_provider_deps_module_submodule_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_provider_deps
    ADD CONSTRAINT module_provider_deps_module_submodule_id_fkey FOREIGN KEY (module_submodule_id) REFERENCES registry.module_submodules(id) ON DELETE CASCADE;


--
-- Name: module_provider_deps_provider_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_provider_deps
    ADD CONSTRAINT module_provider_deps_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES registry.providers(id) ON DELETE SET NULL;


--
-- Name: module_providers_module_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_providers
    ADD CONSTRAINT module_providers_module_id_fkey FOREIGN KEY (module_id) REFERENCES registry.modules(id) ON DELETE CASCADE;


--
-- Name: module_resources_module_submodule_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_resources
    ADD CONSTRAINT module_resources_module_submodule_id_fkey FOREIGN KEY (module_submodule_id) REFERENCES registry.module_submodules(id) ON DELETE CASCADE;


--
-- Name: module_submodules_module_version_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_submodules
    ADD CONSTRAINT module_submodules_module_version_id_fkey FOREIGN KEY (module_version_id) REFERENCES registry.module_versions(id) ON DELETE CASCADE;


--
-- Name: module_variables_module_submodule_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_variables
    ADD CONSTRAINT module_variables_module_submodule_id_fkey FOREIGN KEY (module_submodule_id) REFERENCES registry.module_submodules(id) ON DELETE CASCADE;


--
-- Name: module_versions_module_provider_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.module_versions
    ADD CONSTRAINT module_versions_module_provider_id_fkey FOREIGN KEY (module_provider_id) REFERENCES registry.module_providers(id) ON DELETE CASCADE;


--
-- Name: provider_docs_provider_version_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_docs
    ADD CONSTRAINT provider_docs_provider_version_id_fkey FOREIGN KEY (provider_version_id) REFERENCES registry.provider_versions(id) ON DELETE CASCADE;


--
-- Name: provider_platforms_provider_version_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_platforms
    ADD CONSTRAINT provider_platforms_provider_version_id_fkey FOREIGN KEY (provider_version_id) REFERENCES registry.provider_versions(id) ON DELETE CASCADE;


--
-- Name: provider_versions_provider_id_fkey; Type: FK CONSTRAINT; Schema: registry; Owner: hashicorp
--

ALTER TABLE ONLY registry.provider_versions
    ADD CONSTRAINT provider_versions_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES registry.providers(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: album_models; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE album_models (
    id bigint NOT NULL,
    album_id bigint,
    model_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: album_models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE album_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: album_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE album_models_id_seq OWNED BY album_models.id;


--
-- Name: albums; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE albums (
    id bigint NOT NULL,
    site_id bigint,
    artist_id bigint,
    title character varying,
    url character varying,
    cover_url character varying,
    photos integer,
    photo_url_template character varying,
    date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE albums_id_seq OWNED BY albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: artists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE artists (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE models (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: site_models; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE site_models (
    id bigint NOT NULL,
    site_id bigint NOT NULL,
    model_id bigint NOT NULL,
    nickname character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: site_models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE site_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE site_models_id_seq OWNED BY site_models.id;


--
-- Name: sites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sites (
    id bigint NOT NULL,
    title character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY album_models ALTER COLUMN id SET DEFAULT nextval('album_models_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY albums ALTER COLUMN id SET DEFAULT nextval('albums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY site_models ALTER COLUMN id SET DEFAULT nextval('site_models_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: album_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY album_models
    ADD CONSTRAINT album_models_pkey PRIMARY KEY (id);


--
-- Name: albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: models_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: site_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_models
    ADD CONSTRAINT site_models_pkey PRIMARY KEY (id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: index_album_models_on_album_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_album_models_on_album_id ON album_models USING btree (album_id);


--
-- Name: index_album_models_on_model_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_album_models_on_model_id ON album_models USING btree (model_id);


--
-- Name: index_albums_on_artist_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_albums_on_artist_id ON albums USING btree (artist_id);


--
-- Name: index_albums_on_site_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_albums_on_site_id ON albums USING btree (site_id);


--
-- Name: index_site_models_on_model_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_site_models_on_model_id ON site_models USING btree (model_id);


--
-- Name: index_site_models_on_site_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_site_models_on_site_id ON site_models USING btree (site_id);


--
-- Name: fk_rails_124a79559a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_124a79559a FOREIGN KEY (artist_id) REFERENCES artists(id);


--
-- Name: fk_rails_57ce923362; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_57ce923362 FOREIGN KEY (site_id) REFERENCES sites(id);


--
-- Name: fk_rails_8c979adde5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY album_models
    ADD CONSTRAINT fk_rails_8c979adde5 FOREIGN KEY (album_id) REFERENCES albums(id);


--
-- Name: fk_rails_a23da21d85; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY site_models
    ADD CONSTRAINT fk_rails_a23da21d85 FOREIGN KEY (site_id) REFERENCES sites(id);


--
-- Name: fk_rails_bd6ec565ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY album_models
    ADD CONSTRAINT fk_rails_bd6ec565ed FOREIGN KEY (model_id) REFERENCES models(id);


--
-- Name: fk_rails_cf502b0991; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY site_models
    ADD CONSTRAINT fk_rails_cf502b0991 FOREIGN KEY (model_id) REFERENCES models(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO "schema_migrations" (version) VALUES
('20170829124252'),
('20170829165330'),
('20170829165746'),
('20170829172225'),
('20170829172653'),
('20170829190355');



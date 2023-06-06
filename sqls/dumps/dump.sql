--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

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
-- Name: moonshine; Type: DATABASE; Schema: -; Owner: moonshine
--

ALTER DATABASE moonshine OWNER TO moonshine;

\connect moonshine

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
-- Name: moonshine; Type: SCHEMA; Schema: -; Owner: moonshine
--

CREATE SCHEMA moonshine;


ALTER SCHEMA moonshine OWNER TO moonshine;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bar_favorites; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bar_favorites (
    user_id integer NOT NULL,
    bar_id integer NOT NULL
);


ALTER TABLE moonshine.bar_favorites OWNER TO moonshine;

--
-- Name: bar_image_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bar_image_composition (
    bar_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE moonshine.bar_image_composition OWNER TO moonshine;

--
-- Name: bar_menu_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bar_menu_composition (
    bar_id integer NOT NULL,
    cocktail_id integer NOT NULL,
    bar_cocktail_score double precision,
    bar_cocktail_price integer
);


ALTER TABLE moonshine.bar_menu_composition OWNER TO moonshine;

--
-- Name: bar_review_menu_review; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bar_review_menu_review (
    bar_review_id integer NOT NULL,
    bar_id integer NOT NULL,
    cocktail_id integer NOT NULL,
    bar_review_menu_review_content character varying(255),
    bar_review_menu_review_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_review_menu_review_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_review_menu_review_deleted_at timestamp without time zone,
    bar_review_menu_review_deleted boolean DEFAULT false NOT NULL,
    bar_review_menu_review_raing integer NOT NULL
);


ALTER TABLE moonshine.bar_review_menu_review OWNER TO moonshine;

--
-- Name: bar_reviews; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bar_reviews (
    bar_review_id integer NOT NULL,
    bar_id integer NOT NULL,
    user_id integer NOT NULL,
    bar_review character varying(255) NOT NULL,
    bar_rating integer NOT NULL,
    bar_review_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_review_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_review_deleted_at timestamp without time zone,
    bar_review_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.bar_reviews OWNER TO moonshine;

--
-- Name: bar_reviews_bar_review_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.bar_reviews_bar_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.bar_reviews_bar_review_id_seq OWNER TO moonshine;

--
-- Name: bar_reviews_bar_review_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.bar_reviews_bar_review_id_seq OWNED BY moonshine.bar_reviews.bar_review_id;


--
-- Name: bars; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.bars (
    bar_id integer NOT NULL,
    bar_name character varying(255) NOT NULL,
    bar_address character varying(255) NOT NULL,
    bar_image integer NOT NULL,
    bar_latitude double precision NOT NULL,
    bar_longitude double precision NOT NULL,
    bar_contact character varying(30),
    bar_description character varying(255),
    bar_opening_hours character varying(255),
    bar_score double precision NOT NULL,
    bar_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bar_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.bars OWNER TO moonshine;

--
-- Name: bars_bar_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.bars_bar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.bars_bar_id_seq OWNER TO moonshine;

--
-- Name: bars_bar_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.bars_bar_id_seq OWNED BY moonshine.bars.bar_id;


--
-- Name: blog_post_bar_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_post_bar_composition (
    blog_post_id integer NOT NULL,
    bar_id integer NOT NULL
);


ALTER TABLE moonshine.blog_post_bar_composition OWNER TO moonshine;

--
-- Name: blog_post_cocktail_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_post_cocktail_composition (
    blog_post_id integer NOT NULL,
    cocktail_id integer NOT NULL
);


ALTER TABLE moonshine.blog_post_cocktail_composition OWNER TO moonshine;

--
-- Name: blog_post_comment_replies; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_post_comment_replies (
    blog_post_comment_reply_id integer NOT NULL,
    blog_post_comment_id integer NOT NULL,
    user_id integer NOT NULL,
    blog_post_comment_reply_content character varying(255) NOT NULL,
    blog_post_comment_reply_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_comment_reply_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_comment_reply_deleted_at timestamp without time zone,
    blog_post_comment_reply_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_post_comment_replies OWNER TO moonshine;

--
-- Name: blog_post_comment_replies_blog_post_comment_reply_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_post_comment_replies_blog_post_comment_reply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_post_comment_replies_blog_post_comment_reply_id_seq OWNER TO moonshine;

--
-- Name: blog_post_comment_replies_blog_post_comment_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_post_comment_replies_blog_post_comment_reply_id_seq OWNED BY moonshine.blog_post_comment_replies.blog_post_comment_reply_id;


--
-- Name: blog_post_comments; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_post_comments (
    blog_post_comment_id integer NOT NULL,
    blog_post_id integer NOT NULL,
    user_id integer NOT NULL,
    blog_post_comment_content character varying(255) NOT NULL,
    blog_post_comment_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_comment_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_comment_deleted_at timestamp without time zone,
    blog_post_comment_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_post_comments OWNER TO moonshine;

--
-- Name: blog_post_comments_blog_post_comment_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_post_comments_blog_post_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_post_comments_blog_post_comment_id_seq OWNER TO moonshine;

--
-- Name: blog_post_comments_blog_post_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_post_comments_blog_post_comment_id_seq OWNED BY moonshine.blog_post_comments.blog_post_comment_id;


--
-- Name: blog_post_image_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_post_image_composition (
    blog_post_id integer NOT NULL,
    image_id integer NOT NULL,
    blog_post_image_comment text
);


ALTER TABLE moonshine.blog_post_image_composition OWNER TO moonshine;

--
-- Name: blog_posts; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_posts (
    blog_post_id integer NOT NULL,
    blog_post_title character varying(255) NOT NULL,
    blog_post_content text NOT NULL,
    blog_post_user_id integer NOT NULL,
    blog_post_image integer NOT NULL,
    blog_post_type smallint NOT NULL,
    blog_post_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_post_deleted_at timestamp without time zone,
    blog_post_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_posts OWNER TO moonshine;

--
-- Name: blog_posts_blog_post_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_posts_blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_posts_blog_post_id_seq OWNER TO moonshine;

--
-- Name: blog_posts_blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_posts_blog_post_id_seq OWNED BY moonshine.blog_posts.blog_post_id;


--
-- Name: blog_small_post; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_small_post (
    blog_small_post_id integer NOT NULL,
    blog_small_post_content character varying(255) NOT NULL,
    blog_small_post_user_id integer NOT NULL,
    blog_small_post_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_deleted_at timestamp without time zone,
    blog_small_post_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_small_post OWNER TO moonshine;

--
-- Name: blog_small_post_blog_small_post_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_small_post_blog_small_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_small_post_blog_small_post_id_seq OWNER TO moonshine;

--
-- Name: blog_small_post_blog_small_post_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_small_post_blog_small_post_id_seq OWNED BY moonshine.blog_small_post.blog_small_post_id;


--
-- Name: blog_small_post_comment; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_small_post_comment (
    blog_small_post_comment_id integer NOT NULL,
    blog_small_post_id integer NOT NULL,
    user_id integer NOT NULL,
    blog_small_post_comment_content character varying(255) NOT NULL,
    blog_small_post_comment_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_comment_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_comment_deleted_at timestamp without time zone,
    blog_small_post_comment_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_small_post_comment OWNER TO moonshine;

--
-- Name: blog_small_post_comment_blog_small_post_comment_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_small_post_comment_blog_small_post_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_small_post_comment_blog_small_post_comment_id_seq OWNER TO moonshine;

--
-- Name: blog_small_post_comment_blog_small_post_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_small_post_comment_blog_small_post_comment_id_seq OWNED BY moonshine.blog_small_post_comment.blog_small_post_comment_id;


--
-- Name: blog_small_post_comment_reply; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_small_post_comment_reply (
    blog_small_post_comment_reply_id integer NOT NULL,
    blog_small_post_comment_id integer NOT NULL,
    user_id integer NOT NULL,
    blog_small_post_comment_reply_content character varying(255) NOT NULL,
    blog_small_post_comment_reply_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_comment_reply_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    blog_small_post_comment_reply_deleted_at timestamp without time zone,
    blog_small_post_comment_reply_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.blog_small_post_comment_reply OWNER TO moonshine;

--
-- Name: blog_small_post_comment_reply_blog_small_post_comment_reply_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.blog_small_post_comment_reply_blog_small_post_comment_reply_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.blog_small_post_comment_reply_blog_small_post_comment_reply_seq OWNER TO moonshine;

--
-- Name: blog_small_post_comment_reply_blog_small_post_comment_reply_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.blog_small_post_comment_reply_blog_small_post_comment_reply_seq OWNED BY moonshine.blog_small_post_comment_reply.blog_small_post_comment_reply_id;


--
-- Name: blog_small_post_image_compostision; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.blog_small_post_image_compostision (
    blog_small_post_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE moonshine.blog_small_post_image_compostision OWNER TO moonshine;

--
-- Name: cocktail_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.cocktail_composition (
    cocktail_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    ingredient_quantity character varying(255) NOT NULL,
    composition_id integer NOT NULL
);


ALTER TABLE moonshine.cocktail_composition OWNER TO moonshine;

--
-- Name: cocktail_composition_composition_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.cocktail_composition_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.cocktail_composition_composition_id_seq OWNER TO moonshine;

--
-- Name: cocktail_composition_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.cocktail_composition_composition_id_seq OWNED BY moonshine.cocktail_composition.composition_id;


--
-- Name: cocktail_favorites; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.cocktail_favorites (
    user_id integer NOT NULL,
    cocktail_id integer NOT NULL
);


ALTER TABLE moonshine.cocktail_favorites OWNER TO moonshine;

--
-- Name: cocktail_image_composition; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.cocktail_image_composition (
    cocktail_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE moonshine.cocktail_image_composition OWNER TO moonshine;

--
-- Name: cocktail_reviews; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.cocktail_reviews (
    cocktail_review_id integer NOT NULL,
    cocktail_id integer NOT NULL,
    user_id integer NOT NULL,
    cocktail_review character varying(255) NOT NULL,
    cocktail_rating integer NOT NULL,
    cocktail_review_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cocktail_review_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cocktail_review_deleted_at timestamp without time zone,
    cocktail_review_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.cocktail_reviews OWNER TO moonshine;

--
-- Name: cocktail_reviews_cocktail_review_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.cocktail_reviews_cocktail_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.cocktail_reviews_cocktail_review_id_seq OWNER TO moonshine;

--
-- Name: cocktail_reviews_cocktail_review_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.cocktail_reviews_cocktail_review_id_seq OWNED BY moonshine.cocktail_reviews.cocktail_review_id;


--
-- Name: cocktails; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.cocktails (
    cocktail_id integer NOT NULL,
    cocktail_name character varying(255) NOT NULL,
    cocktail_description character varying(255),
    cocktail_image integer,
    cocktail_alcoholic boolean DEFAULT true NOT NULL,
    cocktail_instructions text NOT NULL,
    cocktail_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cocktail_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cocktail_deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cocktail_deleted boolean DEFAULT false NOT NULL,
    cocktail_signiture boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.cocktails OWNER TO moonshine;

--
-- Name: cocktails_cocktail_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.cocktails_cocktail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.cocktails_cocktail_id_seq OWNER TO moonshine;

--
-- Name: cocktails_cocktail_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.cocktails_cocktail_id_seq OWNED BY moonshine.cocktails.cocktail_id;


--
-- Name: image; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.image (
    image_id integer NOT NULL,
    image_path text NOT NULL,
    image_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    image_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    image_deleted_at timestamp without time zone,
    image_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.image OWNER TO moonshine;

--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.image_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.image_image_id_seq OWNER TO moonshine;

--
-- Name: image_image_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.image_image_id_seq OWNED BY moonshine.image.image_id;


--
-- Name: ingredient; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.ingredient (
    ingredient_id integer NOT NULL,
    ingredient_name character varying(255) NOT NULL,
    ingredient_description character varying(255)
);


ALTER TABLE moonshine.ingredient OWNER TO moonshine;

--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.ingredient_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.ingredient_ingredient_id_seq OWNER TO moonshine;

--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.ingredient_ingredient_id_seq OWNED BY moonshine.ingredient.ingredient_id;


--
-- Name: message; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.message (
    message_id integer NOT NULL,
    message_content character varying(255) NOT NULL,
    message_receiver_id integer NOT NULL,
    message_sender_id integer NOT NULL,
    message_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    message_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    message_deleted_at timestamp without time zone,
    message_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.message OWNER TO moonshine;

--
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.message_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.message_message_id_seq OWNER TO moonshine;

--
-- Name: message_message_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.message_message_id_seq OWNED BY moonshine.message.message_id;


--
-- Name: users; Type: TABLE; Schema: moonshine; Owner: moonshine
--

CREATE TABLE moonshine.users (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    user_email character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_profile_picture integer,
    user_created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE moonshine.users OWNER TO moonshine;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: moonshine; Owner: moonshine
--

CREATE SEQUENCE moonshine.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moonshine.users_user_id_seq OWNER TO moonshine;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: moonshine; Owner: moonshine
--

ALTER SEQUENCE moonshine.users_user_id_seq OWNED BY moonshine.users.user_id;


--
-- Name: bar_reviews bar_review_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_reviews ALTER COLUMN bar_review_id SET DEFAULT nextval('moonshine.bar_reviews_bar_review_id_seq'::regclass);


--
-- Name: bars bar_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bars ALTER COLUMN bar_id SET DEFAULT nextval('moonshine.bars_bar_id_seq'::regclass);


--
-- Name: blog_post_comment_replies blog_post_comment_reply_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comment_replies ALTER COLUMN blog_post_comment_reply_id SET DEFAULT nextval('moonshine.blog_post_comment_replies_blog_post_comment_reply_id_seq'::regclass);


--
-- Name: blog_post_comments blog_post_comment_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comments ALTER COLUMN blog_post_comment_id SET DEFAULT nextval('moonshine.blog_post_comments_blog_post_comment_id_seq'::regclass);


--
-- Name: blog_posts blog_post_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_posts ALTER COLUMN blog_post_id SET DEFAULT nextval('moonshine.blog_posts_blog_post_id_seq'::regclass);


--
-- Name: blog_small_post blog_small_post_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post ALTER COLUMN blog_small_post_id SET DEFAULT nextval('moonshine.blog_small_post_blog_small_post_id_seq'::regclass);


--
-- Name: blog_small_post_comment blog_small_post_comment_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment ALTER COLUMN blog_small_post_comment_id SET DEFAULT nextval('moonshine.blog_small_post_comment_blog_small_post_comment_id_seq'::regclass);


--
-- Name: blog_small_post_comment_reply blog_small_post_comment_reply_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment_reply ALTER COLUMN blog_small_post_comment_reply_id SET DEFAULT nextval('moonshine.blog_small_post_comment_reply_blog_small_post_comment_reply_seq'::regclass);


--
-- Name: cocktail_composition composition_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_composition ALTER COLUMN composition_id SET DEFAULT nextval('moonshine.cocktail_composition_composition_id_seq'::regclass);


--
-- Name: cocktail_reviews cocktail_review_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_reviews ALTER COLUMN cocktail_review_id SET DEFAULT nextval('moonshine.cocktail_reviews_cocktail_review_id_seq'::regclass);


--
-- Name: cocktails cocktail_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktails ALTER COLUMN cocktail_id SET DEFAULT nextval('moonshine.cocktails_cocktail_id_seq'::regclass);


--
-- Name: image image_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.image ALTER COLUMN image_id SET DEFAULT nextval('moonshine.image_image_id_seq'::regclass);


--
-- Name: ingredient ingredient_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('moonshine.ingredient_ingredient_id_seq'::regclass);


--
-- Name: message message_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.message ALTER COLUMN message_id SET DEFAULT nextval('moonshine.message_message_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.users ALTER COLUMN user_id SET DEFAULT nextval('moonshine.users_user_id_seq'::regclass);


--
-- Data for Name: bar_favorites; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bar_favorites (user_id, bar_id) FROM stdin;
\.


--
-- Data for Name: bar_image_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bar_image_composition (bar_id, image_id) FROM stdin;
\.


--
-- Data for Name: bar_menu_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bar_menu_composition (bar_id, cocktail_id, bar_cocktail_score, bar_cocktail_price) FROM stdin;
1	116	\N	5000
1	337	\N	5000
1	376	\N	5000
1	419	\N	5000
1	378	\N	7000
1	379	\N	7000
1	380	\N	7000
1	377	\N	7000
1	382	\N	7000
1	383	\N	7000
1	375	\N	7000
1	384	\N	7000
1	385	\N	7000
1	397	\N	7000
1	398	\N	7000
1	399	\N	7000
1	320	\N	7000
1	400	\N	7000
1	401	\N	7000
1	334	\N	7000
1	344	\N	8000
1	402	\N	8000
1	407	\N	8000
1	403	\N	8000
1	406	\N	8000
1	404	\N	8000
1	405	\N	8000
1	408	\N	9000
1	193	\N	9000
1	412	\N	9000
1	196	\N	9000
1	409	\N	9000
1	191	\N	9000
1	410	\N	9000
1	411	\N	9000
1	115	\N	9000
1	413	\N	9000
1	219	\N	9000
1	414	\N	9000
1	237	\N	9000
1	415	\N	10000
1	416	\N	10000
1	417	\N	10000
1	381	\N	9000
1	418	\N	8000
\.


--
-- Data for Name: bar_review_menu_review; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bar_review_menu_review (bar_review_id, bar_id, cocktail_id, bar_review_menu_review_content, bar_review_menu_review_created_at, bar_review_menu_review_updated_at, bar_review_menu_review_deleted_at, bar_review_menu_review_deleted, bar_review_menu_review_raing) FROM stdin;
\.


--
-- Data for Name: bar_reviews; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bar_reviews (bar_review_id, bar_id, user_id, bar_review, bar_rating, bar_review_created_at, bar_review_updated_at, bar_review_deleted_at, bar_review_deleted) FROM stdin;
\.


--
-- Data for Name: bars; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.bars (bar_id, bar_name, bar_address, bar_image, bar_latitude, bar_longitude, bar_contact, bar_description, bar_opening_hours, bar_score, bar_created_at, bar_updated_at, bar_deleted_at, bar_deleted) FROM stdin;
1	Liverpool Pub	서울 동작구 흑석로 101-10 1층 리버풀펍	481	37.508124	126.960836	0507-1332-4885	흑석역 4번출구에서 나와 직진50m 건널목 건넌후 좌회전 300m에 위치하고 있습니다.\n151번 기점 , 흑석마을버스 1번 안동장 바로옆건물입니다.\n중앙대학교 병원 정문 대각선 맞은편에 위치하고 있습니다.	매일 18:00 - 03:00	4.65	2023-06-05 17:22:47.091055	2023-06-05 17:22:47.091055	2023-06-05 17:22:47.091055	f
\.


--
-- Data for Name: blog_post_bar_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_post_bar_composition (blog_post_id, bar_id) FROM stdin;
\.


--
-- Data for Name: blog_post_cocktail_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_post_cocktail_composition (blog_post_id, cocktail_id) FROM stdin;
\.


--
-- Data for Name: blog_post_comment_replies; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_post_comment_replies (blog_post_comment_reply_id, blog_post_comment_id, user_id, blog_post_comment_reply_content, blog_post_comment_reply_created_at, blog_post_comment_reply_updated_at, blog_post_comment_reply_deleted_at, blog_post_comment_reply_deleted) FROM stdin;
\.


--
-- Data for Name: blog_post_comments; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_post_comments (blog_post_comment_id, blog_post_id, user_id, blog_post_comment_content, blog_post_comment_created_at, blog_post_comment_updated_at, blog_post_comment_deleted_at, blog_post_comment_deleted) FROM stdin;
\.


--
-- Data for Name: blog_post_image_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_post_image_composition (blog_post_id, image_id, blog_post_image_comment) FROM stdin;
\.


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_posts (blog_post_id, blog_post_title, blog_post_content, blog_post_user_id, blog_post_image, blog_post_type, blog_post_created_at, blog_post_updated_at, blog_post_deleted_at, blog_post_deleted) FROM stdin;
\.


--
-- Data for Name: blog_small_post; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_small_post (blog_small_post_id, blog_small_post_content, blog_small_post_user_id, blog_small_post_created_at, blog_small_post_updated_at, blog_small_post_deleted_at, blog_small_post_deleted) FROM stdin;
\.


--
-- Data for Name: blog_small_post_comment; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_small_post_comment (blog_small_post_comment_id, blog_small_post_id, user_id, blog_small_post_comment_content, blog_small_post_comment_created_at, blog_small_post_comment_updated_at, blog_small_post_comment_deleted_at, blog_small_post_comment_deleted) FROM stdin;
\.


--
-- Data for Name: blog_small_post_comment_reply; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_small_post_comment_reply (blog_small_post_comment_reply_id, blog_small_post_comment_id, user_id, blog_small_post_comment_reply_content, blog_small_post_comment_reply_created_at, blog_small_post_comment_reply_updated_at, blog_small_post_comment_reply_deleted_at, blog_small_post_comment_reply_deleted) FROM stdin;
\.


--
-- Data for Name: blog_small_post_image_compostision; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.blog_small_post_image_compostision (blog_small_post_id, image_id) FROM stdin;
\.


--
-- Data for Name: cocktail_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.cocktail_composition (cocktail_id, ingredient_id, ingredient_quantity, composition_id) FROM stdin;
1	3	1 3/4 shot 	1
1	101	1 Shot 	2
1	36	1/8 Shot	4
2	16	1/3 	5
2	103	1/3 	6
2	44	1/3 	7
3	3	2 shots 	8
3	36	1/2 shot 	9
3	64	1/2 shot 	10
3	50	1/2 shot	11
3	104	1/2 Fresh	12
4	105	1 oz Bacardi 	13
4	106	1 oz 	14
5	4	2 oz 	15
5	48	1 oz 	16
5	36	1 tsp 	17
6	107	1 oz 	18
6	3	1 oz 	19
6	108	4 oz 	20
7	2	1 1/2 oz 	21
7	41	1 oz 	22
8	109	4 cl 	23
8	41	3 cl 	24
8	46	1 cl 	25
8	110	1 	26
9	6	2 oz 	27
9	109	2 oz 	28
9	78	2 oz 	29
10	4	1 1/2 oz 	30
10	82	2 oz 	31
10	109	3 oz 	32
11	4	2 oz 	33
11	26	1 oz 	34
11	111	1 	35
12	3	1 1/2 shot 	36
12	112	1 1/2 shot 	37
13	2	1 oz 	38
13	9	1 oz 	39
13	48	1 oz 	40
14	1	1 1/2 oz 	41
14	9	1 1/2 tsp 	42
14	30	1 tblsp 	43
14	25	1 tsp 	44
14	111	1 	45
14	113	1 	46
15	7	1 1/2 oz 	47
15	5	1 oz 	48
15	15	1 oz 	49
15	11	2 dashes 	50
16	3	4.5 cl	51
16	114	1.5 cl	52
16	115	1.5 cl	53
17	22	2 cl 	54
17	116	1 cl 	55
18	117	1 oz 	56
18	93	1/2 oz 	57
18	118	2 oz 	58
19	36	1 part 	59
19	109	4 parts 	60
19	47	4 parts 	61
20	26	1 cl 	62
20	103	1 cl 	63
20	119	1 1/2 	64
20	68	4 cl hot 	65
21	3	1/2 oz 	66
21	35	1/2 oz white 	67
21	120	2 oz 	68
22	22	4 cl 	69
22	30	1 dash 	70
23	15	1 oz 	71
23	20	1 oz 	72
23	98	1 1/2 tsp 	73
23	48	1 1/2 tsp 	74
23	121	1 twist of 	75
24	122	1 oz 	76
24	5	1 oz red 	77
24	121	Twist of 	78
24	123	Twist of 	79
25	103	1/3 	80
25	101	1/3 	81
25	26	1/4 	82
26	26	1/3 shot 	83
26	94	1/3 shot 	84
26	101	1/3 shot 	85
27	124	1 dash	86
27	125	1 oz	87
27	3	1 oz	88
27	5	1 oz	89
28	3	1 1/2 oz 	90
28	9	1 oz 	91
28	48	1 tsp 	92
28	36	1/2 tsp 	93
28	111	1 	94
29	90	1/2 oz 	95
29	126	1/2 oz 	96
30	18	6 oz 	97
30	127	1 oz 	98
31	3	4 cl	99
31	114	1.5 cl	100
31	49	1 cl	101
31	128	1.5 cl	102
32	7	1 1/2 oz 	103
32	5	1/2 oz 	104
32	15	1/2 oz 	105
32	24	2 dashes 	106
33	3	1 1/2 oz 	107
33	9	1/2 oz 	108
33	129	1/2 oz 	109
33	24	2 dashes 	110
33	110	1 	111
33	121	1 twist of 	112
34	130	2 oz	113
34	15	1 oz	114
34	132	3 dashes	116
35	47	10 cl 	118
35	134	6 cl 	119
35	48	1 cl 	120
35	36	1 cl 	121
36	3	2 oz 	122
36	15	1/2 oz 	123
36	24	2 dashes 	124
36	110	1 	126
37	40	4.5 cl	127
37	65	1.5 cl	128
37	136	6 cl	129
37	138	top up 	131
38	139	4 oz	132
38	125	1 oz	133
38	140	1 oz	134
39	105	1 shot	135
39	7	1/2 shot	136
39	24	3 drops	137
39	141	1 Fresh	138
39	142	cubes	139
40	143	1 	140
40	144	1 shot 	141
41	5	1 oz 	142
41	45	1 1/2 oz 	143
41	121	1 twist of 	144
42	93	1/2 oz 	145
42	145	1/2 oz 	146
42	126	1/2 oz 	147
43	10	2 oz 	148
43	9	1/2 oz 	149
43	56	2 wedges 	150
43	118	2 oz 	151
44	22	1/4 	152
44	146	1/4 	153
44	109	1/4 	154
44	127	1/4 	155
45	26	2 oz 	156
45	50	8 oz 	157
45	147	2 scoops 	158
1	48	1/4 Shot	3
34	110	1	117
36	115	1/2 tsp 	125
46	14	2 oz 	159
46	83	Juice of 1/2 	160
46	148	1 tsp 	161
46	111	1 	162
46	83	1 slice 	163
46	149	1 	164
47	40	3 parts	165
47	150	1 part	166
47	146	1 part	167
47	36	1 part	168
47	136	2 parts	169
48	3	2 oz 	172
48	48	1/4 tsp 	174
48	11	2 dashes 	175
48	149	1 	176
49	50	1/2 oz 	177
49	9	1/2 oz 	178
50	25	2 tsp	179
50	56	1 	180
50	153	2 1/2 oz 	181
51	69	1 oz 	182
52	4	1-2 shot 	183
52	56	Squeeze 	184
52	154	Fill with 	185
53	1	1 1/4 oz 	186
53	34	1 1/2 tsp 	187
53	120	1 tblsp 	188
54	1	2 oz 	189
54	56	Juice of 1/2 	190
55	56	1/2	191
55	155	1/3 oz	192
55	132	2 dashes	193
55	23	1 oz	194
55	156	1 oz	195
56	144	1 part 	196
56	154	2 parts 	197
57	1	2 oz 	198
57	9	1 1/2 tsp 	199
57	30	1 1/2 tsp 	200
58	3	1 1/2 oz 	202
58	36	2 tsp 	203
58	83	Juice of 1/2 	204
58	111	1 	205
59	12	2 oz 	206
59	9	1/2 oz 	207
59	48	1 tblsp 	208
60	86	1 bottle 	209
60	122	1 1/2 cl 	210
61	1	1 oz 	211
61	37	1 oz 	212
61	83	Juice of 1/2 	213
61	148	1 tsp 	214
61	111	1 	215
62	22	1 1/4 oz 	216
62	30	1/4 oz 	217
62	157	1/4 oz 	218
62	78	1/4 cup 	219
63	3	2 oz 	220
63	48	1/2 oz 	221
63	11	1 dash 	223
63	79	1 	224
64	3	3/4 oz	225
64	158	3/4 oz	226
64	159	3/4 oz	227
64	160	1 dash	229
65	92	1/2 shot 	230
65	50	1/2 shot 	231
65	16	1 dash 	232
66	5	1 oz 	233
66	45	1/2 oz 	234
66	161	1/2 oz Muscatel 	235
67	68	10 tblsp instant 	236
67	162	4 tblsp 	237
67	25	2 1/2 cups 	238
67	22	1 qt 	239
67	70	2 1/2 cups 	240
68	154	1 dl 	241
68	48	7 drops 	242
69	78	4 cups 	243
69	25	1 1/2 cup 	244
69	47	4 cups 	245
69	163	1 tblsp 	246
69	164	2 qt 	247
70	165	6 cl	248
70	166	2 dashes	249
70	113	2 Fresh leaves	250
71	86	1/2 pint 	251
71	95	1/2 pint 	252
71	167	1 dash 	253
72	1	1 1/2 oz 	254
72	56	Juice of 1/2 	255
72	148	1 tsp 	256
73	68	3 parts 	257
73	77	1 part 	258
74	168	2 part 	259
74	96	1 part 	260
74	21	2 shots 	261
74	105	Float Bacardi 	262
75	3	1 1/2 oz 	263
75	164	4 oz 	264
75	56	1 	265
76	3	1 2/3 oz 	266
76	15	1/3 oz 	267
76	169	1 	268
77	7	2 1/2 oz 	269
77	15	1 1/2 tsp 	270
77	121	1 twist of 	271
78	150	5 cl	272
78	170	10 cl	273
79	27	2 tsp 	274
79	56	1	275
79	153	2 1/2 oz	276
80	87	0.75 oz 	277
80	171	0.25 oz 	278
81	28	1 1/2 oz 	279
81	3	3/4 oz 	280
81	24	1 dash 	281
81	121	1 twist of 	282
82	160	2 shots	283
82	18	Top	284
83	52	2 tblsp 	285
83	50	6 oz whole 	286
83	172	6 oz 	287
84	12	3/4 oz 	288
84	3	3/4 oz 	289
84	5	3/4 oz 	290
85	22	5 cl	291
85	26	1 cl	292
85	49	1 dash	293
86	40	1 shot	294
86	173	1/2 shot	295
86	71	1 shot	296
86	68	1 shot	297
87	80	1/2 cup 	298
87	25	3 tblsp 	299
87	174	13 oz skimmed 	300
87	50	3/4 cup skimmed 	301
87	162	1 tsp 	302
87	40	1 tsp 	303
87	175	\n	304
88	8	3/4 oz 	305
88	3	1 1/2 oz 	306
88	15	3/4 oz 	307
88	36	1 tsp 	308
88	48	1/4 tsp 	309
88	149	1 	310
89	153	60 ml	311
89	56	1	312
89	176	3 cl	313
90	16	1/2 oz 	314
90	35	1/2 oz 	315
64	48	3/4 oz	228
48	115	1/4 tsp 	173
47	109	2 parts	170
90	120	2 oz 	316
91	3	1 1/2 oz 	317
91	25	2 tsp superfine 	318
91	48	1 1/2 oz 	319
91	18	4 oz Chilled 	320
91	73	1 	321
91	110	1 	322
92	14	2 oz 	323
92	177	1/2 oz 	324
92	83	Juice of 1/4 	325
92	56	Juice of 1/2 	326
92	83	1 slice 	327
92	56	1 slice 	328
93	53	1 cup fruit 	329
93	178	1 	330
93	109	4 oz frozen 	331
93	179	1/2 piece textural 	332
93	142	6 	333
94	145	1/2 oz 	334
94	94	1/2 oz 	335
94	22	1/2 oz 	336
95	40	2 shots	337
95	180	1 shot	338
95	181	1 shot	339
95	182	Juice of 1/2	340
95	183	Top	341
96	68	1/2 	342
96	127	1/2 	343
97	22	4.5 cl	344
97	184	1.5 cl	345
97	185	1.5 cl	346
98	3	1 oz	347
98	186	1 oz	348
98	5	1 oz	349
99	84	1/2 oz 	351
99	188	1/2 oz 	352
99	189	1 dash 	353
100	3	2 oz 	354
100	9	1/2 oz 	355
101	1	1 1/2 oz 	356
101	9	1 tblsp 	357
101	30	1 1/2 oz 	358
101	25	1 tsp 	359
101	149	1 	360
101	142	1 cup crushed 	361
102	53	1 cup 	362
102	190	1 cup 	363
103	7	1 oz 	364
103	5	1 oz 	365
103	24	1 dash 	366
103	49	1/4 tsp 	367
104	44	1 1/2 oz 	368
104	16	3/4 oz 	369
105	16	1 oz 	370
105	22	1 oz 	371
105	105	1 oz Bacardi 	372
105	191	1 oz 	373
105	192	1 oz 	374
106	1	2 oz 	375
106	30	1 tblsp 	376
106	113	6 	377
106	25	1 tsp 	378
107	1	1 1/2 oz 	379
107	193	4 chunks 	380
107	30	1 tblsp 	381
107	25	1/2 tsp 	382
108	65	2 1/2 shots 	383
109	3	2 1/2 oz	384
109	194	1/2 oz	386
109	56	1	387
110	22	1 oz 	388
110	16	1 oz 	389
110	64	1 oz 	390
111	3	2 oz 	391
111	83	Juice of 1/2 	392
111	148	1 tsp 	393
112	3	2 oz 	394
112	48	1 oz 	395
112	25	1/2 tsp superfine 	396
112	73	1 	397
112	110	1 	398
113	66	5 parts 	399
113	48	3 parts 	400
113	65	1 part 	401
113	195	1 part 	402
114	22	1 1/2 oz 	403
114	16	3/4 oz 	404
115	7	1 1/2 oz 	405
115	16	3/4 oz 	406
116	3	4 cl	407
116	142	cubes	410
117	3	2 oz 	411
117	70	2 tsp 	412
117	148	1/2 tsp 	413
117	121	1 twist of 	414
118	3	2 oz 	415
118	33	1 oz 	416
118	25	1 cube 	417
118	113	4 	418
118	73	1 slice 	419
118	149	1 	420
119	3	2 oz 	421
119	48	1 oz 	422
119	25	1/2 tsp superfine 	423
119	36	1/2 tsp 	424
119	110	1 	425
119	73	1 	426
120	3	2 oz 	427
120	83	Juice of 1/2 	428
120	148	1 tsp 	429
120	70	1 tsp 	430
120	123	Twist of 	431
121	22	1 1/2 oz	432
121	198	3 oz	433
122	3	2 oz 	434
122	36	1 tsp 	435
122	182	Juice of 1/2 	436
122	183	Top up with	437
122	56	Garnish	438
123	3	1 1/2 oz 	439
123	36	1 tsp 	440
123	148	1 tblsp 	441
123	193	3 chunks	442
123	51	2 	443
124	199	1 1/2 cl 	444
124	127	1 1/2 cl 	445
124	129	1 1/2 cl 	446
125	3	2 oz 	448
126	30	1 1/2 oz 	449
126	25	1 tsp superfine 	450
126	3	2 oz 	451
126	24	1 dash 	452
126	201	3 oz 	453
127	3	1 1/2 oz 	454
127	9	1 oz 	455
127	47	1 oz 	456
127	36	1/2 tsp 	457
127	193	1 	458
128	202	3/4 oz 	459
128	35	3/4 oz white 	460
128	120	3/4 oz 	461
129	26	1 oz 	462
129	105	1 oz Bacardi 	463
129	36	1 dash 	464
130	3	2 oz	465
130	183	5 oz	466
130	56	1/4	467
131	203	4 cl 	468
131	103	8 cl 	469
132	204	6 cl	470
132	205	2 cl	471
109	30	1/2 oz	385
124	152	3 cl 	447
98	123	1	350
116	121	1 Slice	409
133	171	5 shots 	473
133	17	very sweet 	474
134	1	1 oz 	475
134	47	1 oz 	476
134	48	1 tsp 	477
135	31	1 shot 	478
135	103	3/4 shot 	479
135	68	6 oz hot 	480
136	22	1 oz 	481
136	65	1/2 oz 	482
136	109	4 oz 	483
137	3	2 oz 	484
137	9	1/2 oz 	485
137	47	1 tblsp 	486
138	40	12 parts	487
138	198	8 parts	488
139	7	1 1/2 oz 	491
139	5	3/4 oz 	492
139	11	2 dashes 	493
139	169	1 	494
140	63	12 oz fine 	495
140	206	1 tsp 	496
140	162	1/2 tsp 	497
140	207	1 cup 	498
140	208	mini 	499
141	22	1 1/2 oz 	500
141	209	6 oz 	501
141	48	 to taste\n	502
142	68	1/4 cup instant 	503
142	25	1/4 cup 	504
142	70	1/4 cup hot 	505
142	50	4 cups cold 	506
143	7	1 cup 	507
143	207	1 1/4 cup 	508
143	174	1 can sweetened 	509
143	210	3 drops 	510
143	52	1 tblsp 	511
144	31	1 1/2 oz 	512
144	68	8 oz 	513
144	25	1 tsp 	514
144	211	1 tblsp 	515
145	31	1 oz 	516
145	212	1/2 oz 	517
145	109	1 oz 	518
145	73	1 slice 	520
145	149	1 	521
146	1	1/2 oz 	522
146	14	1 1/2 oz 	523
146	83	Juice of 1/2 	524
146	148	1 tsp 	525
147	22	1 shot 	526
147	26	1 shot 	527
147	154	1 dash 	528
147	213	Fill with 	529
148	30	4 cl 	530
148	3	2 cl 	531
148	214	4 cl 	532
149	26	2 tsp 	533
149	68	Strong cold 	534
150	103	3/4 oz 	535
150	20	3/4 oz 	536
150	22	3/4 oz 	537
150	109	2-3 oz 	538
151	103	2/3 oz	539
151	215	1/3 oz	540
151	49	1 tsp	541
151	25	2 pinches	542
152	117	1 oz 	543
152	16	1 oz 	544
153	98	1 oz 	545
153	216	1 oz 	546
154	22	2 cups 	547
154	217	3 packages 	548
154	70	3 cups 	549
155	19	1 shot 	550
155	1	1 shot Jamaican 	551
155	142	cubes	552
156	20	2 oz 	553
156	48	1 oz 	554
156	25	1 tsp superfine 	555
156	201	3 oz 	556
156	110	1 	557
156	73	1 	558
157	14	1 1/2 oz 	559
157	83	Juice of 1/2 	560
157	148	1 tsp 	561
157	37	1 tblsp	562
157	111	1 	563
158	40	1/6 glass 	564
158	68	1/6 glass strong black 	565
158	70	1/2 glass cold 	566
159	50	2 cups 	567
160	3	1 1/2 oz 	568
160	125	1/2 oz 	569
160	218	1/2 oz 	570
161	32	1 1/2 oz 	571
161	36	1 tsp 	572
161	56	Juice of 1/2 	573
162	100	1 part 	574
162	18	5 parts 	575
163	68	1 part 	576
163	219	2 parts 	577
164	22	1 oz 	578
164	9	1 oz 	579
164	30	1 oz 	580
165	100	1 part 	581
165	18	5 parts 	582
166	220	1 part 	583
166	221	2 parts 	584
166	142	cubes	585
167	222	4 cl 	586
167	17	Turkish apple 	587
167	25	 (if needed)\n	588
168	26	1 oz 	589
168	12	1/2 oz 	590
169	223	4 cl 	591
169	224	2 cl 	592
169	225	7 cl 	593
169	46	8 cl 	594
169	142	cubes	595
170	22	1 shot 	596
170	16	1 shot 	597
170	45	1 shot 	598
170	9	1 shot 	599
171	105	2 oz light 	600
171	226	1/2 tsp Tropical 	601
172	20	2 oz 	602
172	177	1/2 oz 	603
173	20	3 oz 	604
173	177	1/2 oz 	605
173	121	1 twist of 	606
174	60	3 	607
174	227	1/2 	608
175	55	1 inch 	609
175	83	1/4 	610
175	70	1 cup hot 	611
176	56	Juice of 1 	612
176	25	1 tblsp 	613
176	172	 (seltzer water)\n	614
177	192	3/4 bottle 	615
177	16	1 shot 	616
177	109	1 oz 	617
178	22	1 1/2 shot 	618
178	157	1 1/2 shot 	619
178	83	Juice of 1 wedge 	620
179	22	5 cl 	621
179	56	1/2 	622
179	228	4 dashes 	623
179	108	1 dl Schweppes 	624
179	142	4 	625
180	53	1 cup 	626
138	30	3 parts	490
132	48	2 cl	472
138	115	3 parts	489
180	70	2 cups cold 	627
180	229	1 tsp 	628
180	230	1 pinch 	629
181	7	2 oz 	630
181	231	1/2 oz 	631
181	15	1/2 oz 	632
181	121	1 twist of 	633
182	3	1 1/2 oz 	634
182	11	2 dashes 	636
183	54	2 	637
183	53	2 cups 	638
183	25	1/2 cup 	639
183	70	1 cup iced 	640
184	53	1 cup 	641
184	70	2 cups cold 	642
184	25	4 tblsp 	643
184	229	pinch 	644
184	48	2 tblsp 	645
185	4	1 1/2 oz 	646
185	232	1/2 oz 	647
186	3	2 oz 	648
186	120	2 tsp 	649
186	148	1 tsp 	650
186	83	Juice of 1/2	651
186	111	1 	652
187	22	1/2 oz 	653
187	1	1/2 oz 	654
187	3	1/2 oz 	655
187	21	1/2 oz 	656
187	83	Juice of 1/2 	657
187	154	1 splash 	658
189	5	3/4 oz 	659
189	3	1 1/2 oz 	660
190	233	30 ml	661
190	198	75 ml	662
190	183	Top	663
191	22	1/2 oz 	664
191	21	1/2 oz 	665
191	1	1/2 oz 	666
191	3	1/2 oz 	667
191	154	1 dash 	668
191	121	Twist of 	669
192	176	2 tsp	670
192	22	1 shot	671
192	183	1/3 cup	672
192	234	Top	673
193	1	2-3 oz 	674
193	56	Juice of 1 	675
193	25	2 tsp 	676
193	113	2-4 	677
194	18	Chilled 	678
194	109	2 oz 	679
195	1	1 oz 	680
195	235	1/2 oz 	681
195	9	1/2 oz 	682
195	149	1 	684
196	3	1 2/3 oz 	685
196	15	1/3 oz 	686
196	169	1 	687
197	192	4 oz	688
197	236	4 oz	689
197	237	Dash	691
197	238	Dash	692
197	239	Dash	693
198	5	3/4 oz 	694
198	20	2 1/2 oz Blended 	695
198	228	dash 	696
198	142	2 or 3 	697
198	110	1 	698
198	123	1 twist of 	699
199	113	4 fresh 	700
199	20	2 1/2 oz 	701
199	148	1 tsp 	702
199	70	2 tsp 	703
200	10	750 ml 	704
200	109	1 L 	705
200	240	750 ml 	706
201	3	1 1/2 oz	707
201	5	1 1/2 oz	708
201	132	2 dashes	710
202	160	2/5 	711
202	21	2/5 	712
202	36	1/5 	713
203	105	5 oz Bacardi 	714
203	241	frozen 	715
203	242	frozen 	716
204	22	2 oz 	717
204	30	2 oz 	718
204	164	8 oz 	719
205	70	3 cups 	720
205	25	1 cup 	721
205	243	12 	722
205	244	2 	723
205	121	1 	724
205	39	750 ml 	725
205	12	1/4 cup 	726
206	3	5 cl	727
206	170	10 cl	729
206	245	Chopped	730
206	182	Chopped	731
207	68	6 oz 	732
207	215	2 oz 	733
207	62	2 tblsp 	734
208	113	1/2 handful 	735
208	48	3 cl 	736
208	4	1/8 L Jamaican 	737
208	201	1/8 L 	738
208	228	8 drops 	739
209	3	2 oz 	740
209	177	1 tsp 	741
209	109	1/2 oz 	742
209	36	1 tsp 	743
210	103	1 oz 	744
210	246	3/4 oz 	745
210	247	3/4 oz double 	746
211	1	1 1/2 oz 	747
211	47	1 oz 	748
211	36	1/2 tsp 	750
211	110	1 	751
212	1	1 1/2 oz 	752
212	41	3 oz 	753
212	24	1 dash 	754
213	3	1 oz 	755
213	122	1 oz 	756
213	5	1 oz 	757
214	14	2 oz 	758
214	83	Juice of 1/2 	759
214	25	1 tsp 	760
214	39	 (Claret)\n	761
215	103	1 part 	762
215	119	1 part 	763
215	50	1 part 	764
216	40	1/2 oz 	765
216	22	1/2 oz 	766
216	3	1/2 oz 	767
216	129	1/2 oz 	768
216	118	2 oz 	769
216	248	1 splash 	770
217	88	2 oz 	771
217	101	1 oz 	772
217	48	2 oz sweetened 	773
217	201	1 oz 	774
218	62	2 tsp 	775
218	25	1 tsp 	776
218	162	1/2 tsp 	777
218	50	12 oz 	778
219	35	1/2 oz white 	779
219	16	1/2 oz 	780
219	9	1/2 oz 	781
219	22	1/2 oz 	782
197	30	1 tblsp	690
201	115	1 tsp	709
182	115	1/2 oz 	635
211	115	1/2 tsp 	749
219	120	1 oz 	783
220	249	2 oz	784
220	122	1 oz	785
220	15	1 oz	786
221	48	5 cl 	787
221	109	15 cl 	788
221	49	2-3 cl 	789
222	109	4 oz 	790
222	40	1 oz 	791
222	22	1 oz 	792
222	247	1 package 	793
222	142	Over 	794
223	22	1 oz 	795
223	9	1 oz 	796
223	109	1 oz 	797
224	34	1/2 oz 	798
224	3	1 1/2 oz 	799
224	109	4 oz 	800
225	20	4.5 cL	801
225	228	2 dashes	802
225	25	1 cube	803
225	70	dash	804
226	69	1.5 oz 	805
226	36	0.5 oz 	806
226	109	4 oz 	807
226	118	1 splash 	808
227	3	1 shot	809
227	250	25 ml	812
227	183	Top	813
227	251	Garnish with	814
228	252	3 oz	816
228	21	1 1/2 oz	817
229	3	7 parts	818
229	253	4 parts	819
230	24	3 dashes 	821
230	3	2 oz 	822
231	3	1 1/2 oz	823
231	254	3/4 oz	824
231	132	1 dash	826
231	124	1 dash	827
232	3	1 1/2 oz 	828
232	36	1 tsp 	829
232	120	1 tsp 	830
232	111	1 	831
233	3	1 shot	832
233	233	1 shot	833
233	176	25 ml	834
233	255	Garnish with	836
234	256	2 oz	837
234	257	2 tsp	839
234	258	2 tsp	840
234	259	1/4 oz	841
235	89	2 oz 	842
235	48	1 oz 	843
235	25	1-2 tblsp 	844
235	142	1	845
236	12	3 parts	846
236	37	9 parts	847
236	260	2 parts	848
237	1	3 oz 	849
237	261	3 tblsp 	850
237	193	3 tblsp 	851
238	77	750 ml 	852
238	22	1750 ml 	853
238	127	1750 ml 	854
238	109	1 gal 	855
238	78	1 gal 	856
239	40	40 ml	857
239	262	20 ml	858
239	263	15 ml	860
239	166	Dash	861
239	113	Garnish with	862
240	22	2 oz 	863
240	264	2 oz 	864
240	78	4 oz 	865
240	109	4 oz 	866
241	3	1 1/2 oz 	867
241	35	3/4 oz white 	868
242	37	1 1/2 oz 	869
242	120	2 tsp 	870
242	148	1 tsp 	871
242	80	1 whole 	872
243	21	4 oz	873
243	198	4 oz	874
243	265	1 oz	875
243	136	8 oz	876
243	56	Garnish with	877
243	266	Rimmed	878
244	22	3 cl	879
244	262	3 cl	880
244	134	1 cl	881
244	56	1 cl	882
244	138	1 shot	883
245	150	4.5 cL	884
245	136	3.5 cl	886
245	36	1 cl	887
245	194	1 cl	888
245	132	4 drops	889
246	36	1 tblsp 	890
246	202	1/2 oz 	891
247	37	2 1/2 oz 	892
247	12	1/2 tsp 	893
248	109	1 part 	894
248	46	1 part 	895
248	47	1 part 	896
249	96	1 L 	897
249	267	2 cups 	898
249	22	2 cups 	899
250	22	1 shot	900
250	194	1/2 shot	901
250	134	Full Glass	902
251	55	1/4 inch 	903
251	193	1/2 	904
252	4	1 1/2 oz 	905
252	26	1/2 oz 	906
252	120	1 oz 	907
252	175	1/8 tsp grated 	908
253	38	1 oz 	909
253	268	1 1/2 oz 	910
253	43	1/2 oz cream 	911
254	269	25 ml 	912
254	109	Add 250 ml 	913
255	39	2 oz 	914
255	36	1 oz 	915
256	15	1/2 oz 	916
256	3	1 1/2 oz 	917
256	177	1 1/2 tsp 	918
257	1	1 1/2 	919
257	43	1/3 oz cream 	920
257	56	Juice of 1/2 	921
258	15	1/2 oz 	922
258	3	1 oz 	923
258	8	1/2 oz 	924
258	48	1/2 tsp 	925
258	36	1 tsp 	926
259	192	12 oz 	927
259	97	12 oz 	928
260	1	2 oz 	929
260	48	1 oz 	930
260	25	1/2 tsp superfine 	931
260	73	1 	932
260	110	1 	933
261	40	mikey bottle 	934
261	164	large bottle 	935
261	168	355 ml frozen 	936
261	109	355 ml frozen 	937
227	48	Top	811
234	48	3/4 oz	838
227	123	Garnish with	815
227	109	Top	810
229	109	3 parts 	820
245	109	3 cl	885
261	142	crushed 	938
262	40	2 oz light or dark 	939
262	148	2 tsp 	940
262	121	1 twist of 	941
262	70	2 tsp 	942
263	3	1 oz 	943
263	80	1 whole 	945
264	40	2 oz light or dark 	946
264	248	4 oz 	947
264	83	1 	948
265	199	1 1/2 oz 	949
265	98	1 oz 	950
265	109	3-4 oz 	951
265	47	3-4 oz 	952
265	78	3-4 oz 	953
266	7	1 1/2 oz 	954
266	231	1/2 oz 	955
266	121	1 twist of 	956
267	270	1 shot 	957
267	16	1 shot 	958
267	78	1 shot 	959
268	119	1 part 	960
268	270	1 part 	961
269	270	1 1/2 oz 	962
269	127	1 oz 	963
269	215	1/2 oz 	964
269	78	1 oz 	965
270	25	1 tsp superfine 	966
270	201	3 oz 	967
270	83	1 	968
270	4	2 oz 	969
270	110	1 	970
270	73	1 	971
271	3	2 oz 	972
271	78	5 oz 	973
271	36	2 splashes 	974
272	49	2 tsp 	975
273	3	50 ml	976
273	129	15 ml	977
273	251	Garnish with	979
274	3	2 oz 	980
274	83	Juice of 1/2 	981
274	148	1 tsp 	982
274	80	1 whole 	983
275	1	2 oz 	984
275	50	1 cup 	985
275	148	1 tsp 	986
276	20	2 oz	987
276	271	1/2 oz	988
276	113	8	989
277	1	1 1/2 oz 	990
277	109	5 oz 	991
278	272	2 oz 	992
278	248	4 oz 	993
279	1	1 1/2 oz 	994
279	105	1 tsp 	995
279	148	1/2 tsp 	996
279	24	1 dash 	997
279	70	1 tsp 	998
279	273	Twist of 	999
280	22	2.5 cl	1000
280	100	1.5 cl	1001
280	194	1 cl	1002
281	40	1 oz 	1004
281	22	1 oz 	1005
281	21	1 oz 	1006
281	3	1 oz 	1007
281	9	1 oz 	1008
281	215	1 oz 	1009
281	93	1 oz 	1010
281	199	1 oz 	1011
282	39	1/3 part 	1012
282	127	1 shot 	1013
282	240	1/3 part 	1014
282	109	1/3 part 	1015
283	138	6 cl	1016
283	122	4 cl	1017
283	183	splash	1018
284	12	1 oz 	1019
284	16	1 oz 	1020
284	120	1 oz 	1021
285	39	1 bottle 	1022
285	25	1/2 cup 	1023
285	109	1 cup 	1024
285	48	1 cup 	1025
286	12	1 1/2 oz 	1026
286	246	1/2 oz 	1027
287	44	2 oz 	1028
287	157	1/2 oz 	1029
287	48	1 oz 	1030
288	22	1 oz	1031
288	274	1 oz	1032
288	275	1 oz	1033
288	276	1 tsp	1034
288	132	Dash	1035
289	277	1 1/2 oz 	1037
289	85	8-10 oz cold 	1038
289	83	1 slice 	1039
289	142	cubes	1040
290	278	1 part 	1041
290	117	1 part 	1042
290	106	1 oz 	1043
291	41	5 oz 	1044
291	3	1 1/2 oz 	1045
291	229	1/4 tsp 	1046
292	8	1 oz 	1047
292	109	1 oz 	1048
293	22	1 1/2 oz 	1050
293	78	4 oz 	1051
293	41	1 oz 	1052
294	7	1 1/2 oz 	1053
294	56	Juice of 1/2 	1054
294	148	1/2 tsp 	1055
294	83	1/2 slice 	1056
294	149	1 	1057
295	279	2 shots 	1058
296	22	2 oz 	1059
297	43	1 1/2 oz cream 	1060
297	120	2 tsp 	1061
297	148	1 tsp 	1062
297	80	1 whole 	1063
298	85	1 can 	1064
298	70	3 cans 	1065
298	22	1 1/2 cup 	1066
299	22	2 cl 	1067
299	116	2 cl 	1068
300	105	1 shot Bacardi 	1069
300	199	1 shot 	1070
300	47	1 shot 	1071
301	43	2 oz cream 	1072
301	148	1 tsp 	1073
301	80	1 whole 	1074
302	50	2 cups 	1075
302	178	1 	1076
302	205	1 tblsp 	1077
303	39	2 bottles 	1078
303	25	1 cup 	1079
303	70	2 cups hot 	1080
303	280	1 cup	1081
303	73	 wedges\n	1082
303	56	 wedges\n	1083
304	7	1 1/2 oz 	1084
304	161	1 oz Green Ginger 	1085
304	109	1 oz 	1086
305	150	1 shot	1087
305	122	1 shot	1088
305	281	1/2 shot	1089
305	136	Top	1090
306	70	1 cup 	1092
306	282	3/4-1 cup 	1093
305	30	Top	1091
263	152	2 oz 	944
280	48	2.5 cl	1003
288	123	Garnish with	1036
306	68	4 tsp 	1094
306	40	1 cup 	1095
306	162	4 tsp 	1096
307	283	2 oz	1097
307	5	1 oz	1098
307	125	1/2 oz	1099
308	106	1 oz 	1100
308	16	3/4 oz 	1101
308	47	1 splash 	1102
309	26	1/2 oz 	1103
309	90	1/2 oz 	1104
309	16	1/2 oz 	1105
309	105	1/2 oz Bacardi 	1106
309	247	1 oz 	1107
310	3	2 oz 	1108
310	48	1 oz 	1109
310	25	1 tsp superfine 	1110
310	201	3 oz 	1111
310	110	1 	1112
310	73	1 	1113
311	61	2 cups 	1114
311	48	1-2 tblsp 	1115
311	284	1 dash 	1116
312	101	3 parts 	1117
312	68	1 part 	1118
313	68	8 oz 	1119
313	117	4 oz 	1120
313	16	4 oz 	1121
314	21	2 oz 	1122
314	48	1 tblsp 	1123
314	36	3/4 oz 	1124
314	111	1 	1125
315	21	2 oz 	1126
315	83	Juice of 1/2 	1127
315	148	1 tsp 	1128
315	83	1/2 slice 	1129
315	149	1 	1130
316	17	1/4 cup Thai 	1131
316	70	1/2 cup boiling 	1132
316	174	2 tsp sweetened 	1133
316	142	cubes	1134
316	113	garnish	1135
317	125	1 oz	1136
317	3	1 oz	1139
318	15	1 oz 	1140
318	3	1 oz 	1141
318	216	1/4 tsp 	1142
318	24	2 dashes 	1143
318	123	Twist of 	1144
319	21	1 shot	1145
319	285	1 part	1146
320	21	2 measures 	1147
321	3	1 shot	1148
321	286	1 shot	1149
321	124	1 dash	1150
321	138	Top	1152
322	15	1 1/2 oz 	1153
322	3	1 1/2 oz 	1154
322	216	1/4 tsp 	1156
322	11	2 dashes 	1157
322	149	1 	1158
323	21	full glass 	1159
323	189	About 8 drops 	1160
324	283	50 ml	1161
324	16	50 ml	1162
325	288	1 part 	1164
325	34	1/2 part 	1165
325	10	1 part 	1166
326	3	6 cl	1168
326	22	1.5 cl	1169
326	159	0.75 cl	1170
327	3	1 1/2 oz 	1171
327	5	1/2 oz 	1172
327	12	1/2 oz 	1173
328	1	1 oz 	1174
328	5	1/2 oz 	1175
328	83	Juice of 1/2 	1176
328	148	1 tsp 	1177
328	111	1 	1178
329	4	2 oz 	1179
329	34	1/2 oz 	1180
330	1	3 oz 	1181
330	289	1 oz 	1182
330	48	1 oz 	1183
331	22	2 oz 	1184
331	207	2 oz 	1185
331	290	2 oz 	1186
332	96	1 cup	1187
332	22	1 1/2 shot	1189
333	22	1 1/2 oz 	1190
333	15	3/4 oz 	1191
333	169	1 	1192
335	15	1 1/2 oz 	1194
335	100	3/4 oz 	1195
336	22	1 1/2 oz 	1196
336	48	3 oz 	1197
336	81	3 oz unsweetened 	1198
336	148	1 tsp 	1199
336	73	1 slice 	1200
337	22	2 oz 	1201
338	8	1 1/2 oz 	1202
338	109	1 tblsp 	1203
338	11	2 dashes 	1204
339	7	1 1/2 oz 	1205
339	161	1 oz Green Ginger 	1206
340	3	4cl	1207
340	158	3cl	1208
341	39	1 bottle 	1210
341	83	2 	1211
341	109	1 cup 	1212
341	73	3 	1213
341	47	1 cup 	1214
342	39	2 oz white or 	1215
342	248	5 oz 	1216
342	142	cubes	1217
343	21	1 2/3 oz	1218
343	122	1/4 oz	1219
343	250	1/2 oz	1222
343	229	Dash	1223
344	22	2 oz 	1224
344	19	1 oz 	1225
345	56	1	1226
345	182	1	1227
345	291	750 ml	1228
345	51	1 cup	1229
345	280	1 cup	1230
345	292	3 shots	1231
345	183	Top	1232
346	142	1 cup 	1233
346	21	2 oz 	1234
346	293	1/4 cup 	1235
346	30	3 tblsp fresh 	1236
347	9	3/4 oz 	1237
347	3	3/4 oz 	1238
347	47	1 tblsp 	1239
348	204	3 cl	1240
348	65	1.5 cl	1241
348	158	1.5 cl	1242
349	94	2 cl 	1244
349	103	2 cl 	1245
349	246	2 cl 	1246
350	294	4 shots 	1247
350	295	4 shots 	1248
351	154	 slice\n	1249
352	94	1 1/2 oz 	1250
332	30	1/2 shot	1188
321	48	1 dash	1151
340	48	2cl	1209
324	78	4 oz	1163
334	22	2 part	1193
317	115	1 oz	1137
322	115	1/4 tsp 	1155
343	109	1/2 oz	1221
352	296	Add 10 oz 	1251
352	142	cubes	1252
353	22	1 1/4 oz Stoli 	1253
353	67	1/4 oz 	1254
354	145	1/2 oz 	1255
354	296	1/2 oz 	1256
355	215	1 shot 	1257
355	22	1 shot 	1258
355	172	Fill with 	1259
356	297	12 oz 	1260
356	215	3 oz 	1261
357	157	5 cl 	1262
357	48	2 cl 	1263
357	142	cubes	1264
357	83	 or lime\n	1265
358	112	4 cl 	1266
358	46	16 cl 	1267
359	4	1 shot 	1268
359	1	2 shots 	1269
359	22	1 shot 	1270
359	109	1 shot 	1271
360	222	1/2 oz 	1272
360	101	1/4 oz 	1273
360	215	1/4 oz 	1274
360	93	1/4 oz 	1275
360	199	1/4 oz 	1276
360	16	1/4 oz 	1277
360	78	1/2 oz 	1278
360	47	1/4 oz 	1279
361	86	16 oz 	1280
361	21	1.5 oz 	1281
362	199	1/2 oz 	1282
362	1	1/2 oz 	1283
362	105	1/2 oz Bacardi 	1284
362	298	1 oz 	1285
362	157	1 oz 	1286
362	50	3 oz 	1287
362	299	1 oz 	1288
362	147	1 cup 	1289
363	105	1/2 shot Bacardi 	1290
363	106	1/2 shot 	1291
364	126	1/2 oz 	1292
364	145	1/2 oz 	1293
364	300	1/2 oz 	1294
364	105	1/2 oz Bacardi 	1295
365	117	1/3 oz 	1296
365	75	1/3 oz 	1297
365	278	1/3 oz 	1298
366	3	1/2 oz	1299
366	1	1/2 oz	1300
366	21	1/2 oz	1301
366	9	1/2 oz	1302
366	22	1/2 oz	1303
366	154	1/2 oz	1304
366	24	1 wedge 	1306
366	83	Garnish with	1307
367	66	2-3 oz	1308
368	301	2 1/2 oz 	1309
368	101	1 splash 	1310
368	109	Fill with 	1311
370	35	1 oz white 	1312
370	22	1 oz 	1313
371	3	2 oz dry 	1314
371	97	4 oz 	1315
371	48	0.75 oz 	1316
372	26	1/3 part 	1317
372	103	1/3 part 	1318
372	119	1/3 part 	1319
373	22	1 oz	1320
373	302	1 oz	1321
373	96	Top	1323
374	88	2 oz 	1324
374	254	1/2 oz 	1325
374	303	1 splash 	1326
374	109	1 oz 	1327
337	108	Fill with	1328
273	108	100 ml	978
116	108	10 cl	408
375	117	2 oz	1329
375	154	Fill with	1330
376	40	2 oz	1331
376	154	Fill with	1332
377	142	cubes	1334
377	306	4 cl	1333
377	108	10 cl	1336
378	29	3 oz	1337
378	165	4 oz	1338
378	108	6 oz	1339
378	265	2	1340
379	142	cubes	1341
379	307	4 cl	1342
379	108	10 cl	1344
380	305	2 oz	1345
380	154	Fill with	1346
381	178	1/2	1347
381	304	5	1348
381	36	1/2 oz	1349
381	47	6 2/3 oz	1350
381	293	3 1/2 Oz	1351
382	308	2 oz	1352
382	108	4 oz	1353
382	265	1 Wedge	1354
383	309	2 oz	1355
383	154	10 oz	1356
384	26	1 part	1357
385	103	1 oz	1360
385	50	3 oz	1361
384	50	3 part	1359
34	115	1/4 oz	115
57	115	1 1/2 tsp 	201
366	152	1-2 dash 	1305
325	152	1 splash 	1167
47	152	1 part	171
145	152	1 oz 	519
195	152	1 1/2 oz 	683
292	152	1 oz 	1049
239	30	30 ml	859
231	30	3/4 oz	825
233	30	30 ml	835
317	30	1 oz	1138
343	30	3/4 oz	1220
37	30	 1 dash	130
206	30	2 cl	728
348	30	1.5 cl	1243
373	78	1 oz	1322
334	26	1 part	1362
379	121	1 Slice	1343
377	121	1 Slice	1335
63	115	1 tsp 	222
397	145	2 oz	1379
397	310	4 oz	1380
398	311	1 part	1381
398	108	1 part	1382
399	127	1 oz	1383
399	152	2 oz	1384
399	78	2 oz	1385
400	93	1 oz	1386
400	152	2 oz	1387
401	22	1 oz	1388
401	304	2 oz	1389
401	201	Fill with	1390
402	20	3/4 oz	1391
402	234	3/4 oz	1392
402	49	1/2 oz	1393
402	123	Twist of	1394
402	110	Garnish with	1395
403	40	1 1/2 oz	1396
403	129	3/4 oz	1397
403	47	2 oz	1398
403	293	3/4 oz	1399
403	193	Wedge	1400
404	21	2 oz	1401
404	142	1 cube	1402
404	9	1 1/2 oz	1403
404	265	1 oz	1404
404	56	1 slice	1405
404	229	1 tsp	1406
405	21	2 oz	1407
405	129	1 oz	1408
405	49	1 oz	1409
405	265	1 oz	1410
405	56	1 slice	1411
405	229	1 tsp	1412
406	46	6 oz	1413
406	280	Garnish with 2 slices	1414
406	142	1 cube	1415
406	164	4 oz	1416
406	55	1 tsp	1417
406	234	1 oz	1418
406	22	4 oz	1419
408	129	1/2 oz	1420
408	127	1/2 oz	1421
408	233	1/2 oz	1422
408	234	1/2 oz	1423
408	108	Fill with	1424
408	142	cube	1425
409	22	1 1/2 oz	1426
409	312	1/2 oz	1427
409	30	1/4 oz	1428
410	3	1/2 oz	1429
410	1	1/2 oz	1430
410	21	1/2 oz	1431
410	22	1/2 oz	1432
410	158	1/2 oz	1433
410	118	1 oz	1434
410	78	2 oz	1435
410	83	1 slice	1436
411	93	1 oz	1437
411	199	3/4 oz	1438
411	146	3/4 oz	1439
411	152	1 oz	1440
411	47	1 oz	1441
413	22	1/2 oz	1442
413	40	1/2 oz	1443
413	21	1/2 oz	1444
413	3	1/2 oz	1445
413	129	1/2 oz	1446
413	152	2 oz	1447
413	96	Fill with	1448
413	83	1 wedge	1449
414	22	2 oz	1450
414	127	1 oz	1451
414	109	2 oz	1452
414	78	2 oz	1453
414	48	1 tsp (Optional)	1454
415	127	1/2 oz	1455
415	199	1/2 oz	1456
415	152	1 1/4 oz	1457
415	109	1 1/4 oz	1458
415	36	1/2 oz	1459
415	25	1 tsp	1460
416	40	2 oz	1461
416	265	1 oz	1462
416	129	1/4 oz	1463
416	49	3/4 oz	1464
416	201	Fill with	1465
416	113	2-4	1466
417	313	1 part	1467
417	108	3 part	1468
417	245	3 rounds	1469
417	245	Garnish with	1470
418	47	2 oz	1471
418	109	2 oz	1472
418	152	2 oz	1473
418	142	Crushed	1474
419	22	1 oz	1475
419	78	4 1/2 oz	1476
419	302	1 dash	1477
419	109	1 dash	1478
433	192	1 can	1479
433	83	1 slice	1480
433	158	1 Shot	1481
433	21	1 Shot	1482
433	26	1 Shot	1483
433	299	1 Shot	1484
436	134	4 oz	1485
436	40	1 oz	1486
436	129	1oz	1487
436	25	Garnish with	1488
437	294	1 oz	1489
437	9	0.5 oz	1490
437	152	1 oz	1491
437	46	1 oz	1492
437	36	2 tsp	1493
437	95	Fill up	1494
437	234	0.75 oz	1495
437	30	0.5 oz	1496
437	142	cubes	1497
438	315	2 dashes	1498
438	130	1 1/2 parts	1499
438	28	2 dashes	1500
438	254	2 dashes	1501
438	123	Garnish with twist of	1502
438	121	Garnish with twist of	1503
439	129	1/2 oz	1504
439	146	1/2 oz	1505
439	127	1/2 oz	1506
439	199	1/3 oz	1507
439	152	2 oz	1508
439	142	cubes	1509
441	145	0.5 oz	1510
441	100	0.5 oz	1511
441	36	0.5 oz	1512
441	263	0.5 oz	1513
441	152	1 oz	1514
441	109	1 oz	1515
441	95	Fill up	1516
441	142	Cubes	1517
\.


--
-- Data for Name: cocktail_favorites; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.cocktail_favorites (user_id, cocktail_id) FROM stdin;
\.


--
-- Data for Name: cocktail_image_composition; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.cocktail_image_composition (cocktail_id, image_id) FROM stdin;
\.


--
-- Data for Name: cocktail_reviews; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.cocktail_reviews (cocktail_review_id, cocktail_id, user_id, cocktail_review, cocktail_rating, cocktail_review_created_at, cocktail_review_updated_at, cocktail_review_deleted_at, cocktail_review_deleted) FROM stdin;
\.


--
-- Data for Name: cocktails; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.cocktails (cocktail_id, cocktail_name, cocktail_description, cocktail_image, cocktail_alcoholic, cocktail_instructions, cocktail_created_at, cocktail_updated_at, cocktail_deleted_at, cocktail_deleted, cocktail_signiture) FROM stdin;
1	A1		1	t	Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.	2023-06-05 23:07:56.642208	2023-06-05 23:07:56.642208	2023-06-05 23:07:56.642208	f	f
2	ABC		2	t	Layered in a shot glass.	2023-06-05 23:07:56.651251	2023-06-05 23:07:56.651251	2023-06-05 23:07:56.651251	f	f
3	Ace		3	t	Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.	2023-06-05 23:07:56.656268	2023-06-05 23:07:56.656268	2023-06-05 23:07:56.656268	f	f
4	ACID		4	t	Poor in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.	2023-06-05 23:07:56.662803	2023-06-05 23:07:56.662803	2023-06-05 23:07:56.662803	f	f
5	Adam	Alcoholic,Holiday	5	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.	2023-06-05 23:07:56.668942	2023-06-05 23:07:56.668942	2023-06-05 23:07:56.668942	f	f
6	AT&T		6	t	Pour Vodka and Gin over ice, add Tonic and Stir	2023-06-05 23:07:56.673776	2023-06-05 23:07:56.673776	2023-06-05 23:07:56.673776	f	f
7	A. J.		7	t	Shake ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:56.679286	2023-06-05 23:07:56.679286	2023-06-05 23:07:56.679286	f	f
8	Apello		9	f	Stirr. Grnish with maraschino cherry.	2023-06-05 23:07:56.684021	2023-06-05 23:07:56.684021	2023-06-05 23:07:56.684021	f	f
9	Affair		10	t	Pour schnapps, orange juice, and cranberry juice over ice in a highball glass. Top with club soda and serve.	2023-06-05 23:07:56.69241	2023-06-05 23:07:56.69241	2023-06-05 23:07:56.69241	f	f
10	Abilene		11	t	Pour all of the ingredients into a highball glass almost filled with ice cubes. Stir well.	2023-06-05 23:07:56.696975	2023-06-05 23:07:56.696975	2023-06-05 23:07:56.696975	f	f
11	Almeria		12	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.	2023-06-05 23:07:56.701522	2023-06-05 23:07:56.701522	2023-06-05 23:07:56.701522	f	f
12	Addison		13	t	Shake together all the ingredients and strain into a cold glass.	2023-06-05 23:07:56.70924	2023-06-05 23:07:56.70924	2023-06-05 23:07:56.70924	f	f
13	Applecar		14	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:56.713578	2023-06-05 23:07:56.713578	2023-06-05 23:07:56.713578	f	f
14	Acapulco		15	t	Combine and shake all ingredients (except mint) with ice and strain into an old-fashioned glass over ice cubes. Add the sprig of mint and serve.	2023-06-05 23:07:56.718111	2023-06-05 23:07:56.718111	2023-06-05 23:07:56.718111	f	f
15	Affinity		16	t	In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.	2023-06-05 23:07:56.727302	2023-06-05 23:07:56.727302	2023-06-05 23:07:56.727302	f	f
16	Aviation	IBA,Classic	17	t	Add all ingredients into cocktail shaker filled with ice. Shake well and strain into cocktail glass. Garnish with a cherry.	2023-06-05 23:07:56.732881	2023-06-05 23:07:56.732881	2023-06-05 23:07:56.732881	f	f
17	After sex		18	t	Pour the vodka and creme over some ice cubes in a tall glass and fill up with juice. to make it beuty full make the top of the glass with a grenadine and sugar	2023-06-05 23:07:56.739429	2023-06-05 23:07:56.739429	2023-06-05 23:07:56.739429	f	f
18	Applejack		19	t	Add all ingredients into mixing glass, chill and strain into cocktail glass	2023-06-05 23:07:56.743502	2023-06-05 23:07:56.743502	2023-06-05 23:07:56.743502	f	f
19	Afterglow		20	f	Mix. Serve over ice.	2023-06-05 23:07:56.750177	2023-06-05 23:07:56.750177	2023-06-05 23:07:56.750177	f	f
20	Afternoon		21	t	Build into a suiting glass, with no ice. Cream on top if wanted. Served directly.	2023-06-05 23:07:56.755142	2023-06-05 23:07:56.755142	2023-06-05 23:07:56.755142	f	f
21	Alexander	IBA,Classic,Dairy	22	t	Shake all ingredients with ice and strain contents into a cocktail glass. Sprinkle nutmeg on top and serve.	2023-06-05 23:07:56.761398	2023-06-05 23:07:56.761398	2023-06-05 23:07:56.761398	f	f
22	Autodafé		23	t	Mix and fill up with soda water. Drunk by finns on a sunny day any time of the year and day.	2023-06-05 23:07:56.76693	2023-06-05 23:07:56.76693	2023-06-05 23:07:56.76693	f	f
23	Allegheny		24	t	Shake all ingredients (except lemon peel) with ice and strain into a cocktail glass. Top with the twist of lemon peel and serve.	2023-06-05 23:07:56.770323	2023-06-05 23:07:56.770323	2023-06-05 23:07:56.770323	f	f
24	Americano	IBA,Classic	25	t	Pour the Campari and vermouth over ice into glass, add a splash of soda water and garnish with half orange slice.	2023-06-05 23:07:56.777972	2023-06-05 23:07:56.777972	2023-06-05 23:07:56.777972	f	f
25	B-52	IBA,NewEra	26	t	Layer ingredients into a shot glass. Serve with a stirrer.	2023-06-05 23:07:56.785798	2023-06-05 23:07:56.785798	2023-06-05 23:07:56.785798	f	f
26	B-53		27	t	Layer the Kahlua, Sambucca and Grand Marnier into a shot glas in that order. Better than B-52	2023-06-05 23:07:56.791315	2023-06-05 23:07:56.791315	2023-06-05 23:07:56.791315	f	f
27	Bijou		28	t	Stir in mixing glass with ice and strain\r\n	2023-06-05 23:07:56.796406	2023-06-05 23:07:56.796406	2023-06-05 23:07:56.796406	f	f
28	Boxcar		29	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a sour glass.	2023-06-05 23:07:56.803976	2023-06-05 23:07:56.803976	2023-06-05 23:07:56.803976	f	f
29	Big Red		30	t	Pour ingredients into 1 ounce shot glass	2023-06-05 23:07:56.811311	2023-06-05 23:07:56.811311	2023-06-05 23:07:56.811311	f	f
30	Bellini	ContemporaryClassic,IBA	31	t	Pour peach purée into chilled flute, add sparkling wine. Stir gently.	2023-06-05 23:07:56.815606	2023-06-05 23:07:56.815606	2023-06-05 23:07:56.815606	f	f
31	Bramble	IBA,NewEra	32	t	Fill glass with crushed ice. Build gin, lemon juice and simple syrup over. Stir, and then pour blackberry liqueur over in a circular fashion to create marbling effect. Garnish with two blackberries and lemon slice.	2023-06-05 23:07:56.822153	2023-06-05 23:07:56.822153	2023-06-05 23:07:56.822153	f	f
32	Balmoral		33	t	In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.	2023-06-05 23:07:56.828252	2023-06-05 23:07:56.828252	2023-06-05 23:07:56.828252	f	f
33	Bluebird		34	t	In a mixing glass half-filled with crushed ice, combine the gin, triple sec, Curacao, and bitters. Stir well. Strain into a cocktail glass and garnish with the lemon twist and the cherry.	2023-06-05 23:07:56.833483	2023-06-05 23:07:56.833483	2023-06-05 23:07:56.833483	f	f
34	Brooklyn	Alcoholic,Sweet,DateNight,USA	35	t	Combine ingredients with ice and stir until well-chilled. Strain into a chilled cocktail glass.	2023-06-05 23:07:56.841631	2023-06-05 23:07:56.841631	2023-06-05 23:07:56.841631	f	f
35	Bora Bora		36	f	Prepare in a blender or shaker, serve in a highball glass on the rocks. Garnish with 1 slice of pineapple and one cherry.	2023-06-05 23:07:56.852293	2023-06-05 23:07:56.852293	2023-06-05 23:07:56.852293	f	f
36	Boomerang		37	t	In a mixing glass half-filled with ice cubes, combine the gin, vermouth, bitters, and maraschino liqueur. Stir well. Strain into a cocktail glass and garnish with the cherry.	2023-06-05 23:07:56.858754	2023-06-05 23:07:56.858754	2023-06-05 23:07:56.858754	f	f
37	Barracuda	IBA,NewEra	38	t	Shake pour ingredients with ice. Strain into glass, top with Sparkling wine.	2023-06-05 23:07:56.866556	2023-06-05 23:07:56.866556	2023-06-05 23:07:56.866556	f	f
38	Brigadier		39	t	Mix ingredients in a warmed mug and stir.	2023-06-05 23:07:56.874834	2023-06-05 23:07:56.874834	2023-06-05 23:07:56.874834	f	f
39	Broadside		40	t	Half fill the glass with ice cubes. Crush the wormwood and add to ice. Pour rum, scotch and butters, then serve!	2023-06-05 23:07:56.881701	2023-06-05 23:07:56.881701	2023-06-05 23:07:56.881701	f	f
40	Buccaneer		41	t	Pour the corona into an 18oz beer glass pour the bacardi limon into the beer stir very gently	2023-06-05 23:07:56.889967	2023-06-05 23:07:56.889967	2023-06-05 23:07:56.889967	f	f
41	Blackthorn		43	t	Stir sloe gin and vermouth with ice and strain into a cocktail glass. Add the twist of lemon peel and serve.	2023-06-05 23:07:56.897566	2023-06-05 23:07:56.897566	2023-06-05 23:07:56.897566	f	f
42	Bob Marley		44	t	Layer in a 2 oz shot glass or pony glass	2023-06-05 23:07:56.902611	2023-06-05 23:07:56.902611	2023-06-05 23:07:56.902611	f	f
43	Bible Belt		45	t	Mix all ingredients, and pour over ice.	2023-06-05 23:07:56.908528	2023-06-05 23:07:56.908528	2023-06-05 23:07:56.908528	f	f
44	Bubble Gum		46	t	Layer in order into a shot glass.	2023-06-05 23:07:56.914912	2023-06-05 23:07:56.914912	2023-06-05 23:07:56.914912	f	f
83	Egg Cream		94	f	Mix syrup and milk in a fountain glass. Add soda water, serve with a straw.	2023-06-05 23:07:57.128056	2023-06-05 23:07:57.128056	2023-06-05 23:07:57.128056	f	f
45	Baby Eskimo		48	t	Leave ice-cream out for about 10 minutes. Add ingredients in order, stir with chopstick (butter knife or spoon works too). Consume immediately and often. Nice and light, great for following a heavy drink.	2023-06-05 23:07:56.922044	2023-06-05 23:07:56.922044	2023-06-05 23:07:56.922044	f	f
46	Boston Sour		49	t	Shake juice of lemon, powdered sugar, blended whiskey, and egg white with cracked ice and strain into a whiskey sour glass. Add the slice of lemon, top with the cherry, and serve.	2023-06-05 23:07:56.927176	2023-06-05 23:07:56.927176	2023-06-05 23:07:56.927176	f	f
47	Bahama Mama		50	t	Add 2 parts club soda or more or less to taste.\r\n\r\nMix it all together and pour over a bunch of ice. Drink with a straw.	2023-06-05 23:07:56.935583	2023-06-05 23:07:56.935583	2023-06-05 23:07:56.935583	f	f
48	Casino	IBA	51	t	Pour all ingredients into shaker with ice cubes. Shake well. Strain into chilled cocktail glass. Garnish with a lemon twist and a maraschino cherry. Serve without a straw.	2023-06-05 23:07:56.946254	2023-06-05 23:07:56.946254	2023-06-05 23:07:56.946254	f	f
49	Cafe Savoy		52	t	Fill mug almost to top with coffee.Add milk, triple sec and brandy. Stir.	2023-06-05 23:07:56.952759	2023-06-05 23:07:56.952759	2023-06-05 23:07:56.952759	f	f
50	Caipirinha	ContemporaryClassic,IBA	53	t	Place lime and sugar into old fashioned glass and muddle (mash the two ingredients together using a muddler or a wooden spoon). Fill the glass with ice and add the Cachaça.	2023-06-05 23:07:56.956014	2023-06-05 23:07:56.956014	2023-06-05 23:07:56.956014	f	f
51	Cream Soda		54	t	Pour 1oz of Spiced Rum into a highball glass with ice. Fill with Ginger Ale.	2023-06-05 23:07:56.960728	2023-06-05 23:07:56.960728	2023-06-05 23:07:56.960728	f	f
52	Cuba Libra		55	t	Fill tall glass with ice cubes. Add rum. Rub cut edge of lime on rim of glass then squeeze juice into glass. Fill with Coca-Cola. Garnish with lime slice. Enjoy!	2023-06-05 23:07:56.963236	2023-06-05 23:07:56.963236	2023-06-05 23:07:56.963236	f	f
53	Cherry Rum		56	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:56.968738	2023-06-05 23:07:56.968738	2023-06-05 23:07:56.968738	f	f
54	Cuba Libre	IBA,ContemporaryClassic	57	t	Build all ingredients in a Collins glass filled with ice. Garnish with lime wedge.	2023-06-05 23:07:56.972888	2023-06-05 23:07:56.972888	2023-06-05 23:07:56.972888	f	f
55	Corn n Oil		58	t	Cut the half lime in half again. Add the lime, falernum, and bitters to a rocks glass. Muddle. Add the rum. (Aged Barbados rum such as Plantation 5 Year is recommended). Add ice and stir. Float the blackstrap rum on top. Serve with a straw.	2023-06-05 23:07:56.976515	2023-06-05 23:07:56.976515	2023-06-05 23:07:56.976515	f	f
56	Citrus Coke		59	t	Pour half of coke in a glass. Then add Bacardi and top it off with the remaining coke. Stir and drink up!	2023-06-05 23:07:56.983843	2023-06-05 23:07:56.983843	2023-06-05 23:07:56.983843	f	f
57	Casa Blanca		60	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:56.988114	2023-06-05 23:07:56.988114	2023-06-05 23:07:56.988114	f	f
58	Clover Club	IBA,Classic	61	t	Dry shake ingredients to emulsify, add ice, shake and served straight up.	2023-06-05 23:07:56.993872	2023-06-05 23:07:56.993872	2023-06-05 23:07:56.993872	f	f
59	City Slicker		63	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.	2023-06-05 23:07:57.000527	2023-06-05 23:07:57.000527	2023-06-05 23:07:57.000527	f	f
60	Campari Beer		64	t	Use a 15 oz glass. Add Campari first. Fill with beer.	2023-06-05 23:07:57.005356	2023-06-05 23:07:57.005356	2023-06-05 23:07:57.005356	f	f
61	Chicago Fizz		65	t	Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.	2023-06-05 23:07:57.009405	2023-06-05 23:07:57.009405	2023-06-05 23:07:57.009405	f	f
62	Cosmopolitan	IBA,ContemporaryClassic	66	t	Add all ingredients into cocktail shaker filled with ice. Shake well and double strain into large cocktail glass. Garnish with lime wheel.	2023-06-05 23:07:57.015762	2023-06-05 23:07:57.015762	2023-06-05 23:07:57.015762	f	f
63	Casino Royale		68	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a sour glass.	2023-06-05 23:07:57.0222	2023-06-05 23:07:57.0222	2023-06-05 23:07:57.0222	f	f
64	Corpse Reviver		69	t	Shake, strain, straight up, cocktail glass rinsed with absinthe\r\n	2023-06-05 23:07:57.028601	2023-06-05 23:07:57.028601	2023-06-05 23:07:57.028601	f	f
65	Chocolate Milk		70	t	Put the milk in the bottom, pour the Liquer on top and add the dash of amaretto. Do not mix. SLAM IT!	2023-06-05 23:07:57.03645	2023-06-05 23:07:57.03645	2023-06-05 23:07:57.03645	f	f
66	Clove Cocktail		71	t	Stir all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.040667	2023-06-05 23:07:57.040667	2023-06-05 23:07:57.040667	f	f
67	Coffee Liqueur		72	t	Combine coffee, sugar and water. Simmer 1 hour and let cool. Add vanilla and vodka. Age in sealed jar 2 to 3 weeks.	2023-06-05 23:07:57.045649	2023-06-05 23:07:57.045649	2023-06-05 23:07:57.045649	f	f
68	Coke and Drops		73	f	Take a glass, pour the Coke in the glass, then you take 7 drops of lemon juice. Granish with a lemon slice on the rim of the glass.	2023-06-05 23:07:57.052532	2023-06-05 23:07:57.052532	2023-06-05 23:07:57.052532	f	f
69	Cranberry Punch		75	f	Combine first four ingredients. Stir until sugar is dissolved, chill. Then add ginger ale just before serving. Add ice ring to keep punch cold.	2023-06-05 23:07:57.056613	2023-06-05 23:07:57.056613	2023-06-05 23:07:57.056613	f	f
70	Derby	Classic,IBA	76	t	Pour all ingredients into a mixing glass with ice. Stir. Strain into a cocktail glass. Garnish with a sprig of fresh mint in the drink.	2023-06-05 23:07:57.064081	2023-06-05 23:07:57.064081	2023-06-05 23:07:57.064081	f	f
71	Diesel		77	t	Pour the lager first then add the blackcurrant cordial. Top up with the cider. The colour sholud be very dark approaching the colour of Guiness.	2023-06-05 23:07:57.070297	2023-06-05 23:07:57.070297	2023-06-05 23:07:57.070297	f	f
72	Daiquiri	IBA,Classic,Beach	78	t	Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.	2023-06-05 23:07:57.075327	2023-06-05 23:07:57.075327	2023-06-05 23:07:57.075327	f	f
73	Danbooka		79	t	pour it in and mix it.	2023-06-05 23:07:57.079511	2023-06-05 23:07:57.079511	2023-06-05 23:07:57.079511	f	f
74	Downshift		80	t	Start with the Sprite. Next comes the tequila. After that, add the Minute Maid Fruit Punch, then float the 151. Rocks optional.	2023-06-05 23:07:57.082823	2023-06-05 23:07:57.082823	2023-06-05 23:07:57.082823	f	f
75	Dragonfly		81	t	In a highball glass almost filled with ice cubes, combine the gin and ginger ale. Stir well. Garnish with the lime wedge.	2023-06-05 23:07:57.088683	2023-06-05 23:07:57.088683	2023-06-05 23:07:57.088683	f	f
76	Dry Martini	IBA,Classic,Christmas,Alcoholic	82	t	Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.	2023-06-05 23:07:57.093275	2023-06-05 23:07:57.093275	2023-06-05 23:07:57.093275	f	f
77	Dry Rob Roy		83	t	In a mixing glass half-filled with ice cubes, combine the Scotch and vermouth. Stir well. Strain into a cocktail glass. Garnish with the lemon twist.	2023-06-05 23:07:57.098251	2023-06-05 23:07:57.098251	2023-06-05 23:07:57.098251	f	f
78	Dark and Stormy	IBA,NewEra	87	t	In a highball glass filled with ice add 6cl dark rum and top with ginger beer. Garnish with lime wedge.	2023-06-05 23:07:57.10511	2023-06-05 23:07:57.10511	2023-06-05 23:07:57.10511	f	f
79	Dark Caipirinha		88	t	Muddle the sugar into the lime wedges in an old-fashioned glass.\r\nFill the glass with ice cubes.\r\nPour the cachaca into the glass.\r\nStir well.	2023-06-05 23:07:57.109046	2023-06-05 23:07:57.109046	2023-06-05 23:07:57.109046	f	f
80	Damned if you do		90	t	Pour into shot glass. Put in mouth. Repeat as deemed necessary.	2023-06-05 23:07:57.11419	2023-06-05 23:07:57.11419	2023-06-05 23:07:57.11419	f	f
81	Dubonnet Cocktail		91	t	Stir all ingredients (except lemon peel) with ice and strain into a cocktail glass. Add the twist of lemon peel and serve.	2023-06-05 23:07:57.118598	2023-06-05 23:07:57.118598	2023-06-05 23:07:57.118598	f	f
82	Death in the Afternoon	Drunk	93	t	Easy as you like, pour the absinthe into a chilled glass, top with champagne. Must be drunk mid afternoon for the optimum effect.	2023-06-05 23:07:57.124747	2023-06-05 23:07:57.124747	2023-06-05 23:07:57.124747	f	f
84	English Highball		96	t	Pour brandy, gin, and sweet vermouth into a highball glass over ice cubes. Fill with carbonated water. Add the twist of lemon peel, stir, and serve. (Ginger ale may be substituted for carbonated water, if preferred.)	2023-06-05 23:07:57.133583	2023-06-05 23:07:57.133583	2023-06-05 23:07:57.133583	f	f
85	Espresso Martini	IBA,NewEra	97	t	Pour ingredients into shaker filled with ice, shake vigorously, and strain into chilled martini glass	2023-06-05 23:07:57.137785	2023-06-05 23:07:57.137785	2023-06-05 23:07:57.137785	f	f
86	Espresso Rumtini	DinnerParty,StrongFlavor	98	t	Mix together in a cocktail glass. Garnish with some choclate powder and coffee beans	2023-06-05 23:07:57.142042	2023-06-05 23:07:57.142042	2023-06-05 23:07:57.142042	f	f
87	Egg Nog - Healthy		99	f	Whip egg substitute and sugar together, combine with the two kinds of milk, vanilla, and rum. Mix well. Chill over night. Sprinkle with nutmeg. Makes 6 servings.	2023-06-05 23:07:57.147587	2023-06-05 23:07:57.147587	2023-06-05 23:07:57.147587	f	f
88	English Rose Cocktail		100	t	Rub rim of cocktail glass with lemon juice and dip rim of glass in powdered sugar. Shake all ingredients (except cherry) with ice and strain into sugar-rimmed glass. Top with the cherry and serve.	2023-06-05 23:07:57.15681	2023-06-05 23:07:57.15681	2023-06-05 23:07:57.15681	f	f
89	Elderflower Caipirinha	Brazilian	101	t	Take the glass and muddle the lime in it. Fill the glass with crushed ice and add the Cachaca. Stir well and top with some more crushed ice. Garnish with lime and enjoy!	2023-06-05 23:07:57.164078	2023-06-05 23:07:57.164078	2023-06-05 23:07:57.164078	f	f
90	Foxy Lady		106	t	Shake all ingredients with ice, strain into a chilled cocktail glass, and serve.	2023-06-05 23:07:57.172816	2023-06-05 23:07:57.172816	2023-06-05 23:07:57.172816	f	f
91	French 75	IBA,ContemporaryClassic	107	t	Combine gin, sugar, and lemon juice in a cocktail shaker filled with ice. Shake vigorously and strain into a chilled champagne glass. Top up with Champagne. Stir gently.	2023-06-05 23:07:57.177321	2023-06-05 23:07:57.177321	2023-06-05 23:07:57.177321	f	f
92	Frisco Sour		109	t	Shake all ingredients (except slices of lemon and lime) with ice and strain into a whiskey sour glass. Decorate with the slices of lemon and lime and serve.	2023-06-05 23:07:57.18586	2023-06-05 23:07:57.18586	2023-06-05 23:07:57.18586	f	f
93	Fruit Shake		110	f	Blend til smooth.	2023-06-05 23:07:57.193639	2023-06-05 23:07:57.193639	2023-06-05 23:07:57.193639	f	f
94	Freddy Kruger		112	t	make it an ample size shot!!	2023-06-05 23:07:57.202286	2023-06-05 23:07:57.202286	2023-06-05 23:07:57.202286	f	f
95	Funk and Soul		113	t	Mix all ingredients together and strain into a Collins glass. Use Jamaican rum where possible for a more authentic taste.	2023-06-05 23:07:57.206955	2023-06-05 23:07:57.206955	2023-06-05 23:07:57.206955	f	f
96	Fuzzy Asshole		114	t	fill coffe mug half full of coffee. Fill the other half full of Peach Schnapps. Stir and drink while hot.	2023-06-05 23:07:57.215402	2023-06-05 23:07:57.215402	2023-06-05 23:07:57.215402	f	f
97	French Martini	NewEra,IBA	115	t	Pour all ingredients into shaker with ice cubes. Shake well and strain into a chilled cocktail glass. Squeeze oil from lemon peel onto the drink.	2023-06-05 23:07:57.218889	2023-06-05 23:07:57.218889	2023-06-05 23:07:57.218889	f	f
98	French Negroni		116	t	Add ice to a shaker and pour in all ingredients.\nUsing a bar spoon, stir 40 to 45 revolutions or until thoroughly chilled.\nStrain into a martini glass or over ice into a rocks glass. Garnish with orange twist.	2023-06-05 23:07:57.224539	2023-06-05 23:07:57.224539	2023-06-05 23:07:57.224539	f	f
99	Fahrenheit 5000		117	t	Cover bottom of shot glass with Tabasco Sauce and then fill with half Firewater and half Absolut Peppar.	2023-06-05 23:07:57.230881	2023-06-05 23:07:57.230881	2023-06-05 23:07:57.230881	f	f
100	Flying Dutchman		118	t	In an old-fashioned glass almost filled with ice cubes, combine the gin and triple sec. Stir well.	2023-06-05 23:07:57.236342	2023-06-05 23:07:57.236342	2023-06-05 23:07:57.236342	f	f
101	Frozen Daiquiri		119	t	Combine all ingredients (except for the cherry) in an electric blender and blend at a low speed for five seconds, then blend at a high speed until firm. Pour contents into a champagne flute, top with the cherry, and serve.	2023-06-05 23:07:57.239959	2023-06-05 23:07:57.239959	2023-06-05 23:07:57.239959	f	f
102	Fruit Flip-Flop		120	f	Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.	2023-06-05 23:07:57.246818	2023-06-05 23:07:57.246818	2023-06-05 23:07:57.246818	f	f
103	Flying Scotchman		121	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.250742	2023-06-05 23:07:57.250742	2023-06-05 23:07:57.250742	f	f
104	French Connection	IBA,ContemporaryClassic	122	t	Pour all ingredients directly into old fashioned glass filled with ice cubes. Stir gently.	2023-06-05 23:07:57.260038	2023-06-05 23:07:57.260038	2023-06-05 23:07:57.260038	f	f
105	Flaming Dr. Pepper		123	t	Add Amaretto, Bacardi, and vodka. Mix in the Dr. Pepper and beer	2023-06-05 23:07:57.263396	2023-06-05 23:07:57.263396	2023-06-05 23:07:57.263396	f	f
106	Frozen Mint Daiquiri		126	t	Combine all ingredients with 1 cup of crushed ice in an electric blender. Blend at a low speed for a short length of time. Pour into an old-fashioned glass and serve.	2023-06-05 23:07:57.272679	2023-06-05 23:07:57.272679	2023-06-05 23:07:57.272679	f	f
107	Frozen Pineapple Daiquiri		127	t	Combine all ingredients with 1 cup of crushed ice in an electric blender. Blend at a low speed for a short length of time. Pour into a cocktail glass and serve.	2023-06-05 23:07:57.278007	2023-06-05 23:07:57.278007	2023-06-05 23:07:57.278007	f	f
108	GG		128	f	Pour the Galliano liqueur over ice. Fill the remainder of the glass with ginger ale and thats all there is to it. You now have a your very own GG.	2023-06-05 23:07:57.283688	2023-06-05 23:07:57.283688	2023-06-05 23:07:57.283688	f	f
109	Gimlet		129	t	Add all the ingredients to a shaker and fill with ice.\r\n\r\nShake, and strain into a chilled cocktail glass or an Old Fashioned glass filled with fresh ice.\r\n\r\nGarnish with a lime wheel.	2023-06-05 23:07:57.286363	2023-06-05 23:07:57.286363	2023-06-05 23:07:57.286363	f	f
110	Godchild		130	t	Shake all ingredients well with cracked ice, strain into a champagne flute, and serve.	2023-06-05 23:07:57.292087	2023-06-05 23:07:57.292087	2023-06-05 23:07:57.292087	f	f
111	Gin Fizz	IBA,Classic	131	t	Shake all ingredients with ice cubes, except soda water. Pour into glass. Top with soda water.	2023-06-05 23:07:57.296446	2023-06-05 23:07:57.296446	2023-06-05 23:07:57.296446	f	f
112	Gin Sour	Sour	132	t	In a shaker half-filled with ice cubes, combine the gin, lemon juice, and sugar. Shake well. Strain into a sour glass and garnish with the orange slice and the cherry.	2023-06-05 23:07:57.300723	2023-06-05 23:07:57.300723	2023-06-05 23:07:57.300723	f	f
113	Gagliardo		133	t	Shake well and serve in a cocktail glass. This is a home cocktail of American/Internet Bar del Pozzo, Pavia, Italy.	2023-06-05 23:07:57.306818	2023-06-05 23:07:57.306818	2023-06-05 23:07:57.306818	f	f
114	Godmother	IBA,ContemporaryClassic	134	t	Pour vodka and amaretto into an old-fashioned glass over ice and serve.	2023-06-05 23:07:57.312669	2023-06-05 23:07:57.312669	2023-06-05 23:07:57.312669	f	f
115	Godfather	IBA,ContemporaryClassic	135	t	Pour all ingredients directly into old fashioned glass filled with ice cubes. Stir gently.	2023-06-05 23:07:57.315997	2023-06-05 23:07:57.315997	2023-06-05 23:07:57.315997	f	f
116	Gin Tonic		137	t	Fill a highball glass with ice, pour the gin, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.	2023-06-05 23:07:57.320401	2023-06-05 23:07:57.320401	2023-06-05 23:07:57.320401	f	f
117	Gin Toddy		138	t	Mix powdered sugar and water in an old-fashioned glass. Add gin and one ice cube. Stir, add the twist of lemon peel, and serve.	2023-06-05 23:07:57.326987	2023-06-05 23:07:57.326987	2023-06-05 23:07:57.326987	f	f
118	Gin Smash	Citrus,StrongFlavor	139	t	Muddle sugar with carbonated water and mint sprigs in an old-fashioned glass. Add gin and 1 ice cube. Stir, add the orange slice and the cherry, and serve.	2023-06-05 23:07:57.332142	2023-06-05 23:07:57.332142	2023-06-05 23:07:57.332142	f	f
119	Gin Daisy		140	t	In a shaker half-filled with ice cubes, combine the gin, lemon juice, sugar, and grenadine. Shake well. Pour into an old-fashioned glass and garnish with the cherry and the orange slice.	2023-06-05 23:07:57.340128	2023-06-05 23:07:57.340128	2023-06-05 23:07:57.340128	f	f
120	Gin Sling		142	t	Dissolve powdered sugar in mixture of water and juice of lemon. Add gin. Pour into an old-fashioned glass over ice cubes and stir. Add the twist of orange peel and serve.	2023-06-05 23:07:57.348361	2023-06-05 23:07:57.348361	2023-06-05 23:07:57.348361	f	f
121	Greyhound		143	t	Add the vodka to a Collins glass filled with ice.\nTop with grapefruit juice and stir.\n\n	2023-06-05 23:07:57.354442	2023-06-05 23:07:57.354442	2023-06-05 23:07:57.354442	f	f
122	Gin Rickey		144	t	Half-fill a tall glass with ice. Mix the gin and Grenadine together and pour over the ice. Add the lime or lemon juice and top off with soda water. Decorate the glass with lime and/or lemon slices.	2023-06-05 23:07:57.358504	2023-06-05 23:07:57.358504	2023-06-05 23:07:57.358504	f	f
123	Gin Squirt		145	t	Stir gin, grenadine, and powdered sugar with ice and strain into a highball glass over ice cubes. Fill with carbonated water and stir. Decorate with the pineapple chunks and the strawberries and serve.	2023-06-05 23:07:57.365016	2023-06-05 23:07:57.365016	2023-06-05 23:07:57.365016	f	f
124	Grand Blue		146	t	Serve in an old fashioned glass.	2023-06-05 23:07:57.371259	2023-06-05 23:07:57.371259	2023-06-05 23:07:57.371259	f	f
125	Gin Cooler		147	t	Stir powdered sugar and 2 oz. carbonated water in a collins glass. Fill glass with ice and add gin. Fill with carbonated water and stir. Add the lemon peel and the orange spiral so that the end of the orange spiral dangles over rim of glass.	2023-06-05 23:07:57.377682	2023-06-05 23:07:57.377682	2023-06-05 23:07:57.377682	f	f
126	Gin Swizzle		148	t	In a shaker half-filled with ice cubes, combine the lime juice, sugar, gin, and bitters. Shake well. Almost fill a colling glass with ice cubes. Stir until the glass is frosted. Strain the mixture in the shaker into the glass and add the club soda.	2023-06-05 23:07:57.380156	2023-06-05 23:07:57.380156	2023-06-05 23:07:57.380156	f	f
127	Grass Skirt		149	t	In a shaker half-filled with ice cubes, combine the gin, triple sec, pineapple juice, and grenadine. Shake well. Pour into an old-fashioned glass and garnish with the pineapple slice.	2023-06-05 23:07:57.386916	2023-06-05 23:07:57.386916	2023-06-05 23:07:57.386916	f	f
128	Grasshopper	IBA,ContemporaryClassic,Halloween	150	t	Pour ingredients into a cocktail shaker with ice. Shake briskly and then strain into a chilled cocktail glass.	2023-06-05 23:07:57.392866	2023-06-05 23:07:57.392866	2023-06-05 23:07:57.392866	f	f
129	Grim Reaper		151	t	Mix Kahlua and 151 in glass. Quickly add ice and pour grenadine over ice to give ice red tint.	2023-06-05 23:07:57.398122	2023-06-05 23:07:57.398122	2023-06-05 23:07:57.398122	f	f
130	Gin and Soda	Clear,Alcoholic	152	t	Pour the Gin and Soda water into a highball glass almost filled with ice cubes.\r\nStir well.\r\nGarnish with the lime wedge.	2023-06-05 23:07:57.402258	2023-06-05 23:07:57.402258	2023-06-05 23:07:57.402258	f	f
131	H.D.		153	t	Mix the whisky and Baileys Cream in a beer-glass (at least 50 cl). Fill the rest of the glass with coffee.	2023-06-05 23:07:57.406422	2023-06-05 23:07:57.406422	2023-06-05 23:07:57.406422	f	f
132	Honey Bee	Sweet	154	t	Shake ingredients with crushed ice\r\n	2023-06-05 23:07:57.410487	2023-06-05 23:07:57.410487	2023-06-05 23:07:57.410487	f	f
133	Herbal flame		156	t	Pour Hot Damn 100 in bottom of a jar or regular glass. Fill the rest of the glass with sweet tea. Stir with spoon, straw, or better yet a cinnamon stick and leave it in.	2023-06-05 23:07:57.416947	2023-06-05 23:07:57.416947	2023-06-05 23:07:57.416947	f	f
134	Havana Cocktail		161	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.	2023-06-05 23:07:57.423646	2023-06-05 23:07:57.423646	2023-06-05 23:07:57.423646	f	f
135	Hot Creamy Bush		164	t	Combine all ingredients in glass	2023-06-05 23:07:57.430391	2023-06-05 23:07:57.430391	2023-06-05 23:07:57.430391	f	f
136	Harvey Wallbanger	IBA,ContemporaryClassic	165	t	Stir the vodka and orange juice with ice in the glass, then float the Galliano on top. Garnish and serve.	2023-06-05 23:07:57.434899	2023-06-05 23:07:57.434899	2023-06-05 23:07:57.434899	f	f
137	Hawaiian Cocktail		166	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.439114	2023-06-05 23:07:57.439114	2023-06-05 23:07:57.439114	f	f
138	Hemingway Special	IBA,ContemporaryClassic	167	t	Pour all ingredients into a shaker with ice. Shake.	2023-06-05 23:07:57.443251	2023-06-05 23:07:57.443251	2023-06-05 23:07:57.443251	f	f
139	Highland Fling Cocktail		168	t	Stir all ingredients (except olive) with ice and strain into a cocktail glass. Add the olive and serve.	2023-06-05 23:07:57.448346	2023-06-05 23:07:57.448346	2023-06-05 23:07:57.448346	f	f
140	Hot Chocolate to Die for		169	f	Melt the chocolate, butter and vanilla in a double boiler. When just smooth stir in the cream.	2023-06-05 23:07:57.453794	2023-06-05 23:07:57.453794	2023-06-05 23:07:57.453794	f	f
141	Ice Pick		171	t	Put Vodka in glass fill with iced tea. Stir in lemon to taste.	2023-06-05 23:07:57.463408	2023-06-05 23:07:57.463408	2023-06-05 23:07:57.463408	f	f
142	Iced Coffee		172	f	Mix together until coffee and sugar is dissolved. Add milk. Shake well. Using a blender or milk shake maker produces a very foamy drink. Serve in coffee mug.	2023-06-05 23:07:57.468401	2023-06-05 23:07:57.468401	2023-06-05 23:07:57.468401	f	f
143	Irish Cream		173	t	Mix scotch and milk. Add half-and-half. Add rest.	2023-06-05 23:07:57.473708	2023-06-05 23:07:57.473708	2023-06-05 23:07:57.473708	f	f
144	Irish Coffee	IBA,ContemporaryClassic	174	t	Heat the coffee, whiskey and sugar; do not boil. Pour into glass and top with cream; serve hot.	2023-06-05 23:07:57.480818	2023-06-05 23:07:57.480818	2023-06-05 23:07:57.480818	f	f
145	Irish Spring		175	t	Pour all ingredients (except orange slice and cherry) into a collins glass over ice cubes. Garnish with the slice of orange, add the cherry on top, and serve.	2023-06-05 23:07:57.486512	2023-06-05 23:07:57.486512	2023-06-05 23:07:57.486512	f	f
146	Imperial Fizz		176	t	Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.	2023-06-05 23:07:57.494088	2023-06-05 23:07:57.494088	2023-06-05 23:07:57.494088	f	f
147	Irish Russian		177	t	Add the ingredients in the order listed in the recipe. Care must be taken when adding the Guinness to prevent an excess of foam. Do Not add ice.	2023-06-05 23:07:57.499277	2023-06-05 23:07:57.499277	2023-06-05 23:07:57.499277	f	f
148	Imperial Cocktail		178	t	Shake with ice and strain into cocktail glass.	2023-06-05 23:07:57.505124	2023-06-05 23:07:57.505124	2023-06-05 23:07:57.505124	f	f
149	Iced Coffee Fillip		179	t	Mix together in a coffee mug and chill before serving.	2023-06-05 23:07:57.509949	2023-06-05 23:07:57.509949	2023-06-05 23:07:57.509949	f	f
150	Irish Curdling Cow		180	t	Pour Irish Cream, Vodka, and Bourbon in a glass. Add some ice and mix in the orange juice.	2023-06-05 23:07:57.513332	2023-06-05 23:07:57.513332	2023-06-05 23:07:57.513332	f	f
151	Jam Donut		181	t	Coat the rim of a shot glass with sugar using sugar syrup to stick. Add the Chambord raspberry liqueur to the shot glass, and carefully layer the Baileys Irish Cream on top. Serve.	2023-06-05 23:07:57.518687	2023-06-05 23:07:57.518687	2023-06-05 23:07:57.518687	f	f
152	Jackhammer		183	t	Serve over ice- Warning,Deadly!	2023-06-05 23:07:57.525655	2023-06-05 23:07:57.525655	2023-06-05 23:07:57.525655	f	f
153	Jelly Bean		184	t	mix equal parts in pony glass-tastes just like a jelly bean!	2023-06-05 23:07:57.529236	2023-06-05 23:07:57.529236	2023-06-05 23:07:57.529236	f	f
154	Jello shots		185	t	Boil 3 cups of water then add jello. Mix jello and water until jello is completely disolved. Add the two cups of vodka and mix together. Pour mixture into plastic shot glasses and chill until firm. Then, eat away...	2023-06-05 23:07:57.533302	2023-06-05 23:07:57.533302	2023-06-05 23:07:57.533302	f	f
155	Jamaica Kiss		186	t	Fill a tumbler with ice cubes. Add a shot of Tia Maria and a shot of Jamaican light rum. Fill the tumbler with milk. Blend until smooth and serve immediately.	2023-06-05 23:07:57.538305	2023-06-05 23:07:57.538305	2023-06-05 23:07:57.538305	f	f
156	John Collins	IBA	187	t	Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.	2023-06-05 23:07:57.542718	2023-06-05 23:07:57.542718	2023-06-05 23:07:57.542718	f	f
157	Japanese Fizz		188	t	Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.	2023-06-05 23:07:57.550127	2023-06-05 23:07:57.550127	2023-06-05 23:07:57.550127	f	f
158	Jamaican Coffee		189	t	Stir the rum, coffee and water together. Top with the whipped cream. Sprinkle with a pinch of well ground coffee and drink with a straw.	2023-06-05 23:07:57.556185	2023-06-05 23:07:57.556185	2023-06-05 23:07:57.556185	f	f
159	Just a Moonmint		190	f	Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.	2023-06-05 23:07:57.560627	2023-06-05 23:07:57.560627	2023-06-05 23:07:57.560627	f	f
160	Jewel Of The Nile		191	t	In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.	2023-06-05 23:07:57.562988	2023-06-05 23:07:57.562988	2023-06-05 23:07:57.562988	f	f
161	Jack Rose Cocktail	Beach	192	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.568089	2023-06-05 23:07:57.568089	2023-06-05 23:07:57.568089	f	f
162	Kir	IBA,ContemporaryClassic	194	t	Add the crème de cassis to the bottom of the glass, then top up with wine.	2023-06-05 23:07:57.573151	2023-06-05 23:07:57.573151	2023-06-05 23:07:57.573151	f	f
163	Karsk		195	t	Put a copper coin in a coffe-cup and fill up with coffee until you no longer see the coin, then add alcohol until you see the coin. Norwegian speciality.	2023-06-05 23:07:57.576678	2023-06-05 23:07:57.576678	2023-06-05 23:07:57.576678	f	f
164	Kamikaze	IBA,NewEra	196	t	Shake all ingredients together with ice. Strain into glass, garnish and serve.	2023-06-05 23:07:57.580557	2023-06-05 23:07:57.580557	2023-06-05 23:07:57.580557	f	f
165	Kir Royale		197	t	Pour Creme de cassis in glass, gently pour champagne on top	2023-06-05 23:07:57.584886	2023-06-05 23:07:57.584886	2023-06-05 23:07:57.584886	f	f
166	Kiwi Lemon		198	t	Mix in highball glass. Stirr. Garnish with slice of kiwi.	2023-06-05 23:07:57.588255	2023-06-05 23:07:57.588255	2023-06-05 23:07:57.588255	f	f
167	Kurant Tea		199	t	Pour Absolut Kurant into a comfortably big tea-cup. Add the not too hot(!) apple tea and, if you like, some sugar. Enjoy!	2023-06-05 23:07:57.593814	2023-06-05 23:07:57.593814	2023-06-05 23:07:57.593814	f	f
168	Kioki Coffee		200	t	Stir. Add whipped cream to the top.	2023-06-05 23:07:57.599641	2023-06-05 23:07:57.599641	2023-06-05 23:07:57.599641	f	f
169	Kiss me Quick		202	t	mix in the glass	2023-06-05 23:07:57.604128	2023-06-05 23:07:57.604128	2023-06-05 23:07:57.604128	f	f
170	Kool-Aid Shot		203	t	Pour into a large glass with ice and stir. Add a little cranberry juice to taste.	2023-06-05 23:07:57.613352	2023-06-05 23:07:57.613352	2023-06-05 23:07:57.613352	f	f
171	Kool First Aid		204	t	Add Kool Aid to a double shot glass, and top with rum. Slam and shoot.	2023-06-05 23:07:57.618613	2023-06-05 23:07:57.618613	2023-06-05 23:07:57.618613	f	f
172	Kentucky B And B		205	t	Pour the bourbon and Benedictine into a brandy snifter.	2023-06-05 23:07:57.627249	2023-06-05 23:07:57.627249	2023-06-05 23:07:57.627249	f	f
173	Kentucky Colonel		206	t	In a shaker half-filled with ice cubes combine the courbon and Benedictine. Shake and strain into a cocktail glass. Garnish with the lemon twist.	2023-06-05 23:07:57.630493	2023-06-05 23:07:57.630493	2023-06-05 23:07:57.630493	f	f
174	Kiwi Papaya Smoothie		208	f	Throw everything into a blender and liquify.	2023-06-05 23:07:57.636316	2023-06-05 23:07:57.636316	2023-06-05 23:07:57.636316	f	f
175	Kill the cold Smoothie		209	f	Juice ginger and lemon and add it to hot water. You may add cardomom.	2023-06-05 23:07:57.641774	2023-06-05 23:07:57.641774	2023-06-05 23:07:57.641774	f	f
176	Limeade		210	f	In a large glass, put the lime juice and sugar, and stir well. Add cold seltzer water to fill. Put the lime peels in the glass. Drink. Repeat until limes or soda run out.	2023-06-05 23:07:57.646431	2023-06-05 23:07:57.646431	2023-06-05 23:07:57.646431	f	f
177	Lunch Box		211	t	Fill a pint glass almost full with beer. Then fill the rest with orange juice (careful not to fill it to the top). Then take the shot of Amaretto and drop it in.	2023-06-05 23:07:57.651188	2023-06-05 23:07:57.651188	2023-06-05 23:07:57.651188	f	f
178	Lemon Drop	IBA,NewEra	212	t	Shake and strain into a chilled cocktail glass rimmed with sugar.	2023-06-05 23:07:57.655854	2023-06-05 23:07:57.655854	2023-06-05 23:07:57.655854	f	f
179	Long vodka		214	t	Shake a tall glass with ice cubes and Angostura, coating the inside of the glass. Por the vodka onto this, add 1 slice of lime and squeeze juice out of remainder, mix with tonic, stir and voila you have a Long Vodka	2023-06-05 23:07:57.661451	2023-06-05 23:07:57.661451	2023-06-05 23:07:57.661451	f	f
180	Lassi Khara		215	f	Blend (frappe) in blender until frothy. Add torn curry leaves and serve cold.	2023-06-05 23:07:57.668627	2023-06-05 23:07:57.668627	2023-06-05 23:07:57.668627	f	f
181	Loch Lomond		218	t	In a mixing glass half-filled with ice cubes, combine the Scotch, Drambuie, and vermouth. Stir well. Strain into a cocktail glass. Garnish with the lemon twist.	2023-06-05 23:07:57.677935	2023-06-05 23:07:57.677935	2023-06-05 23:07:57.677935	f	f
182	London Town		219	t	In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.	2023-06-05 23:07:57.684079	2023-06-05 23:07:57.684079	2023-06-05 23:07:57.684079	f	f
183	Lassi - Mango		220	f	Put it all in a blender and pour over crushed ice. You can also use other fruits like strawberries and bananas.	2023-06-05 23:07:57.688334	2023-06-05 23:07:57.688334	2023-06-05 23:07:57.688334	f	f
184	Lassi - Sweet		221	f	Put all ingredients into a blender and blend until nice and frothy. Serve chilled.	2023-06-05 23:07:57.694627	2023-06-05 23:07:57.694627	2023-06-05 23:07:57.694627	f	f
185	Lord And Lady		223	t	Pour the rum and Tia Maria into an old-fashioned glass almost filled with ice cubes. Stir well.	2023-06-05 23:07:57.702295	2023-06-05 23:07:57.702295	2023-06-05 23:07:57.702295	f	f
186	Lady Love Fizz		224	t	Shake all ingredients (except carbonated water) with ice and strain into a cocktail glass over two ice cubes. Fill with carbonated water, stir, and serve.	2023-06-05 23:07:57.706867	2023-06-05 23:07:57.706867	2023-06-05 23:07:57.706867	f	f
187	Long Island Tea	Strong,Asia,StrongFlavor,Brunch,Vegetarian,Sour	225	t	Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.	2023-06-05 23:07:57.713631	2023-06-05 23:07:57.713631	2023-06-05 23:07:57.713631	f	f
188	Lone Tree Cooler		226	t	Stir powdered sugar and 2 oz. carbonated water in a collins glass. Fill glass with ice, add gin and vermouth, and stir. Fill with carbonated water and stir again. Add the twist of lemon peel and the orange spiral so that the end dangles over rim of glass.	2023-06-05 23:07:57.722224	2023-06-05 23:07:57.722224	2023-06-05 23:07:57.722224	f	f
189	Lone Tree Cocktail		227	t	Stir ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.724049	2023-06-05 23:07:57.724049	2023-06-05 23:07:57.724049	f	f
190	Lazy Coconut Paloma	Lazy, Sharp	228	t	Mix the coconut liqueur (preferably tequila) with the grapefruit juice and top with soda water. Garnish with a large grapefruit slice against the inside of the glass.	2023-06-05 23:07:57.72747	2023-06-05 23:07:57.72747	2023-06-05 23:07:57.72747	f	f
191	Long Island Iced Tea	IBA,ContemporaryClassic	229	t	Mix all contents in a highball glass and sitr gently. Add dash of Coca-Cola for the coloring and garnish with lemon or lime twist.	2023-06-05 23:07:57.732788	2023-06-05 23:07:57.732788	2023-06-05 23:07:57.732788	f	f
192	Lemon Elderflower Spritzer	Summer, Fresh, Refreshing	230	t	Pour all ingredients over ice, stir and enjoy!\r\n	2023-06-05 23:07:57.745401	2023-06-05 23:07:57.745401	2023-06-05 23:07:57.745401	f	f
193	Mojito	IBA,ContemporaryClassic,Alcoholic,USA,Asia,Vegan,Citrus,Brunch,Hangover,Mild	233	t	Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.	2023-06-05 23:07:57.758382	2023-06-05 23:07:57.758382	2023-06-05 23:07:57.758382	f	f
194	Mimosa	IBA,ContemporaryClassic	234	t	Ensure both ingredients are well chilled, then mix into the glass. Serve cold.	2023-06-05 23:07:57.764679	2023-06-05 23:07:57.764679	2023-06-05 23:07:57.764679	f	f
195	Mai Tai	IBA,ContemporaryClassic	235	t	Shake all ingredients with ice. Strain into glass. Garnish and serve with straw.	2023-06-05 23:07:57.769152	2023-06-05 23:07:57.769152	2023-06-05 23:07:57.769152	f	f
196	Martini		236	t	Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.	2023-06-05 23:07:57.777976	2023-06-05 23:07:57.777976	2023-06-05 23:07:57.777976	f	f
197	Michelada	Hangover,StrongFlavor,Breakfast	237	t	Mix the beer with tomato juice, freshly squeezed lime juice, and Worcestershire sauce, teriyaki sauce, soy sauce, or hot sauce.\r\nServed In a chilled, salt-rimmed glass\r\n	2023-06-05 23:07:57.783122	2023-06-05 23:07:57.783122	2023-06-05 23:07:57.783122	f	f
198	Manhattan	IBA,Classic,Alcoholic	238	t	Stirred over ice, strained into a chilled glass, garnished, and served up.	2023-06-05 23:07:57.794443	2023-06-05 23:07:57.794443	2023-06-05 23:07:57.794443	f	f
199	Mint Julep	IBA,ContemporaryClassic	240	t	In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.	2023-06-05 23:07:57.804474	2023-06-05 23:07:57.804474	2023-06-05 23:07:57.804474	f	f
200	Mudslinger		241	t	Add all contents to a large jug or punch bowl. Stir well!	2023-06-05 23:07:57.809925	2023-06-05 23:07:57.809925	2023-06-05 23:07:57.809925	f	f
201	Martinez 2		242	t	Add all ingredients to a mixing glass and fill with ice.\r\n\r\nStir until chilled, and strain into a chilled coupe glass.	2023-06-05 23:07:57.814969	2023-06-05 23:07:57.814969	2023-06-05 23:07:57.814969	f	f
202	Moranguito		243	t	first you put rhe absinthe, then put tequila, then put the Granadine syrup.	2023-06-05 23:07:57.820106	2023-06-05 23:07:57.820106	2023-06-05 23:07:57.820106	f	f
203	Miami Vice	IBA	244	t	First: Mix pina colada with 2.5 oz. of rum with ice(set aside). Second: Mix daiquiri with 2.5 oz. of rum with ice. Third: While frozen, add pina colda mix then daiquiri mix in glass (Making sure they do not get mixed together).	2023-06-05 23:07:57.824372	2023-06-05 23:07:57.824372	2023-06-05 23:07:57.824372	f	f
204	Moscow Mule	IBA,ContemporaryClassic	245	t	Combine vodka and ginger beer in a highball glass filled with ice. Add lime juice. Stir gently. Garnish.	2023-06-05 23:07:57.829713	2023-06-05 23:07:57.829713	2023-06-05 23:07:57.829713	f	f
205	Mulled Wine	Christmas	246	t	Simmer 3 cups water with, sugar, cloves, cinnamon sticks, and lemon peel in a stainless steel pot for 10 minutes. Add wine heat to a "coffee temperature" (DO NOT BOIL) then add the brandy.	2023-06-05 23:07:57.83429	2023-06-05 23:07:57.83429	2023-06-05 23:07:57.83429	f	f
206	Munich Mule	German	248	t	Fill glass with ice\r\nPour Gin and Lime Juice\r\nFill glass with Ginger Beer\r\nGarnish with Cucumer and Lime slice	2023-06-05 23:07:57.845098	2023-06-05 23:07:57.845098	2023-06-05 23:07:57.845098	f	f
207	Mocha-Berry		249	t	pour 6 oz. of coffee in a mug or Irish coffee cup. add coca mix and chambord, mix well and top off with whipped cream.	2023-06-05 23:07:57.852177	2023-06-05 23:07:57.852177	2023-06-05 23:07:57.852177	f	f
208	Mojito Extra		251	t	Put mint with lemon juice in a glas, mash the mint with a spoon, ice, rum & fill up with club soda. Top it with Angostura.	2023-06-05 23:07:57.857202	2023-06-05 23:07:57.857202	2023-06-05 23:07:57.857202	f	f
209	Monkey Gland	IBA,Classic	252	t	Shake well over ice cubes in a shaker, strain into a chilled cocktail glass.	2023-06-05 23:07:57.863996	2023-06-05 23:07:57.863996	2023-06-05 23:07:57.863996	f	f
210	Midnight Mint		253	t	If available, rim cocktail (Martini) glass with sugar syrup then dip into chocolate flakes or powder. Add ingredients into shaker with ice. Shake well then strain into cocktail glass.	2023-06-05 23:07:57.86958	2023-06-05 23:07:57.86958	2023-06-05 23:07:57.86958	f	f
211	Mary Pickford	IBA,Classic	254	t	Shake and strain into a chilled large cocktail glass	2023-06-05 23:07:57.875549	2023-06-05 23:07:57.875549	2023-06-05 23:07:57.875549	f	f
212	Monkey Wrench		255	t	Pour all of the ingredients into an old-fashioned glass almost filled with ice cubes. Stir well.	2023-06-05 23:07:57.88252	2023-06-05 23:07:57.88252	2023-06-05 23:07:57.88252	f	f
213	Negroni	IBA,Classic	257	t	Stir into glass over ice, garnish and serve.	2023-06-05 23:07:57.88812	2023-06-05 23:07:57.88812	2023-06-05 23:07:57.88812	f	f
214	New York Sour		258	t	Shake blended whiskey, juice of lemon, and powdered sugar with ice and strain into a whiskey sour glass. Float claret on top. Decorate with the half-slice of lemon and the cherry and serve.	2023-06-05 23:07:57.892578	2023-06-05 23:07:57.892578	2023-06-05 23:07:57.892578	f	f
215	Nutty Irishman		259	t	Serve over ice	2023-06-05 23:07:57.897588	2023-06-05 23:07:57.897588	2023-06-05 23:07:57.897588	f	f
216	National Aquarium		260	t	Pour all ingredients into a shaker of ice. Shake well. Serve on the rocks.	2023-06-05 23:07:57.902164	2023-06-05 23:07:57.902164	2023-06-05 23:07:57.902164	f	f
217	New York Lemonade		261	t	Serve in a chilled cocktail glass. Lemon and sugar the rim. Stir and Strain.	2023-06-05 23:07:57.909686	2023-06-05 23:07:57.909686	2023-06-05 23:07:57.909686	f	f
218	Nuked Hot Chocolate		262	f	Mix with a bit of milk (1 oz or so) in coffee mug. Nuke mug for about 30-50 seconds. Stir until the heated cocoa dissolves. Fill mug with milk. Nuke for 1-2 minutes, depending on wattage and preferences as to burnt mouth parts.	2023-06-05 23:07:57.914771	2023-06-05 23:07:57.914771	2023-06-05 23:07:57.914771	f	f
219	Orgasm		263	t	Shake all ingredients with ice, strain into a chilled cocktail glass, and serve.	2023-06-05 23:07:57.919824	2023-06-05 23:07:57.919824	2023-06-05 23:07:57.919824	f	f
220	Old Pal		264	t	Chill cocktail glass. Add ingredients to a mixing glass, and fill 2/3 full with ice. Stir about 20 seconds. Empty cocktail glass and strain into the glass. Garnish with a twist of lemon peel.	2023-06-05 23:07:57.925763	2023-06-05 23:07:57.925763	2023-06-05 23:07:57.925763	f	f
221	Orangeade		265	f	Place some ice cubes in a large tumbler or highball glass, add lemon juice, orange juice, sugar syrup, and stir well. Top up with cold soda water, serve with a drinking straw.	2023-06-05 23:07:57.930912	2023-06-05 23:07:57.930912	2023-06-05 23:07:57.930912	f	f
222	Orange Whip		266	t	Pour ingredients over ice and stir.	2023-06-05 23:07:57.935534	2023-06-05 23:07:57.935534	2023-06-05 23:07:57.935534	f	f
223	Orange Crush		267	t	Add all ingredients to tumbler-Pour as shot	2023-06-05 23:07:57.942076	2023-06-05 23:07:57.942076	2023-06-05 23:07:57.942076	f	f
224	Orange Oasis		268	t	Shake brandy, gin, and orange juice with ice and strain into a highball glass over ice cubes. Fill with ginger ale, stir, and serve.	2023-06-05 23:07:57.946931	2023-06-05 23:07:57.946931	2023-06-05 23:07:57.946931	f	f
225	Old Fashioned	IBA,Classic,Alcoholic,Expensive,Savory	269	t	Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.	2023-06-05 23:07:57.951465	2023-06-05 23:07:57.951465	2023-06-05 23:07:57.951465	f	f
226	Orange Push-up		272	t	Combine liquors in a blender. Add a half scoop of ice and blend. Garnish with an orange and cherry flag. So good it will melt in your mouth!!!	2023-06-05 23:07:57.959106	2023-06-05 23:07:57.959106	2023-06-05 23:07:57.959106	f	f
227	Orange Rosemary Collins	Citrus	273	t	Add the spirits to the bottom of the glass and top equally with the mixer drinks. Garnish with orange slices inside the glass as well as some rosemary on top.	2023-06-05 23:07:57.964314	2023-06-05 23:07:57.964314	2023-06-05 23:07:57.964314	f	f
228	Paloma		276	t	Stir together and serve over ice.	2023-06-05 23:07:57.975073	2023-06-05 23:07:57.975073	2023-06-05 23:07:57.975073	f	f
229	Paradise	IBA	277	t	Shake together over ice. Strain into cocktail glass and serve chilled.	2023-06-05 23:07:57.978978	2023-06-05 23:07:57.978978	2023-06-05 23:07:57.978978	f	f
230	Pink Gin		278	t	Pour the bitters into a wine glass. Swirl the glass to coat the inside with the bitters, shake out the excess. Pour the gin into the glass. Do not add ice.	2023-06-05 23:07:57.983746	2023-06-05 23:07:57.983746	2023-06-05 23:07:57.983746	f	f
231	Pegu Club		279	t	Shake, strain, up, cocktail glass	2023-06-05 23:07:57.987209	2023-06-05 23:07:57.987209	2023-06-05 23:07:57.987209	f	f
232	Pink Lady		280	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:57.993815	2023-06-05 23:07:57.993815	2023-06-05 23:07:57.993815	f	f
233	Pink Moon	Fresh, Summer, Colourful, Nature	281	t	Slowly shake in a shaker with ice, strain into a square whiskey glass. Top with fresh ice. Add the blackberries to garnish. Add flowers and a green leaf for a special look!	2023-06-05 23:07:57.999099	2023-06-05 23:07:57.999099	2023-06-05 23:07:57.999099	f	f
274	Royal Gin Fizz		326	t	Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.	2023-06-05 23:07:58.220545	2023-06-05 23:07:58.220545	2023-06-05 23:07:58.220545	f	f
234	Penicillin		282	t	Shake blended Scotch, lemon juice, honey syrup and ginger syrup with ice. Strain over large ice in chilled rocks glass. Float smoky Scotch on top (be sure to use a smoky Scotch such as an Islay single malt). Garnish with candied ginger.	2023-06-05 23:07:58.006589	2023-06-05 23:07:58.006589	2023-06-05 23:07:58.006589	f	f
235	Pisco Sour	IBA,NewEra	283	t	Vigorously shake and strain contents in a cocktail shaker with ice cubes, then pour into glass and garnish with bitters.\r\n	2023-06-05 23:07:58.015369	2023-06-05 23:07:58.015369	2023-06-05 23:07:58.015369	f	f
236	Porto flip	IBA,Classic	284	t	Shake ingredients together in a mixer with ice. Strain into glass, garnish and serve.	2023-06-05 23:07:58.020334	2023-06-05 23:07:58.020334	2023-06-05 23:07:58.020334	f	f
237	Pina Colada	IBA,ContemporaryClassic	285	t	Mix with crushed ice in blender until smooth. Pour into chilled glass, garnish and serve.	2023-06-05 23:07:58.025205	2023-06-05 23:07:58.025205	2023-06-05 23:07:58.025205	f	f
238	Pink Penocha		286	t	mix all ingredients into bowl keep iced stir frequently	2023-06-05 23:07:58.030326	2023-06-05 23:07:58.030326	2023-06-05 23:07:58.030326	f	f
239	Pure Passion	Passion	287	t	Mix up all ingredients with a cocktail stirrer and serve with crushed ice with mint and edible flour if available.	2023-06-05 23:07:58.036155	2023-06-05 23:07:58.036155	2023-06-05 23:07:58.036155	f	f
240	Popped cherry		288	t	Served over ice in a tall glass with a popped cherry (can add more popped cherries if in the mood)!	2023-06-05 23:07:58.046001	2023-06-05 23:07:58.046001	2023-06-05 23:07:58.046001	f	f
241	Poppy Cocktail		289	t	Shake ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.052924	2023-06-05 23:07:58.052924	2023-06-05 23:07:58.052924	f	f
242	Port Wine Flip		290	t	Shake all ingredients (except nutmeg) with ice and strain into a whiskey sour glass. Sprinkle nutmeg on top and serve.	2023-06-05 23:07:58.056677	2023-06-05 23:07:58.056677	2023-06-05 23:07:58.056677	f	f
243	Pineapple Paloma		292	t	Rub the rim of each glass with lime slice and dip into salt.\r\nAdd ice, tequila, grapefruit juice, lime juice and top with pineapple soda.\r\nGive it a quick stir.\r\nGarnish with fresh pineapple or lime.	2023-06-05 23:07:58.062851	2023-06-05 23:07:58.062851	2023-06-05 23:07:58.062851	f	f
244	Pornstar Martini	Adult, Shot, Bubbly	293	t	Straight: Pour all ingredients into mixing glass with ice cubes. Shake well. Strain in chilled martini cocktail glass. Cut passion fruit in half and use as garnish. Pour prosecco into a chilled shot glass and serve alongside the martini.	2023-06-05 23:07:58.071075	2023-06-05 23:07:58.071075	2023-06-05 23:07:58.071075	f	f
245	Planter’s Punch		294	t	Squeeze an orange and strain the juice. Put all the ingredients in a shaker filled with ice and shake for at least 12 seconds. Strain into a highball glass and decorate with a pineapple wedge or fruit of your choice.	2023-06-05 23:07:58.080063	2023-06-05 23:07:58.080063	2023-06-05 23:07:58.080063	f	f
246	Port And Starboard		295	t	Pour carefully into a pousse-cafe glass, so that creme de menthe floats on grenadine. Serve without mixing.	2023-06-05 23:07:58.087268	2023-06-05 23:07:58.087268	2023-06-05 23:07:58.087268	f	f
247	Port Wine Cocktail		296	t	Stir ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.090871	2023-06-05 23:07:58.090871	2023-06-05 23:07:58.090871	f	f
248	Pysch Vitamin Light		297	f	Shake with ice.	2023-06-05 23:07:58.094369	2023-06-05 23:07:58.094369	2023-06-05 23:07:58.094369	f	f
249	Pink Panty Pulldowns		298	t	Shake well	2023-06-05 23:07:58.099049	2023-06-05 23:07:58.099049	2023-06-05 23:07:58.099049	f	f
250	Passion Fruit Martini		299	t	Pour all ingredients into a glass and stir. Garnish with half a passion fruit piece.	2023-06-05 23:07:58.104302	2023-06-05 23:07:58.104302	2023-06-05 23:07:58.104302	f	f
251	Pineapple Gingerale Smoothie		300	f	Throw everything into a blender and liquify.	2023-06-05 23:07:58.108732	2023-06-05 23:07:58.108732	2023-06-05 23:07:58.108732	f	f
252	Quentin		301	t	In a shaker half-filled with ice cubes, combine the rum, Kahlua, and cream. Shake well. Strain into a cocktail glass and garnish with the nutmeg.	2023-06-05 23:07:58.112235	2023-06-05 23:07:58.112235	2023-06-05 23:07:58.112235	f	f
253	Queen Bee		302	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.117384	2023-06-05 23:07:58.117384	2023-06-05 23:07:58.117384	f	f
254	Quick-sand		304	t	Simply add the orange juice, quite a quick pour in order to mix the sambucca with the orange juice. The juice MUST have fruit pulp!	2023-06-05 23:07:58.123071	2023-06-05 23:07:58.123071	2023-06-05 23:07:58.123071	f	f
255	Queen Charlotte		305	t	Pour red wine and grenadine into a collins glass over ice cubes. Fill with lemon-lime soda, stir, and serve.	2023-06-05 23:07:58.127152	2023-06-05 23:07:58.127152	2023-06-05 23:07:58.127152	f	f
256	Queen Elizabeth		306	t	Stir all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.13048	2023-06-05 23:07:58.13048	2023-06-05 23:07:58.13048	f	f
257	Quarter Deck Cocktail		308	t	Stir all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.135756	2023-06-05 23:07:58.135756	2023-06-05 23:07:58.135756	f	f
258	Rose	IBA,ContemporaryClassic	309	t	Shake together in a cocktail shaker, then strain into chilled glass. Garnish and serve.	2023-06-05 23:07:58.140245	2023-06-05 23:07:58.140245	2023-06-05 23:07:58.140245	f	f
259	Radler		310	t	Pour beer into large mug, slowly add the 7-up (or Sprite).	2023-06-05 23:07:58.146674	2023-06-05 23:07:58.146674	2023-06-05 23:07:58.146674	f	f
260	Rum Sour		311	t	In a shaker half-filled with ice cubes, combine the rum, lemon juice, and sugar. Shake well. Strain into a sour glass and garnish with the orange slice and the cherry.	2023-06-05 23:07:58.150062	2023-06-05 23:07:58.150062	2023-06-05 23:07:58.150062	f	f
261	Rum Punch		312	t	Mix all ingredients in a punch bowl and serve.	2023-06-05 23:07:58.156345	2023-06-05 23:07:58.156345	2023-06-05 23:07:58.156345	f	f
262	Rum Toddy		313	t	Dissolve powdered sugar in water in an old-fashioned glass. Add rum and one ice cube and stir. Add the twist of lemon peel and serve.	2023-06-05 23:07:58.162854	2023-06-05 23:07:58.162854	2023-06-05 23:07:58.162854	f	f
263	Royal Fizz		314	t	Shake all ingredients (except cola) with ice and strain into a chilled collins glass. Fill with cola and serve.	2023-06-05 23:07:58.168013	2023-06-05 23:07:58.168013	2023-06-05 23:07:58.168013	f	f
264	Rum Cooler		315	t	Pour the rum and soda into a collins glass almost filled with ice cubes. Stir well and garnish with the lemon wedge.	2023-06-05 23:07:58.172175	2023-06-05 23:07:58.172175	2023-06-05 23:07:58.172175	f	f
265	Rum Runner		316	t	Mix all ingredients in glass & add ice.	2023-06-05 23:07:58.176561	2023-06-05 23:07:58.176561	2023-06-05 23:07:58.176561	f	f
266	Rusty Nail	IBA,Classic	317	t	Pour the Scotch and Drambuie into an old-fashioned glass almost filled with ice cubes. Stir well. Garnish with the lemon twist.	2023-06-05 23:07:58.182975	2023-06-05 23:07:58.182975	2023-06-05 23:07:58.182975	f	f
267	Red Snapper		318	t	One shot each, shake n shoot	2023-06-05 23:07:58.187352	2023-06-05 23:07:58.187352	2023-06-05 23:07:58.187352	f	f
268	Royal Bitch		319	t	Into a shot glass layer the Crown Royal on top of the Frangelico.	2023-06-05 23:07:58.192216	2023-06-05 23:07:58.192216	2023-06-05 23:07:58.192216	f	f
269	Royal Flush		320	t	Pour all the ingredients into tumbler over ice. Strain into glass.	2023-06-05 23:07:58.195531	2023-06-05 23:07:58.195531	2023-06-05 23:07:58.195531	f	f
270	Rum Cobbler		321	t	In an old-fashioned glass, dissolve the sugar in the club soda. Add crushed ice until the glass is almost full. Add the rum. Stir well. Garnish with the cherry and the orange and lemon slices.	2023-06-05 23:07:58.200693	2023-06-05 23:07:58.200693	2023-06-05 23:07:58.200693	f	f
271	Ruby Tuesday		322	t	Pour gin and cranberry into a highball filled with ice cubes. Add grenadine and stir.	2023-06-05 23:07:58.207972	2023-06-05 23:07:58.207972	2023-06-05 23:07:58.207972	f	f
272	Rail Splitter		323	f	Mix sugar syrup with lemon juice in a tall glass. Fill up with ginger ale.	2023-06-05 23:07:58.212101	2023-06-05 23:07:58.212101	2023-06-05 23:07:58.212101	f	f
273	Rosemary Blue		324	t	1) Add the Bombay Sapphire, Blue Curacao, rosemary sprig and gently squeezed lemon wedge to a balloon glass. Swirl well to combine.\r\n2) Fill with cubed ice and top with the Fever-Tree Light Tonic Water.\r\n3) Gently fold with a bar spoon to mix.	2023-06-05 23:07:58.214557	2023-06-05 23:07:58.214557	2023-06-05 23:07:58.214557	f	f
313	Tennesee Mud		369	t	Mix Coffee, Jack Daniels and Amaretto. Add Cream on top.	2023-06-05 23:07:58.438861	2023-06-05 23:07:58.438861	2023-06-05 23:07:58.438861	f	f
275	Rum Milk Punch		327	t	Shake all ingredients (except nutmeg) with ice and strain into a collins glass. Sprinkle nutmeg on top and serve.	2023-06-05 23:07:58.226353	2023-06-05 23:07:58.226353	2023-06-05 23:07:58.226353	f	f
276	Raspberry Julep		328	t	Softly muddle the mint leaves and raspberry syrup in the bottom of the cup. Add crushed ice and Bourbon to the cup and then stir. Top with more ice, garnish with a mint sprig.	2023-06-05 23:07:58.231118	2023-06-05 23:07:58.231118	2023-06-05 23:07:58.231118	f	f
277	Rum Screwdriver		329	t	Pour rum into a highball glass over ice cubes. Add orange juice, stir, and serve.	2023-06-05 23:07:58.236559	2023-06-05 23:07:58.236559	2023-06-05 23:07:58.236559	f	f
278	Raspberry Cooler		330	t	Pour the raspberry vodka and soda into a highball glass almost filled with ice cubes. Stir well.	2023-06-05 23:07:58.240297	2023-06-05 23:07:58.240297	2023-06-05 23:07:58.240297	f	f
279	Rum Old-fashioned		331	t	Stir powdered sugar, water, and bitters in an old-fashioned glass. When sugar has dissolved add ice cubes and light rum. Add the twist of lime peel, float 151 proof rum on top, and serve.	2023-06-05 23:07:58.24471	2023-06-05 23:07:58.24471	2023-06-05 23:07:58.24471	f	f
280	Russian Spring Punch	IBA,NewEra	332	t	Pour the ingredients into an highball glass, top with Sparkling wine.	2023-06-05 23:07:58.252949	2023-06-05 23:07:58.252949	2023-06-05 23:07:58.252949	f	f
281	Radioactive Long Island Iced Tea		333	t	Pour all ingredients over ice in a very tall glass. Sip cautiously.	2023-06-05 23:07:58.258774	2023-06-05 23:07:58.258774	2023-06-05 23:07:58.258774	f	f
282	Smut		334	t	Throw it all together and serve real cold.	2023-06-05 23:07:58.268373	2023-06-05 23:07:58.268373	2023-06-05 23:07:58.268373	f	f
283	Spritz		335	t	Build into glass over ice, garnish and serve.	2023-06-05 23:07:58.27427	2023-06-05 23:07:58.27427	2023-06-05 23:07:58.27427	f	f
284	Scooter		336	t	Shake all ingredients well with cracked ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.278636	2023-06-05 23:07:58.278636	2023-06-05 23:07:58.278636	f	f
285	Sangria		337	t	Mix all together in a pitcher and refrigerate. Add cloves and cinnamon sticks to taste. Serve in wine glasses.	2023-06-05 23:07:58.282912	2023-06-05 23:07:58.282912	2023-06-05 23:07:58.282912	f	f
286	Stinger	IBA,Classic	338	t	Pour in a mixing glass with ice, stir and strain into a cocktail glass. May also be served on rocks in a rocks glass.	2023-06-05 23:07:58.288367	2023-06-05 23:07:58.288367	2023-06-05 23:07:58.288367	f	f
287	Sidecar	IBA,Classic	340	t	Pour all ingredients into cocktail shaker filled with ice. Shake well and strain into cocktail glass.	2023-06-05 23:07:58.292698	2023-06-05 23:07:58.292698	2023-06-05 23:07:58.292698	f	f
288	Snowday	Winter	341	t	Stir all ingredients with ice. Strain into a chilled rocks glass over fresh ice. Express orange peel over drink and garnish.	2023-06-05 23:07:58.297002	2023-06-05 23:07:58.297002	2023-06-05 23:07:58.297002	f	f
289	Snowball	Christmas	343	t	Place one ice cube in the glass and add 1 1/2 oz of Advocaat. Fill up the glass with lemonade and decorate with a slice of lemon. Serve at once.	2023-06-05 23:07:58.307298	2023-06-05 23:07:58.307298	2023-06-05 23:07:58.307298	f	f
290	Shot-gun		344	t	Pour one part Jack Daneils and one part Jim Beam into shot glass then float Wild Turkey on top.	2023-06-05 23:07:58.314189	2023-06-05 23:07:58.314189	2023-06-05 23:07:58.314189	f	f
291	Salty Dog		345	t	Pour all ingredients over ice cubes in a highball glass. Stir well and serve. (Vodka may be substituted for gin, if preferred.)	2023-06-05 23:07:58.320751	2023-06-05 23:07:58.320751	2023-06-05 23:07:58.320751	f	f
292	Stone Sour		346	t	Shake all ingredients with ice, strain into a chilled whiskey sour glass, and serve.	2023-06-05 23:07:58.325813	2023-06-05 23:07:58.325813	2023-06-05 23:07:58.325813	f	f
293	Sea breeze	IBA,ContemporaryClassic	347	t	Build all ingredients in a highball glass filled with ice. Garnish with lime wedge.	2023-06-05 23:07:58.330425	2023-06-05 23:07:58.330425	2023-06-05 23:07:58.330425	f	f
294	Scotch Sour		348	t	Shake scotch, juice of lime, and powdered sugar with ice and strain into a whiskey sour glass. Decorate with 1/2 slice lemon, top with the cherry, and serve.	2023-06-05 23:07:58.334794	2023-06-05 23:07:58.334794	2023-06-05 23:07:58.334794	f	f
295	Sweet Tooth		349	t	Put 2 shots Godiva Liquour into a glass, add as much or as little milk as you would like.	2023-06-05 23:07:58.341155	2023-06-05 23:07:58.341155	2023-06-05 23:07:58.341155	f	f
296	Screwdriver	IBA	350	t	Mix in a highball glass with ice. Garnish and serve.	2023-06-05 23:07:58.344625	2023-06-05 23:07:58.344625	2023-06-05 23:07:58.344625	f	f
297	Sherry Flip		351	t	Shake all ingredients (except nutmeg) with ice and strain into a whiskey sour glass. Sprinkle nutmeg on top and serve.	2023-06-05 23:07:58.347356	2023-06-05 23:07:58.347356	2023-06-05 23:07:58.347356	f	f
298	Shark Attack		353	t	Mix lemonade and water according to instructions on back of can. If the instructions say to add 4 1/3 cans of water do so. Mix into pitcher. Add 1 1/2 cup of Vodka (Absolut). Mix well. Pour into glass of crushed ice. Excellent!	2023-06-05 23:07:58.353943	2023-06-05 23:07:58.353943	2023-06-05 23:07:58.353943	f	f
299	San Francisco		354	t	Take a tall glass and put in a few ice cubes, fill the vodka over it and fill with juice then the "creme", to end fill in the grenadine but very carefully at the side of the glass so it will lay down in the bottom. garnish with orange and strawberry.	2023-06-05 23:07:58.358933	2023-06-05 23:07:58.358933	2023-06-05 23:07:58.358933	f	f
300	Space Odyssey		355	t	Fill glass with ice and add shots of Bacardi and Malibu. Add splash of pineapple juice and top with orange juice. Add grenadine for color and garnish with cherries.	2023-06-05 23:07:58.362206	2023-06-05 23:07:58.362206	2023-06-05 23:07:58.362206	f	f
301	Sherry Eggnog		356	t	Shake sherry, powdered sugar, and egg with ice and strain into a collins glass. Fill with milk and stir. Sprinkle nutmeg on top and serve.	2023-06-05 23:07:58.366746	2023-06-05 23:07:58.366746	2023-06-05 23:07:58.366746	f	f
302	Sweet Bananas		357	f	Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.	2023-06-05 23:07:58.371724	2023-06-05 23:07:58.371724	2023-06-05 23:07:58.371724	f	f
303	Sweet Sangria		358	t	Dissolve the sugar in hot water and cool. Peel the citrus fruits and break into wedges. Mix the wine, sugar syrup, fruit, and Fresca in a pitcher and put in the fridge for a few hours. Serve in tall glasses with a straw.	2023-06-05 23:07:58.376726	2023-06-05 23:07:58.376726	2023-06-05 23:07:58.376726	f	f
304	Thriller		359	t	In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.	2023-06-05 23:07:58.384743	2023-06-05 23:07:58.384743	2023-06-05 23:07:58.384743	f	f
305	The Galah	Dark	360	t	Mix together the alcoholic portions and top with Pineapple and Lime juice.	2023-06-05 23:07:58.38933	2023-06-05 23:07:58.38933	2023-06-05 23:07:58.38933	f	f
306	Tia-Maria		361	t	Boil water, sugar and coffe for 10 mins and let cool. Add rum and vanilla. Put in clean bottle(s) and leave for 1 week before using.	2023-06-05 23:07:58.397471	2023-06-05 23:07:58.397471	2023-06-05 23:07:58.397471	f	f
307	Tipperary		362	t	Stir over ice. Strain into chilled glass. Cut a wide swath of orange peel, and express the orange oils over the drink. Discard orange twist.	2023-06-05 23:07:58.405309	2023-06-05 23:07:58.405309	2023-06-05 23:07:58.405309	f	f
308	Turkeyball		363	t	Shake with ice and strain into a shot glass.	2023-06-05 23:07:58.410193	2023-06-05 23:07:58.410193	2023-06-05 23:07:58.410193	f	f
309	Texas Sling		364	t	Blend with Ice until smooth. Serve in a tulip glass, top with whip cream.	2023-06-05 23:07:58.414582	2023-06-05 23:07:58.414582	2023-06-05 23:07:58.414582	f	f
310	Tom Collins		366	t	In a shaker half-filled with ice cubes, combine the gin, lemon juice, and sugar. Shake well. Strain into a collins glass alomst filled with ice cubes. Add the club soda. Stir and garnish with the cherry and the orange slice.	2023-06-05 23:07:58.422002	2023-06-05 23:07:58.422002	2023-06-05 23:07:58.422002	f	f
311	Tomato Tang		367	f	Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.	2023-06-05 23:07:58.430102	2023-06-05 23:07:58.430102	2023-06-05 23:07:58.430102	f	f
312	Talos Coffee		368	t	Add your GM and then add your coffee.	2023-06-05 23:07:58.435401	2023-06-05 23:07:58.435401	2023-06-05 23:07:58.435401	f	f
314	Tequila Fizz		370	t	Shake all ingredients (except ginger ale) with ice and strain into a collins glass over ice cubes. Fill with ginger ale, stir, and serve.	2023-06-05 23:07:58.443403	2023-06-05 23:07:58.443403	2023-06-05 23:07:58.443403	f	f
315	Tequila Sour		371	t	Shake tequila, juice of lemon, and powdered sugar with ice and strain into a whiskey sour glass. Add the half-slice of lemon, top with the cherry, and serve.	2023-06-05 23:07:58.448698	2023-06-05 23:07:58.448698	2023-06-05 23:07:58.448698	f	f
316	Thai Iced Tea		372	f	Combine Thai tea (i.e., the powder), boiling water, and sweetened condensed milk, stir until blended. Pour into 2 tall glasses filled with ice cubes. Garnish with mint leaves. Makes 2 servings.	2023-06-05 23:07:58.454747	2023-06-05 23:07:58.454747	2023-06-05 23:07:58.454747	f	f
317	The Last Word		373	t	Shake with ice and strain into a cocktail glass.	2023-06-05 23:07:58.461638	2023-06-05 23:07:58.461638	2023-06-05 23:07:58.461638	f	f
318	Turf Cocktail		374	t	Stir all ingredients (except orange peel) with ice and strain into a cocktail glass. Add the twist of orange peel and serve.	2023-06-05 23:07:58.467257	2023-06-05 23:07:58.467257	2023-06-05 23:07:58.467257	f	f
319	Tequila Slammer	Drunk	376	t	Mix carefully to avoid releasing the dissolved CO2.	2023-06-05 23:07:58.47503	2023-06-05 23:07:58.47503	2023-06-05 23:07:58.47503	f	f
320	Tequila Sunrise	IBA,ContemporaryClassic	377	t	Pour the tequila and orange juice into glass over ice. Add the grenadine, which will sink to the bottom. Stir gently to create the sunrise effect. Garnish and serve.	2023-06-05 23:07:58.479539	2023-06-05 23:07:58.479539	2023-06-05 23:07:58.479539	f	f
321	The Philosopher		378	t	Add all the spirits in a shaker (best to use Hendricks gin) as well as the orange bitters and lemon juice. Strain into a Margarita glass, top with Prosecco.	2023-06-05 23:07:58.482281	2023-06-05 23:07:58.482281	2023-06-05 23:07:58.482281	f	f
322	Tuxedo Cocktail	IBA,Classic	379	t	Stir all ingredients with ice and strain into a cocktail glass. Garnish with a cherry and a twist of lemon zest.	2023-06-05 23:07:58.489616	2023-06-05 23:07:58.489616	2023-06-05 23:07:58.489616	f	f
323	Tequila Surprise		380	t	Fill shot glass with Tequila. Add drops of Tobasco sauce.	2023-06-05 23:07:58.497312	2023-06-05 23:07:58.497312	2023-06-05 23:07:58.497312	f	f
324	The Jimmy Conway		382	t	Fill glass with ice\r\nPour in The Irishman and Disaronno\r\nFill to the top with Cranberry Juice\r\nGarnish with a slice of lemon…Enjoy!	2023-06-05 23:07:58.502052	2023-06-05 23:07:58.502052	2023-06-05 23:07:58.502052	f	f
325	Texas Rattlesnake		383	t	Mix all ingredients and Shake well. Sweet at first, with a BITE at the end...	2023-06-05 23:07:58.507637	2023-06-05 23:07:58.507637	2023-06-05 23:07:58.507637	f	f
326	Vesper	IBA,NewEra	384	t	Shake over ice until well chilled, then strain into a deep goblet and garnish with a thin slice of lemon peel.	2023-06-05 23:07:58.51383	2023-06-05 23:07:58.51383	2023-06-05 23:07:58.51383	f	f
327	Victor		385	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.519117	2023-06-05 23:07:58.519117	2023-06-05 23:07:58.519117	f	f
328	Vesuvio		387	t	Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.	2023-06-05 23:07:58.524727	2023-06-05 23:07:58.524727	2023-06-05 23:07:58.524727	f	f
329	Veteran		388	t	Pour the rum and cherry brandy into an old-fashioned glass almost filled with ice cubes. Stir well.	2023-06-05 23:07:58.531274	2023-06-05 23:07:58.531274	2023-06-05 23:07:58.531274	f	f
330	Van Vleet		389	t	Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.	2023-06-05 23:07:58.535271	2023-06-05 23:07:58.535271	2023-06-05 23:07:58.535271	f	f
331	Vodka Fizz		390	t	Blend all ingredients, save nutmeg. Pour into large white wine glass and sprinkle nutmeg on top.	2023-06-05 23:07:58.540539	2023-06-05 23:07:58.540539	2023-06-05 23:07:58.540539	f	f
332	Vodka Slime		392	t	Fill glass with ice. Add vodka, 7-up then finish with the lime juice.	2023-06-05 23:07:58.546422	2023-06-05 23:07:58.546422	2023-06-05 23:07:58.546422	f	f
333	Vodka Martini		394	t	Shake the vodka and vermouth together with a number of ice cubes, strain into a cocktail glass, add the olive and serve.	2023-06-05 23:07:58.551586	2023-06-05 23:07:58.551586	2023-06-05 23:07:58.551586	f	f
335	Vermouth Cassis		396	t	Stir vermouth and creme de cassis in a highball glass with ice cubes. Fill with carbonated water, stir again, and serve.	2023-06-05 23:07:58.558219	2023-06-05 23:07:58.558219	2023-06-05 23:07:58.558219	f	f
336	Victory Collins		397	t	Shake all ingredients (except orange slice) with ice and strain into a collins glass over ice cubes. Add the slice of orange and serve.	2023-06-05 23:07:58.561578	2023-06-05 23:07:58.561578	2023-06-05 23:07:58.561578	f	f
337	Vodka And Tonic		398	t	Pour vodka into a highball glass over ice cubes. Fill with tonic water, stir, and serve.	2023-06-05 23:07:58.567881	2023-06-05 23:07:58.567881	2023-06-05 23:07:58.567881	f	f
338	Valencia Cocktail		399	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.570399	2023-06-05 23:07:58.570399	2023-06-05 23:07:58.570399	f	f
339	Whisky Mac		400	t	Pour both of the ingredients into a wine goblet with no ice.	2023-06-05 23:07:58.574589	2023-06-05 23:07:58.574589	2023-06-05 23:07:58.574589	f	f
340	White Lady	IBA,Classic	401	t	Add all ingredients into cocktail shaker filled with ice. Shake well and strain into large cocktail glass.	2023-06-05 23:07:58.577958	2023-06-05 23:07:58.577958	2023-06-05 23:07:58.577958	f	f
341	Wine Punch		402	t	Combine all of the ingredients and pour over a block of ice.	2023-06-05 23:07:58.582195	2023-06-05 23:07:58.582195	2023-06-05 23:07:58.582195	f	f
342	Wine Cooler		403	f	Mix wine and soft drink. Pour into glass. Add ice.	2023-06-05 23:07:58.588222	2023-06-05 23:07:58.588222	2023-06-05 23:07:58.588222	f	f
343	Winter Rita	Winter	404	t	Salt rim. Combine all ingredients, shake with ice, and strain over fresh ice.⠀	2023-06-05 23:07:58.592362	2023-06-05 23:07:58.592362	2023-06-05 23:07:58.592362	f	f
344	White Russian		406	t	Pour vodka and coffee liqueur over ice cubes in an old-fashioned glass. Fill with light cream and serve.	2023-06-05 23:07:58.600385	2023-06-05 23:07:58.600385	2023-06-05 23:07:58.600385	f	f
345	White Wine Sangria	Spanish	408	t	Chop the Lemon, Lime and other fruits into large chunks. Fill the Pitcher with the white wine and mix in the Apple Brandy. Top to taste with soda water.	2023-06-05 23:07:58.604581	2023-06-05 23:07:58.604581	2023-06-05 23:07:58.604581	f	f
346	Whitecap Margarita		409	t	Place all ingredients in a blender and blend until smooth. This makes one drink.	2023-06-05 23:07:58.613415	2023-06-05 23:07:58.613415	2023-06-05 23:07:58.613415	f	f
347	Waikiki Beachcomber		410	t	Shake all ingredients with ice, strain into a cocktail glass, and serve.	2023-06-05 23:07:58.619244	2023-06-05 23:07:58.619244	2023-06-05 23:07:58.619244	f	f
348	Yellow Bird	IBA,NewEra	411	t	Shake and strain into a chilled cocktail glass	2023-06-05 23:07:58.627207	2023-06-05 23:07:58.627207	2023-06-05 23:07:58.627207	f	f
349	Zorro		413	t	add all and pour black coffee and add whipped cream on top.	2023-06-05 23:07:58.634353	2023-06-05 23:07:58.634353	2023-06-05 23:07:58.634353	f	f
350	Zinger		414	t	Get a shot glass and pour in three shots of the schnapps. Do the same with the Surge Cola. Then down it like Scheetz would.	2023-06-05 23:07:58.638382	2023-06-05 23:07:58.638382	2023-06-05 23:07:58.638382	f	f
351	Zoksel		415	t	No specific mixinginstructions, just poor every ingredient in one glass. The lemon goes with it.	2023-06-05 23:07:58.642913	2023-06-05 23:07:58.642913	2023-06-05 23:07:58.642913	f	f
352	Zambeer		417	t	Mix sambuca with rootbeer and stir. Add ice	2023-06-05 23:07:58.646266	2023-06-05 23:07:58.646266	2023-06-05 23:07:58.646266	f	f
353	Zorbatini		418	t	Prepare like a Martini. Garnish with a green olive.	2023-06-05 23:07:58.651604	2023-06-05 23:07:58.651604	2023-06-05 23:07:58.651604	f	f
354	Zenmeister		419	t	Mix together and enjoy	2023-06-05 23:07:58.655151	2023-06-05 23:07:58.655151	2023-06-05 23:07:58.655151	f	f
355	Zipperhead		420	t	Fill glass with rocks, add straw before putting in liquor. Then add the ingredients in order, trying to keep layered as much as possible (i.e. Chambord on bottom, then Vodka, Then soda on top).	2023-06-05 23:07:58.658583	2023-06-05 23:07:58.658583	2023-06-05 23:07:58.658583	f	f
356	Zima Blaster		421	t	Fill glass with ice. Pour in Chambord, then fill with Zima. Mix and enjoy.	2023-06-05 23:07:58.663045	2023-06-05 23:07:58.663045	2023-06-05 23:07:58.663045	f	f
334	Black Russian		395	t	Mix it as a ordinary drink .	2023-06-05 23:07:58.555741	2023-06-05 23:07:58.555741	2023-06-05 23:07:58.555741	f	f
357	Zizi Coin-coin		422	t	Pour 5cl of Cointreau on ice, add 2cl of fresh lemon (or lime) juice, stir gently, and finally add slices of lemon/lime in glass.	2023-06-05 23:07:58.666948	2023-06-05 23:07:58.666948	2023-06-05 23:07:58.666948	f	f
358	Ziemes Martini Apfelsaft		425	t	Serve without ice. At least the juice shold have room temperature.	2023-06-05 23:07:58.673733	2023-06-05 23:07:58.673733	2023-06-05 23:07:58.673733	f	f
359	155 Belmont		426	t	Blend with ice. Serve in a wine glass. Garnish with carrot.	2023-06-05 23:07:58.677031	2023-06-05 23:07:58.677031	2023-06-05 23:07:58.677031	f	f
360	1-900-FUK-MEUP		427	t	Shake ingredients in a mixing tin filled with ice cubes. Strain into a rocks glass.	2023-06-05 23:07:58.682369	2023-06-05 23:07:58.682369	2023-06-05 23:07:58.682369	f	f
361	110 in the shade		428	t	Drop shooter in glass. Fill with beer	2023-06-05 23:07:58.691105	2023-06-05 23:07:58.691105	2023-06-05 23:07:58.691105	f	f
362	151 Florida Bushwacker		429	t	Combine all ingredients. Blend until smooth. Garnish with chocolate shavings if desired.	2023-06-05 23:07:58.694509	2023-06-05 23:07:58.694509	2023-06-05 23:07:58.694509	f	f
363	252		430	t	Add both ingredients to shot glass, shoot, and get drunk quick	2023-06-05 23:07:58.704713	2023-06-05 23:07:58.704713	2023-06-05 23:07:58.704713	f	f
364	24k nightmare		431	t	Add over ice,shake and pour.	2023-06-05 23:07:58.708056	2023-06-05 23:07:58.708056	2023-06-05 23:07:58.708056	f	f
365	3 Wise Men		432	t	put them them in a glass... and slam it to tha head.	2023-06-05 23:07:58.714343	2023-06-05 23:07:58.714343	2023-06-05 23:07:58.714343	f	f
366	3-Mile Long Island Iced Tea		433	t	Fill 14oz glass with ice and alcohol. Fill 2/3 glass with cola and remainder with sweet & sour. Top with dash of bitters and lemon wedge.	2023-06-05 23:07:58.718612	2023-06-05 23:07:58.718612	2023-06-05 23:07:58.718612	f	f
367	410 Gone		434	t		2023-06-05 23:07:58.728178	2023-06-05 23:07:58.728178	2023-06-05 23:07:58.728178	f	f
368	50/50		435	t	fill glass with crushed ice. Add vodka. Add a splash of grand-marnier. Fill with o.j.	2023-06-05 23:07:58.730639	2023-06-05 23:07:58.730639	2023-06-05 23:07:58.730639	f	f
369	501 Blue		436	t	Mix equal amounts into a glass with ice.	2023-06-05 23:07:58.735456	2023-06-05 23:07:58.735456	2023-06-05 23:07:58.735456	f	f
370	57 Chevy with a White License Plate		437	t	1. Fill a rocks glass with ice 2.add white creme de cacao and vodka 3.stir	2023-06-05 23:07:58.736913	2023-06-05 23:07:58.736913	2023-06-05 23:07:58.736913	f	f
371	69 Special		438	t	Pour 2 oz. gin. Add 4 oz. 7-up. Add Lemon Juice for flavor. If you are weak, top up glass with more 7-Up.	2023-06-05 23:07:58.740348	2023-06-05 23:07:58.740348	2023-06-05 23:07:58.740348	f	f
372	747		439	t	pour kaluha, then Baileys, then Frangelico not chilled and not layered -- SERVE!!!	2023-06-05 23:07:58.744776	2023-06-05 23:07:58.744776	2023-06-05 23:07:58.744776	f	f
373	747 Drink		440	t	Fill a Collins glass with ice.\r\nPour in vodka, lime cordial, and cranberry juice.\r\nFill up with Sprite.\r\nGarnish with a Lime wheel or some cranberries	2023-06-05 23:07:58.749462	2023-06-05 23:07:58.749462	2023-06-05 23:07:58.749462	f	f
374	9 1/2 Weeks		441	t	Combine all ingredients in glass mixer. Chill and strain into Cocktail glass. Garnish with sliced strawberry.	2023-06-05 23:07:58.756037	2023-06-05 23:07:58.756037	2023-06-05 23:07:58.756037	f	f
375	Jack Coke	\N	443	t	Fill a highball glass with cubed ice, add Jack Daniel, top with coke.	2023-06-05 23:24:59	2023-06-05 23:24:59	2023-06-05 14:25:56.717137	f	f
376	Rum Coke	\N	444	t	Fill a highball glass with cubed ice, add rum, top with coke.	2023-06-05 23:25:52	2023-06-05 23:25:54	2023-06-05 14:25:56.717137	f	f
377	Bacardi Tonic	\N	445	t	Fill a highball glass with ice, pour the bacardi, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.	2023-06-05 14:31:37.80063	2023-06-05 14:31:37.80063	2023-06-05 14:31:37.80063	f	f
378	Watermelon Tonic	\N	446	t	Squeeze lime into cocktail glass and drop lime wedge into the juice. Add watermelon and enough ice to fill glass to top. Pour gin and tonic water over the watermelon and ice	2023-06-05 23:39:35	2023-06-05 14:39:57.910878	2023-06-05 14:39:57.910878	f	f
379	Finlandia Tonic	\N	447	t	Fill a highball glass with ice, pour the finlandia, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.	2023-06-05 14:43:05.275824	2023-06-05 14:43:05.275824	2023-06-05 14:43:05.275824	f	f
380	151 Rum coke	\N	448	t	Fill a highball glass with cubed ice, add rum, top with coke.	2023-06-05 23:51:10	2023-06-05 23:51:12	2023-06-05 14:51:17.682152	f	f
381	Gold Medalist	\N	449	f	Add all ingredients with ice in blender, blend and pour into a cup. 	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	f	f
382	Bombay Gin Tonic	\N	450	t	Fill your balloon glass to rim with large cubed ice. Pour over 2 Oz of Bombay Sapphire. Squeeze fresh lime into drink and drop into glass.	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	f	f
383	Jack Honey Coke	\N	451	t	Fill a highball glass or pint glass with ice cubes. Pour the Jack Daniel's Tennessee Honey over the ice. Top up the glass with Coca-Cola. Stir gently to mix. The idea is to just blend the flavors without making the Coke go flat.	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	f	f
385	Baileys Milk	\N	453	t	Fill a rock glass with ice. add Baileys and Milk and stir.	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	f	f
384	Kahlua Milk	\N	452	t	Fill a glass with ice. Add Kahlúa coffee liqueur Milk. Stir it well.	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	2023-06-05 14:51:17.682152	f	f
397	Jager Bomb	\N	460	t	Pour the energy drink into a pint glass. Pour the Jägermeister into a shot glass. Drop the shot glass filled with Jägermeister into the pint glass and drink immediately.	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	f	f
398	X-Rated Tonic	\N	461	t	Mix all ingredients.	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	f	f
399	Peach Crush	\N	462	t	Fill the highball glass with ice. Add peach liqueu, sweet and sour and Grandberry juice. Stir with a bar spoon.	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	f	f
400	Midori Sour	\N	463	t	Fill the rock glass with ice. Add Midori and sour and stir.	2023-06-06 00:46:00	2023-06-06 00:46:01	2023-06-05 15:48:15.125917	f	f
401	Sun Burn	\N	464	t	Muddle the strawberry and lime juice in a cocktail shaker. Add vodka and ice and shake for 30 seconds. Prepare a glass with ice. Strain strawberry mixture slowly into the glass. Top off with a splash of club soda.	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	f	f
402	Whiskey Sour	\N	465	t	Combine bourbon, lemon juice, and simple syrup in a cocktail shaker. Fill shaker with ice, cover, and shake about 20 seconds. Strain cocktail through a Hawthorne strainer into an old-fashioned or rocks glass filled with ice. Garnish with orange wheel and cherry.	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	2023-06-05 15:48:15.125917	f	f
403	Blue Hawaiian	\N	469	t	Gather the ingredients. In a mixing glass filled with ice cubes, pour the rum, blue curacao, pineapple juice, and cream of coconut. Stir well for at least 30 seconds. Strain into a collins glass filled with fresh ice cubes. Garnish with a cherry and pineapple wedge.	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	f	f
404	Margarita	\N	466	t	Moisten the rim of a glass with a lime wedge. Sprinkle salt onto a plate. Lightly dip the moistened rim into the salt. Place a large ice cube in the glass and freeze the prepared glass until ready to serve. Fill a cocktail shaker with fresh ice. Add tequila, triple sec, and lime juice. Cover and shake vigorously until the outside of the shaker has frosted. Strain margarita into the chilled glass and garnish with a slice of lime.	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	f	f
405	Blue Margarita	\N	467	t	Moisten the rim of a glass with a lime wedge. Sprinkle salt onto a plate. Lightly dip the moistened rim into the salt. Place a large ice cube in the glass and freeze the prepared glass until ready to serve. Fill a cocktail shaker with fresh ice. Add tequila, blue curaso, symple syrup and lime juice. Cover and shake vigorously until the outside of the shaker has frosted. Strain margarita into the chilled glass and garnish with a slice of lime.	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	f	f
406	Ginger Apple Ball	\N	468	t	Combine apple juice, vodka, lime juice, ginger, cayenne pepper, and ice in a cocktail shaker. Cover and shake until combined. Strain mixture into 2 (10-oz.) ice-filled glasses. Top each cocktail with 2-oz. ginger beer. Garnish with skewered apple slices, if desired.	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	2023-06-05 16:17:50.564435	f	f
407	Liver Pool	\N	\N	t	Signiture Cocktail that is unknown	2023-06-05 16:25:12.013623	2023-06-05 16:25:12.013623	2023-06-05 16:25:12.013623	f	t
408	Blue Sapphire	\N	470	t	Fill in the glass with ice. combine Blue Curacao, Peach schnapps, Coconut Liqueur and Fresh Lemon Juice. stir it. Add tonic water. Decoration slice lemon.	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	f	f
409	Apple Martini	\N	471	t	Fill a cocktail shaker with ice and pour in all ingredients. Shake until chilled and strain into martini glass.	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	f	f
410	Long Beach Iced Tea	\N	472	t	Gather the ingredients. Build the ingredients in order in a Collins glass filled with ice. Stir well. Garnish with a lemon slice, if desired. Serve and enjoy.	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	f	f
411	June Bug	\N	473	t	Fill a cocktail shaker with ice. Pour in all the ingredients, and shake until chilled. Strain the mixture into a collins glass over ice.	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	f	f
412	Blackbee Milk	\N	\N	t	Signiture Cocktail that is unknown	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	2023-06-05 16:37:31.632743	f	t
413	A.M.F (Adios Mother Fucker)	\N	474	t	Add the vodka, rum, tequila, gin, blue curaçao and sweet-and-sour mix to a highball glass with ice and stir. Top with Sprite or 7Up. Garnish with a lemon wedge.	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
416	Blue Lemon Mojito	\N	477	t	Muddle the mint, lime and simple sugar in a glass using a muddler. Add Rum, Blue Curacao and Ice to the glass. You can also try using lemon or lime flavored soda if preferred. In this case cut back on the simple syrup otherwise your drink will be too sweet. Add a slice of lime for garnish if desired.	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
415	Okbodan	\N	476	t	Rim the margarita glass. Pour grenadine syrup and crused ice. Pour peach schnapps, malibu, sweet and sour mix, orange juice into a shaker and mix it well. Slowly pour it into the glass for the layor. Garnish with lemon and cherry.	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
418	Pineapple Sunshine	\N	479	f	Blend all ingredients until smooth. Pour into a chilled highball glass. Garnish with a pineapple slice and a physalis berry or a maraschino cherry.	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
414	Sex on The Beach	\N	475	t	Build the ingredients in a hurricane glass with ice. Stir. Garnish with orange slices and some cherries. Drink up!	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
417	Hendrick's Gin Tonic	\N	478	t	Combine all ingredients in a highball glass filled with cubed ice. Lightly stir. Garnish with 3 thinly sliced rounds of cucumber and serve.	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	2023-06-05 17:02:43.313198	f	f
419	Vodka Cranberry	\N	480	t	Fill an old-fashioned glass halfway up with ice. Pour all the ingredients in. Serve with a straw for stirring and sipping.	2023-06-05 17:13:03.356182	2023-06-05 17:13:03.356182	2023-06-05 17:13:03.356182	f	f
433	Gee	\N	482	t	Shoot the first four shots in order listed, suck the lemon then chase it with a beer.	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
434	Pepe Latte	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
436	Happy Sky	\N	484	t	Combine passion fruit juice, rum and blue curacao in a coctail shaker or pitcher with ice. Shake or stir to combine, then strain into a glass. If desired, decorate the rim of the glass as shown in the picture by dipping the rim first into corn syrup, then into the sugar.	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
437	Peach Blossom	\N	485	t	Add Peachtree, triple sec, lemon juice, lime juice and apple juice in shaker and shake. Pour grenadine syrup in glass with ice. Pour shaker include. Fill up soda.	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
439	East Sea	\N	487	t	Add ingredient in shaker and shake. pour glass with ice.	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
440	I'm Sang Soon	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
441	Sunday Seoul	\N	488	t	Add ingredient in shaker and shake. Pour in glass with ice. Fill up with cider	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
444	월하정인	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
438	Temptation	\N	486	t	Fill a mixing glass with ice cubes. Add all ingredients. Stir and strain into a cocktail glass. Garnish with lemon zest and orange.	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	f
445	Fortune	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
442	Yukinohana	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
443	Vikini	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
435	Red Sky	\N	\N	t	Signiture Cocktail that is unknown	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	2023-06-06 13:28:28.58153	f	t
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.image (image_id, image_path, image_created_at, image_updated_at, image_deleted_at, image_deleted) FROM stdin;
44	44.jpg	2023-06-05 23:07:56.901773	2023-06-05 23:07:56.901773	\N	f
31	31.jpg	2023-06-05 23:07:56.814758	2023-06-05 23:07:56.814758	\N	f
32	32.jpg	2023-06-05 23:07:56.820788	2023-06-05 23:07:56.820788	\N	f
33	33.jpg	2023-06-05 23:07:56.827506	2023-06-05 23:07:56.827506	\N	f
34	34.jpg	2023-06-05 23:07:56.832626	2023-06-05 23:07:56.832626	\N	f
35	35.jpg	2023-06-05 23:07:56.840864	2023-06-05 23:07:56.840864	\N	f
45	45.jpg	2023-06-05 23:07:56.907236	2023-06-05 23:07:56.907236	\N	f
11	11.jpg	2023-06-05 23:07:56.6962	2023-06-05 23:07:56.6962	\N	f
12	12.jpg	2023-06-05 23:07:56.70074	2023-06-05 23:07:56.70074	\N	f
55	55.jpg	2023-06-05 23:07:56.962491	2023-06-05 23:07:56.962491	\N	f
13	13.jpg	2023-06-05 23:07:56.708258	2023-06-05 23:07:56.708258	\N	f
14	14.jpg	2023-06-05 23:07:56.712755	2023-06-05 23:07:56.712755	\N	f
15	15.jpg	2023-06-05 23:07:56.717306	2023-06-05 23:07:56.717306	\N	f
16	16.jpg	2023-06-05 23:07:56.72655	2023-06-05 23:07:56.72655	\N	f
23	23.jpg	2023-06-05 23:07:56.766198	2023-06-05 23:07:56.766198	\N	f
46	46.jpg	2023-06-05 23:07:56.913863	2023-06-05 23:07:56.913863	\N	f
47	47.jpg	2023-06-05 23:07:56.920442	2023-06-05 23:07:56.920442	\N	f
48	48.jpg	2023-06-05 23:07:56.921298	2023-06-05 23:07:56.921298	\N	f
49	49.jpg	2023-06-05 23:07:56.926432	2023-06-05 23:07:56.926432	\N	f
50	50.jpg	2023-06-05 23:07:56.934836	2023-06-05 23:07:56.934836	\N	f
51	51.jpg	2023-06-05 23:07:56.945383	2023-06-05 23:07:56.945383	\N	f
1	1.jpg	2023-06-05 23:07:56.640508	2023-06-05 23:07:56.640508	\N	f
52	52.jpg	2023-06-05 23:07:56.952037	2023-06-05 23:07:56.952037	\N	f
10	10.jpg	2023-06-05 23:07:56.691569	2023-06-05 23:07:56.691569	\N	f
36	36.jpg	2023-06-05 23:07:56.851517	2023-06-05 23:07:56.851517	\N	f
37	37.jpg	2023-06-05 23:07:56.857949	2023-06-05 23:07:56.857949	\N	f
38	38.jpg	2023-06-05 23:07:56.865595	2023-06-05 23:07:56.865595	\N	f
39	39.jpg	2023-06-05 23:07:56.8741	2023-06-05 23:07:56.8741	\N	f
40	40.jpg	2023-06-05 23:07:56.880606	2023-06-05 23:07:56.880606	\N	f
24	24.jpg	2023-06-05 23:07:56.769584	2023-06-05 23:07:56.769584	\N	f
25	25.jpg	2023-06-05 23:07:56.776935	2023-06-05 23:07:56.776935	\N	f
26	26.jpg	2023-06-05 23:07:56.784979	2023-06-05 23:07:56.784979	\N	f
27	27.jpg	2023-06-05 23:07:56.790167	2023-06-05 23:07:56.790167	\N	f
28	28.jpg	2023-06-05 23:07:56.795658	2023-06-05 23:07:56.795658	\N	f
5	5.jpg	2023-06-05 23:07:56.668092	2023-06-05 23:07:56.668092	\N	f
6	6.jpg	2023-06-05 23:07:56.672922	2023-06-05 23:07:56.672922	\N	f
17	17.jpg	2023-06-05 23:07:56.732147	2023-06-05 23:07:56.732147	\N	f
18	18.jpg	2023-06-05 23:07:56.738671	2023-06-05 23:07:56.738671	\N	f
19	19.jpg	2023-06-05 23:07:56.742769	2023-06-05 23:07:56.742769	\N	f
20	20.jpg	2023-06-05 23:07:56.749113	2023-06-05 23:07:56.749113	\N	f
29	29.jpg	2023-06-05 23:07:56.802758	2023-06-05 23:07:56.802758	\N	f
30	30.jpg	2023-06-05 23:07:56.810519	2023-06-05 23:07:56.810519	\N	f
53	53.jpg	2023-06-05 23:07:56.955266	2023-06-05 23:07:56.955266	\N	f
56	56.jpg	2023-06-05 23:07:56.967975	2023-06-05 23:07:56.967975	\N	f
57	57.jpg	2023-06-05 23:07:56.972198	2023-06-05 23:07:56.972198	\N	f
58	58.jpg	2023-06-05 23:07:56.975738	2023-06-05 23:07:56.975738	\N	f
59	59.jpg	2023-06-05 23:07:56.983132	2023-06-05 23:07:56.983132	\N	f
60	60.jpg	2023-06-05 23:07:56.987279	2023-06-05 23:07:56.987279	\N	f
61	61.jpg	2023-06-05 23:07:56.993004	2023-06-05 23:07:56.993004	\N	f
2	2.jpg	2023-06-05 23:07:56.65052	2023-06-05 23:07:56.65052	\N	f
54	54.jpg	2023-06-05 23:07:56.960009	2023-06-05 23:07:56.960009	\N	f
3	3.jpg	2023-06-05 23:07:56.655475	2023-06-05 23:07:56.655475	\N	f
4	4.jpg	2023-06-05 23:07:56.662066	2023-06-05 23:07:56.662066	\N	f
21	21.jpg	2023-06-05 23:07:56.75438	2023-06-05 23:07:56.75438	\N	f
22	22.jpg	2023-06-05 23:07:56.760327	2023-06-05 23:07:56.760327	\N	f
7	7.jpg	2023-06-05 23:07:56.678457	2023-06-05 23:07:56.678457	\N	f
8	8.jpg	2023-06-05 23:07:56.682092	2023-06-05 23:07:56.682092	\N	f
491	491.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
485	485.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
493	493.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
494	494.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
492	492.jpeg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
495	495.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
497	497.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
498	498.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
499	499.webp	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
503	503.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
502	502.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
504	504.jpg	2023-06-06 13:12:59.265211	2023-06-06 13:12:59.265211	\N	f
489	489.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
9	9.jpg	2023-06-05 23:07:56.68319	2023-06-05 23:07:56.68319	\N	f
41	41.jpg	2023-06-05 23:07:56.889208	2023-06-05 23:07:56.889208	\N	f
42	42.jpg	2023-06-05 23:07:56.895057	2023-06-05 23:07:56.895057	\N	f
43	43.jpg	2023-06-05 23:07:56.89628	2023-06-05 23:07:56.89628	\N	f
501	501.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
488	488.jpeg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
487	487.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
484	484.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
490	490.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
482	482.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
483	483.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
95	95.jpg	2023-06-05 23:07:57.131992	2023-06-05 23:07:57.131992	\N	f
96	96.jpg	2023-06-05 23:07:57.13286	2023-06-05 23:07:57.13286	\N	f
106	106.jpg	2023-06-05 23:07:57.172099	2023-06-05 23:07:57.172099	\N	f
72	72.jpg	2023-06-05 23:07:57.044859	2023-06-05 23:07:57.044859	\N	f
73	73.jpg	2023-06-05 23:07:57.051773	2023-06-05 23:07:57.051773	\N	f
116	116.jpg	2023-06-05 23:07:57.223775	2023-06-05 23:07:57.223775	\N	f
74	74.jpg	2023-06-05 23:07:57.055013	2023-06-05 23:07:57.055013	\N	f
75	75.jpg	2023-06-05 23:07:57.055826	2023-06-05 23:07:57.055826	\N	f
76	76.jpg	2023-06-05 23:07:57.063276	2023-06-05 23:07:57.063276	\N	f
77	77.jpg	2023-06-05 23:07:57.069409	2023-06-05 23:07:57.069409	\N	f
84	84.jpg	2023-06-05 23:07:57.101735	2023-06-05 23:07:57.101735	\N	f
107	107.jpg	2023-06-05 23:07:57.176477	2023-06-05 23:07:57.176477	\N	f
108	108.jpg	2023-06-05 23:07:57.184098	2023-06-05 23:07:57.184098	\N	f
109	109.jpg	2023-06-05 23:07:57.185067	2023-06-05 23:07:57.185067	\N	f
110	110.jpg	2023-06-05 23:07:57.19288	2023-06-05 23:07:57.19288	\N	f
111	111.jpg	2023-06-05 23:07:57.200497	2023-06-05 23:07:57.200497	\N	f
112	112.jpg	2023-06-05 23:07:57.201491	2023-06-05 23:07:57.201491	\N	f
113	113.jpg	2023-06-05 23:07:57.206171	2023-06-05 23:07:57.206171	\N	f
71	71.jpg	2023-06-05 23:07:57.03991	2023-06-05 23:07:57.03991	\N	f
97	97.jpg	2023-06-05 23:07:57.137013	2023-06-05 23:07:57.137013	\N	f
98	98.jpg	2023-06-05 23:07:57.141287	2023-06-05 23:07:57.141287	\N	f
99	99.jpg	2023-06-05 23:07:57.146892	2023-06-05 23:07:57.146892	\N	f
100	100.jpg	2023-06-05 23:07:57.155981	2023-06-05 23:07:57.155981	\N	f
101	101.jpg	2023-06-05 23:07:57.16332	2023-06-05 23:07:57.16332	\N	f
85	85.jpg	2023-06-05 23:07:57.10257	2023-06-05 23:07:57.10257	\N	f
86	86.jpg	2023-06-05 23:07:57.10347	2023-06-05 23:07:57.10347	\N	f
87	87.jpg	2023-06-05 23:07:57.104338	2023-06-05 23:07:57.104338	\N	f
88	88.jpg	2023-06-05 23:07:57.108307	2023-06-05 23:07:57.108307	\N	f
89	89.jpg	2023-06-05 23:07:57.112605	2023-06-05 23:07:57.112605	\N	f
66	66.jpg	2023-06-05 23:07:57.01501	2023-06-05 23:07:57.01501	\N	f
67	67.jpg	2023-06-05 23:07:57.020666	2023-06-05 23:07:57.020666	\N	f
78	78.jpg	2023-06-05 23:07:57.074551	2023-06-05 23:07:57.074551	\N	f
79	79.jpg	2023-06-05 23:07:57.078775	2023-06-05 23:07:57.078775	\N	f
80	80.jpg	2023-06-05 23:07:57.082086	2023-06-05 23:07:57.082086	\N	f
81	81.jpg	2023-06-05 23:07:57.087862	2023-06-05 23:07:57.087862	\N	f
90	90.jpg	2023-06-05 23:07:57.113445	2023-06-05 23:07:57.113445	\N	f
91	91.jpg	2023-06-05 23:07:57.117872	2023-06-05 23:07:57.117872	\N	f
114	114.jpg	2023-06-05 23:07:57.214674	2023-06-05 23:07:57.214674	\N	f
117	117.jpg	2023-06-05 23:07:57.230128	2023-06-05 23:07:57.230128	\N	f
118	118.jpg	2023-06-05 23:07:57.235517	2023-06-05 23:07:57.235517	\N	f
119	119.jpg	2023-06-05 23:07:57.239203	2023-06-05 23:07:57.239203	\N	f
120	120.jpg	2023-06-05 23:07:57.245976	2023-06-05 23:07:57.245976	\N	f
121	121.jpg	2023-06-05 23:07:57.249991	2023-06-05 23:07:57.249991	\N	f
122	122.jpg	2023-06-05 23:07:57.255547	2023-06-05 23:07:57.255547	\N	f
62	62.jpg	2023-06-05 23:07:56.998693	2023-06-05 23:07:56.998693	\N	f
63	63.jpg	2023-06-05 23:07:56.999675	2023-06-05 23:07:56.999675	\N	f
115	115.jpg	2023-06-05 23:07:57.218127	2023-06-05 23:07:57.218127	\N	f
64	64.jpg	2023-06-05 23:07:57.004513	2023-06-05 23:07:57.004513	\N	f
65	65.jpg	2023-06-05 23:07:57.008534	2023-06-05 23:07:57.008534	\N	f
82	82.jpg	2023-06-05 23:07:57.092522	2023-06-05 23:07:57.092522	\N	f
83	83.jpg	2023-06-05 23:07:57.097468	2023-06-05 23:07:57.097468	\N	f
68	68.jpg	2023-06-05 23:07:57.021502	2023-06-05 23:07:57.021502	\N	f
69	69.jpg	2023-06-05 23:07:57.02776	2023-06-05 23:07:57.02776	\N	f
70	70.jpg	2023-06-05 23:07:57.035694	2023-06-05 23:07:57.035694	\N	f
102	102.jpg	2023-06-05 23:07:57.168209	2023-06-05 23:07:57.168209	\N	f
103	103.jpg	2023-06-05 23:07:57.169181	2023-06-05 23:07:57.169181	\N	f
104	104.jpg	2023-06-05 23:07:57.170176	2023-06-05 23:07:57.170176	\N	f
486	486.jpg	2023-06-06 12:53:12.661622	2023-06-06 12:53:12.661622	\N	f
105	105.jpg	2023-06-05 23:07:57.171084	2023-06-05 23:07:57.171084	\N	f
92	92.jpg	2023-06-05 23:07:57.123101	2023-06-05 23:07:57.123101	\N	f
93	93.jpg	2023-06-05 23:07:57.124008	2023-06-05 23:07:57.124008	\N	f
94	94.jpg	2023-06-05 23:07:57.127313	2023-06-05 23:07:57.127313	\N	f
156	156.jpg	2023-06-05 23:07:57.416235	2023-06-05 23:07:57.416235	\N	f
157	157.jpg	2023-06-05 23:07:57.41942	2023-06-05 23:07:57.41942	\N	f
167	167.jpg	2023-06-05 23:07:57.442513	2023-06-05 23:07:57.442513	\N	f
133	133.jpg	2023-06-05 23:07:57.30605	2023-06-05 23:07:57.30605	\N	f
134	134.jpg	2023-06-05 23:07:57.311909	2023-06-05 23:07:57.311909	\N	f
177	177.jpg	2023-06-05 23:07:57.498537	2023-06-05 23:07:57.498537	\N	f
135	135.jpg	2023-06-05 23:07:57.315178	2023-06-05 23:07:57.315178	\N	f
136	136.jpg	2023-06-05 23:07:57.318669	2023-06-05 23:07:57.318669	\N	f
137	137.jpg	2023-06-05 23:07:57.319563	2023-06-05 23:07:57.319563	\N	f
138	138.jpg	2023-06-05 23:07:57.326199	2023-06-05 23:07:57.326199	\N	f
145	145.jpg	2023-06-05 23:07:57.364248	2023-06-05 23:07:57.364248	\N	f
168	168.jpg	2023-06-05 23:07:57.447591	2023-06-05 23:07:57.447591	\N	f
169	169.jpg	2023-06-05 23:07:57.453035	2023-06-05 23:07:57.453035	\N	f
170	170.jpg	2023-06-05 23:07:57.461622	2023-06-05 23:07:57.461622	\N	f
171	171.jpg	2023-06-05 23:07:57.462631	2023-06-05 23:07:57.462631	\N	f
172	172.jpg	2023-06-05 23:07:57.467664	2023-06-05 23:07:57.467664	\N	f
173	173.jpg	2023-06-05 23:07:57.472761	2023-06-05 23:07:57.472761	\N	f
182	182.jpg	2023-06-05 23:07:57.524123	2023-06-05 23:07:57.524123	\N	f
174	174.jpg	2023-06-05 23:07:57.480117	2023-06-05 23:07:57.480117	\N	f
132	132.jpg	2023-06-05 23:07:57.299993	2023-06-05 23:07:57.299993	\N	f
158	158.jpg	2023-06-05 23:07:57.420263	2023-06-05 23:07:57.420263	\N	f
159	159.jpg	2023-06-05 23:07:57.421119	2023-06-05 23:07:57.421119	\N	f
160	160.jpg	2023-06-05 23:07:57.421962	2023-06-05 23:07:57.421962	\N	f
161	161.jpg	2023-06-05 23:07:57.422782	2023-06-05 23:07:57.422782	\N	f
162	162.jpg	2023-06-05 23:07:57.427462	2023-06-05 23:07:57.427462	\N	f
146	146.jpg	2023-06-05 23:07:57.370508	2023-06-05 23:07:57.370508	\N	f
147	147.jpg	2023-06-05 23:07:57.376891	2023-06-05 23:07:57.376891	\N	f
148	148.jpg	2023-06-05 23:07:57.379407	2023-06-05 23:07:57.379407	\N	f
149	149.jpg	2023-06-05 23:07:57.386183	2023-06-05 23:07:57.386183	\N	f
150	150.jpg	2023-06-05 23:07:57.392173	2023-06-05 23:07:57.392173	\N	f
127	127.jpg	2023-06-05 23:07:57.277202	2023-06-05 23:07:57.277202	\N	f
128	128.jpg	2023-06-05 23:07:57.282955	2023-06-05 23:07:57.282955	\N	f
139	139.jpg	2023-06-05 23:07:57.331416	2023-06-05 23:07:57.331416	\N	f
140	140.jpg	2023-06-05 23:07:57.339282	2023-06-05 23:07:57.339282	\N	f
141	141.jpg	2023-06-05 23:07:57.346741	2023-06-05 23:07:57.346741	\N	f
142	142.jpg	2023-06-05 23:07:57.347639	2023-06-05 23:07:57.347639	\N	f
151	151.jpg	2023-06-05 23:07:57.397298	2023-06-05 23:07:57.397298	\N	f
152	152.jpg	2023-06-05 23:07:57.4015	2023-06-05 23:07:57.4015	\N	f
175	175.jpg	2023-06-05 23:07:57.48575	2023-06-05 23:07:57.48575	\N	f
178	178.jpg	2023-06-05 23:07:57.50436	2023-06-05 23:07:57.50436	\N	f
179	179.jpg	2023-06-05 23:07:57.509197	2023-06-05 23:07:57.509197	\N	f
180	180.jpg	2023-06-05 23:07:57.512577	2023-06-05 23:07:57.512577	\N	f
181	181.jpg	2023-06-05 23:07:57.517961	2023-06-05 23:07:57.517961	\N	f
183	183.jpg	2023-06-05 23:07:57.524923	2023-06-05 23:07:57.524923	\N	f
123	123.jpg	2023-06-05 23:07:57.262615	2023-06-05 23:07:57.262615	\N	f
124	124.jpg	2023-06-05 23:07:57.270239	2023-06-05 23:07:57.270239	\N	f
176	176.jpg	2023-06-05 23:07:57.493214	2023-06-05 23:07:57.493214	\N	f
125	125.jpg	2023-06-05 23:07:57.271111	2023-06-05 23:07:57.271111	\N	f
126	126.jpg	2023-06-05 23:07:57.271938	2023-06-05 23:07:57.271938	\N	f
143	143.jpg	2023-06-05 23:07:57.353705	2023-06-05 23:07:57.353705	\N	f
144	144.jpg	2023-06-05 23:07:57.357673	2023-06-05 23:07:57.357673	\N	f
129	129.jpg	2023-06-05 23:07:57.285546	2023-06-05 23:07:57.285546	\N	f
130	130.jpg	2023-06-05 23:07:57.291367	2023-06-05 23:07:57.291367	\N	f
131	131.jpg	2023-06-05 23:07:57.29567	2023-06-05 23:07:57.29567	\N	f
163	163.jpg	2023-06-05 23:07:57.428415	2023-06-05 23:07:57.428415	\N	f
164	164.jpg	2023-06-05 23:07:57.429445	2023-06-05 23:07:57.429445	\N	f
165	165.jpg	2023-06-05 23:07:57.434126	2023-06-05 23:07:57.434126	\N	f
166	166.jpg	2023-06-05 23:07:57.438396	2023-06-05 23:07:57.438396	\N	f
153	153.jpg	2023-06-05 23:07:57.40572	2023-06-05 23:07:57.40572	\N	f
154	154.jpg	2023-06-05 23:07:57.409647	2023-06-05 23:07:57.409647	\N	f
155	155.jpg	2023-06-05 23:07:57.415298	2023-06-05 23:07:57.415298	\N	f
217	217.jpg	2023-06-05 23:07:57.675946	2023-06-05 23:07:57.675946	\N	f
218	218.jpg	2023-06-05 23:07:57.677049	2023-06-05 23:07:57.677049	\N	f
228	228.jpg	2023-06-05 23:07:57.726698	2023-06-05 23:07:57.726698	\N	f
194	194.jpg	2023-06-05 23:07:57.572418	2023-06-05 23:07:57.572418	\N	f
195	195.jpg	2023-06-05 23:07:57.575929	2023-06-05 23:07:57.575929	\N	f
238	238.jpg	2023-06-05 23:07:57.793661	2023-06-05 23:07:57.793661	\N	f
196	196.jpg	2023-06-05 23:07:57.57981	2023-06-05 23:07:57.57981	\N	f
197	197.jpg	2023-06-05 23:07:57.58415	2023-06-05 23:07:57.58415	\N	f
198	198.jpg	2023-06-05 23:07:57.587479	2023-06-05 23:07:57.587479	\N	f
199	199.jpg	2023-06-05 23:07:57.592973	2023-06-05 23:07:57.592973	\N	f
206	206.jpg	2023-06-05 23:07:57.629764	2023-06-05 23:07:57.629764	\N	f
229	229.jpg	2023-06-05 23:07:57.731917	2023-06-05 23:07:57.731917	\N	f
230	230.jpg	2023-06-05 23:07:57.740781	2023-06-05 23:07:57.740781	\N	f
231	231.jpg	2023-06-05 23:07:57.755496	2023-06-05 23:07:57.755496	\N	f
232	232.jpg	2023-06-05 23:07:57.75662	2023-06-05 23:07:57.75662	\N	f
233	233.jpg	2023-06-05 23:07:57.757603	2023-06-05 23:07:57.757603	\N	f
234	234.jpg	2023-06-05 23:07:57.763751	2023-06-05 23:07:57.763751	\N	f
235	235.jpg	2023-06-05 23:07:57.768249	2023-06-05 23:07:57.768249	\N	f
193	193.jpg	2023-06-05 23:07:57.571573	2023-06-05 23:07:57.571573	\N	f
219	219.jpg	2023-06-05 23:07:57.683272	2023-06-05 23:07:57.683272	\N	f
220	220.jpg	2023-06-05 23:07:57.687567	2023-06-05 23:07:57.687567	\N	f
221	221.jpg	2023-06-05 23:07:57.693598	2023-06-05 23:07:57.693598	\N	f
222	222.jpg	2023-06-05 23:07:57.700404	2023-06-05 23:07:57.700404	\N	f
223	223.jpg	2023-06-05 23:07:57.70145	2023-06-05 23:07:57.70145	\N	f
207	207.jpg	2023-06-05 23:07:57.634151	2023-06-05 23:07:57.634151	\N	f
208	208.jpg	2023-06-05 23:07:57.635446	2023-06-05 23:07:57.635446	\N	f
209	209.jpg	2023-06-05 23:07:57.64057	2023-06-05 23:07:57.64057	\N	f
210	210.jpg	2023-06-05 23:07:57.645685	2023-06-05 23:07:57.645685	\N	f
211	211.jpg	2023-06-05 23:07:57.650284	2023-06-05 23:07:57.650284	\N	f
188	188.jpg	2023-06-05 23:07:57.549296	2023-06-05 23:07:57.549296	\N	f
189	189.jpg	2023-06-05 23:07:57.555415	2023-06-05 23:07:57.555415	\N	f
200	200.jpg	2023-06-05 23:07:57.598811	2023-06-05 23:07:57.598811	\N	f
201	201.jpg	2023-06-05 23:07:57.60236	2023-06-05 23:07:57.60236	\N	f
202	202.jpg	2023-06-05 23:07:57.603315	2023-06-05 23:07:57.603315	\N	f
203	203.jpg	2023-06-05 23:07:57.612348	2023-06-05 23:07:57.612348	\N	f
212	212.jpg	2023-06-05 23:07:57.654987	2023-06-05 23:07:57.654987	\N	f
213	213.jpg	2023-06-05 23:07:57.659521	2023-06-05 23:07:57.659521	\N	f
236	236.jpg	2023-06-05 23:07:57.777043	2023-06-05 23:07:57.777043	\N	f
239	239.jpg	2023-06-05 23:07:57.802229	2023-06-05 23:07:57.802229	\N	f
240	240.jpg	2023-06-05 23:07:57.803512	2023-06-05 23:07:57.803512	\N	f
241	241.jpg	2023-06-05 23:07:57.809176	2023-06-05 23:07:57.809176	\N	f
242	242.jpg	2023-06-05 23:07:57.8142	2023-06-05 23:07:57.8142	\N	f
243	243.jpg	2023-06-05 23:07:57.819344	2023-06-05 23:07:57.819344	\N	f
244	244.jpg	2023-06-05 23:07:57.823618	2023-06-05 23:07:57.823618	\N	f
184	184.jpg	2023-06-05 23:07:57.528346	2023-06-05 23:07:57.528346	\N	f
185	185.jpg	2023-06-05 23:07:57.532546	2023-06-05 23:07:57.532546	\N	f
237	237.jpg	2023-06-05 23:07:57.782269	2023-06-05 23:07:57.782269	\N	f
186	186.jpg	2023-06-05 23:07:57.537522	2023-06-05 23:07:57.537522	\N	f
187	187.jpg	2023-06-05 23:07:57.541849	2023-06-05 23:07:57.541849	\N	f
204	204.jpg	2023-06-05 23:07:57.617862	2023-06-05 23:07:57.617862	\N	f
205	205.jpg	2023-06-05 23:07:57.626237	2023-06-05 23:07:57.626237	\N	f
190	190.jpg	2023-06-05 23:07:57.559865	2023-06-05 23:07:57.559865	\N	f
191	191.jpg	2023-06-05 23:07:57.562265	2023-06-05 23:07:57.562265	\N	f
192	192.jpg	2023-06-05 23:07:57.567336	2023-06-05 23:07:57.567336	\N	f
224	224.jpg	2023-06-05 23:07:57.70598	2023-06-05 23:07:57.70598	\N	f
225	225.jpg	2023-06-05 23:07:57.712832	2023-06-05 23:07:57.712832	\N	f
226	226.jpg	2023-06-05 23:07:57.721148	2023-06-05 23:07:57.721148	\N	f
227	227.jpg	2023-06-05 23:07:57.723188	2023-06-05 23:07:57.723188	\N	f
214	214.jpg	2023-06-05 23:07:57.660623	2023-06-05 23:07:57.660623	\N	f
215	215.jpg	2023-06-05 23:07:57.667857	2023-06-05 23:07:57.667857	\N	f
216	216.jpg	2023-06-05 23:07:57.674978	2023-06-05 23:07:57.674978	\N	f
278	278.jpg	2023-06-05 23:07:57.983007	2023-06-05 23:07:57.983007	\N	f
279	279.jpg	2023-06-05 23:07:57.986358	2023-06-05 23:07:57.986358	\N	f
289	289.jpg	2023-06-05 23:07:58.052091	2023-06-05 23:07:58.052091	\N	f
255	255.jpg	2023-06-05 23:07:57.881708	2023-06-05 23:07:57.881708	\N	f
256	256.jpg	2023-06-05 23:07:57.886387	2023-06-05 23:07:57.886387	\N	f
299	299.jpg	2023-06-05 23:07:58.103473	2023-06-05 23:07:58.103473	\N	f
257	257.jpg	2023-06-05 23:07:57.887351	2023-06-05 23:07:57.887351	\N	f
258	258.jpg	2023-06-05 23:07:57.891813	2023-06-05 23:07:57.891813	\N	f
259	259.jpg	2023-06-05 23:07:57.896837	2023-06-05 23:07:57.896837	\N	f
260	260.jpg	2023-06-05 23:07:57.901346	2023-06-05 23:07:57.901346	\N	f
267	267.jpg	2023-06-05 23:07:57.94125	2023-06-05 23:07:57.94125	\N	f
290	290.jpg	2023-06-05 23:07:58.05589	2023-06-05 23:07:58.05589	\N	f
291	291.jpg	2023-06-05 23:07:58.061241	2023-06-05 23:07:58.061241	\N	f
292	292.jpg	2023-06-05 23:07:58.062085	2023-06-05 23:07:58.062085	\N	f
293	293.jpg	2023-06-05 23:07:58.070208	2023-06-05 23:07:58.070208	\N	f
294	294.jpg	2023-06-05 23:07:58.079194	2023-06-05 23:07:58.079194	\N	f
295	295.jpg	2023-06-05 23:07:58.086468	2023-06-05 23:07:58.086468	\N	f
296	296.jpg	2023-06-05 23:07:58.090061	2023-06-05 23:07:58.090061	\N	f
254	254.jpg	2023-06-05 23:07:57.874733	2023-06-05 23:07:57.874733	\N	f
280	280.jpg	2023-06-05 23:07:57.993054	2023-06-05 23:07:57.993054	\N	f
281	281.jpg	2023-06-05 23:07:57.998335	2023-06-05 23:07:57.998335	\N	f
282	282.jpg	2023-06-05 23:07:58.005755	2023-06-05 23:07:58.005755	\N	f
283	283.jpg	2023-06-05 23:07:58.014608	2023-06-05 23:07:58.014608	\N	f
284	284.jpg	2023-06-05 23:07:58.019597	2023-06-05 23:07:58.019597	\N	f
268	268.jpg	2023-06-05 23:07:57.946118	2023-06-05 23:07:57.946118	\N	f
269	269.jpg	2023-06-05 23:07:57.950678	2023-06-05 23:07:57.950678	\N	f
270	270.jpg	2023-06-05 23:07:57.956311	2023-06-05 23:07:57.956311	\N	f
271	271.jpg	2023-06-05 23:07:57.957237	2023-06-05 23:07:57.957237	\N	f
272	272.jpg	2023-06-05 23:07:57.958179	2023-06-05 23:07:57.958179	\N	f
249	249.jpg	2023-06-05 23:07:57.851416	2023-06-05 23:07:57.851416	\N	f
250	250.jpg	2023-06-05 23:07:57.855516	2023-06-05 23:07:57.855516	\N	f
261	261.jpg	2023-06-05 23:07:57.908971	2023-06-05 23:07:57.908971	\N	f
262	262.jpg	2023-06-05 23:07:57.914052	2023-06-05 23:07:57.914052	\N	f
263	263.jpg	2023-06-05 23:07:57.919048	2023-06-05 23:07:57.919048	\N	f
264	264.jpg	2023-06-05 23:07:57.92502	2023-06-05 23:07:57.92502	\N	f
273	273.jpg	2023-06-05 23:07:57.963581	2023-06-05 23:07:57.963581	\N	f
274	274.jpg	2023-06-05 23:07:57.972499	2023-06-05 23:07:57.972499	\N	f
297	297.jpg	2023-06-05 23:07:58.093586	2023-06-05 23:07:58.093586	\N	f
300	300.jpg	2023-06-05 23:07:58.107974	2023-06-05 23:07:58.107974	\N	f
301	301.jpg	2023-06-05 23:07:58.11148	2023-06-05 23:07:58.11148	\N	f
302	302.jpg	2023-06-05 23:07:58.116663	2023-06-05 23:07:58.116663	\N	f
303	303.jpg	2023-06-05 23:07:58.121454	2023-06-05 23:07:58.121454	\N	f
304	304.jpg	2023-06-05 23:07:58.122283	2023-06-05 23:07:58.122283	\N	f
305	305.jpg	2023-06-05 23:07:58.126379	2023-06-05 23:07:58.126379	\N	f
245	245.jpg	2023-06-05 23:07:57.828968	2023-06-05 23:07:57.828968	\N	f
246	246.jpg	2023-06-05 23:07:57.833277	2023-06-05 23:07:57.833277	\N	f
298	298.jpg	2023-06-05 23:07:58.098215	2023-06-05 23:07:58.098215	\N	f
247	247.jpg	2023-06-05 23:07:57.843324	2023-06-05 23:07:57.843324	\N	f
248	248.jpg	2023-06-05 23:07:57.844258	2023-06-05 23:07:57.844258	\N	f
265	265.jpg	2023-06-05 23:07:57.930087	2023-06-05 23:07:57.930087	\N	f
266	266.jpg	2023-06-05 23:07:57.934737	2023-06-05 23:07:57.934737	\N	f
251	251.jpg	2023-06-05 23:07:57.856405	2023-06-05 23:07:57.856405	\N	f
252	252.jpg	2023-06-05 23:07:57.86315	2023-06-05 23:07:57.86315	\N	f
253	253.jpg	2023-06-05 23:07:57.868807	2023-06-05 23:07:57.868807	\N	f
285	285.jpg	2023-06-05 23:07:58.024471	2023-06-05 23:07:58.024471	\N	f
286	286.jpg	2023-06-05 23:07:58.029567	2023-06-05 23:07:58.029567	\N	f
287	287.jpg	2023-06-05 23:07:58.035402	2023-06-05 23:07:58.035402	\N	f
288	288.jpg	2023-06-05 23:07:58.044978	2023-06-05 23:07:58.044978	\N	f
275	275.jpg	2023-06-05 23:07:57.973485	2023-06-05 23:07:57.973485	\N	f
276	276.jpg	2023-06-05 23:07:57.974303	2023-06-05 23:07:57.974303	\N	f
277	277.jpg	2023-06-05 23:07:57.978235	2023-06-05 23:07:57.978235	\N	f
339	339.jpg	2023-06-05 23:07:58.290942	2023-06-05 23:07:58.290942	\N	f
340	340.jpg	2023-06-05 23:07:58.291883	2023-06-05 23:07:58.291883	\N	f
350	350.jpg	2023-06-05 23:07:58.343759	2023-06-05 23:07:58.343759	\N	f
316	316.jpg	2023-06-05 23:07:58.175721	2023-06-05 23:07:58.175721	\N	f
317	317.jpg	2023-06-05 23:07:58.182097	2023-06-05 23:07:58.182097	\N	f
360	360.jpg	2023-06-05 23:07:58.388571	2023-06-05 23:07:58.388571	\N	f
318	318.jpg	2023-06-05 23:07:58.18653	2023-06-05 23:07:58.18653	\N	f
319	319.jpg	2023-06-05 23:07:58.191469	2023-06-05 23:07:58.191469	\N	f
320	320.jpg	2023-06-05 23:07:58.194735	2023-06-05 23:07:58.194735	\N	f
321	321.jpg	2023-06-05 23:07:58.199951	2023-06-05 23:07:58.199951	\N	f
328	328.jpg	2023-06-05 23:07:58.230305	2023-06-05 23:07:58.230305	\N	f
351	351.jpg	2023-06-05 23:07:58.346555	2023-06-05 23:07:58.346555	\N	f
352	352.jpg	2023-06-05 23:07:58.351736	2023-06-05 23:07:58.351736	\N	f
353	353.jpg	2023-06-05 23:07:58.352936	2023-06-05 23:07:58.352936	\N	f
354	354.jpg	2023-06-05 23:07:58.358182	2023-06-05 23:07:58.358182	\N	f
355	355.jpg	2023-06-05 23:07:58.361484	2023-06-05 23:07:58.361484	\N	f
356	356.jpg	2023-06-05 23:07:58.365874	2023-06-05 23:07:58.365874	\N	f
357	357.jpg	2023-06-05 23:07:58.37084	2023-06-05 23:07:58.37084	\N	f
315	315.jpg	2023-06-05 23:07:58.171466	2023-06-05 23:07:58.171466	\N	f
341	341.jpg	2023-06-05 23:07:58.296256	2023-06-05 23:07:58.296256	\N	f
342	342.jpg	2023-06-05 23:07:58.305454	2023-06-05 23:07:58.305454	\N	f
343	343.jpg	2023-06-05 23:07:58.306495	2023-06-05 23:07:58.306495	\N	f
344	344.jpg	2023-06-05 23:07:58.313215	2023-06-05 23:07:58.313215	\N	f
345	345.jpg	2023-06-05 23:07:58.319909	2023-06-05 23:07:58.319909	\N	f
329	329.jpg	2023-06-05 23:07:58.235746	2023-06-05 23:07:58.235746	\N	f
330	330.jpg	2023-06-05 23:07:58.239476	2023-06-05 23:07:58.239476	\N	f
331	331.jpg	2023-06-05 23:07:58.243842	2023-06-05 23:07:58.243842	\N	f
332	332.jpg	2023-06-05 23:07:58.252131	2023-06-05 23:07:58.252131	\N	f
333	333.jpg	2023-06-05 23:07:58.257955	2023-06-05 23:07:58.257955	\N	f
310	310.jpg	2023-06-05 23:07:58.145913	2023-06-05 23:07:58.145913	\N	f
311	311.jpg	2023-06-05 23:07:58.149285	2023-06-05 23:07:58.149285	\N	f
322	322.jpg	2023-06-05 23:07:58.207229	2023-06-05 23:07:58.207229	\N	f
323	323.jpg	2023-06-05 23:07:58.211401	2023-06-05 23:07:58.211401	\N	f
324	324.jpg	2023-06-05 23:07:58.213732	2023-06-05 23:07:58.213732	\N	f
325	325.jpg	2023-06-05 23:07:58.218921	2023-06-05 23:07:58.218921	\N	f
334	334.jpg	2023-06-05 23:07:58.267597	2023-06-05 23:07:58.267597	\N	f
335	335.jpg	2023-06-05 23:07:58.273461	2023-06-05 23:07:58.273461	\N	f
358	358.jpg	2023-06-05 23:07:58.375866	2023-06-05 23:07:58.375866	\N	f
361	361.jpg	2023-06-05 23:07:58.39668	2023-06-05 23:07:58.39668	\N	f
362	362.jpg	2023-06-05 23:07:58.404513	2023-06-05 23:07:58.404513	\N	f
363	363.jpg	2023-06-05 23:07:58.409466	2023-06-05 23:07:58.409466	\N	f
364	364.jpg	2023-06-05 23:07:58.413809	2023-06-05 23:07:58.413809	\N	f
365	365.jpg	2023-06-05 23:07:58.420147	2023-06-05 23:07:58.420147	\N	f
366	366.jpg	2023-06-05 23:07:58.42112	2023-06-05 23:07:58.42112	\N	f
306	306.jpg	2023-06-05 23:07:58.129689	2023-06-05 23:07:58.129689	\N	f
307	307.jpg	2023-06-05 23:07:58.134143	2023-06-05 23:07:58.134143	\N	f
359	359.jpg	2023-06-05 23:07:58.383844	2023-06-05 23:07:58.383844	\N	f
308	308.jpg	2023-06-05 23:07:58.135001	2023-06-05 23:07:58.135001	\N	f
309	309.jpg	2023-06-05 23:07:58.139483	2023-06-05 23:07:58.139483	\N	f
326	326.jpg	2023-06-05 23:07:58.219747	2023-06-05 23:07:58.219747	\N	f
327	327.jpg	2023-06-05 23:07:58.22553	2023-06-05 23:07:58.22553	\N	f
312	312.jpg	2023-06-05 23:07:58.155594	2023-06-05 23:07:58.155594	\N	f
313	313.jpg	2023-06-05 23:07:58.162128	2023-06-05 23:07:58.162128	\N	f
314	314.jpg	2023-06-05 23:07:58.167258	2023-06-05 23:07:58.167258	\N	f
346	346.jpg	2023-06-05 23:07:58.32481	2023-06-05 23:07:58.32481	\N	f
347	347.jpg	2023-06-05 23:07:58.32969	2023-06-05 23:07:58.32969	\N	f
348	348.jpg	2023-06-05 23:07:58.333952	2023-06-05 23:07:58.333952	\N	f
349	349.jpg	2023-06-05 23:07:58.340334	2023-06-05 23:07:58.340334	\N	f
336	336.jpg	2023-06-05 23:07:58.277832	2023-06-05 23:07:58.277832	\N	f
337	337.jpg	2023-06-05 23:07:58.282144	2023-06-05 23:07:58.282144	\N	f
338	338.jpg	2023-06-05 23:07:58.28761	2023-06-05 23:07:58.28761	\N	f
410	410.jpg	2023-06-05 23:07:58.618471	2023-06-05 23:07:58.618471	\N	f
404	404.jpg	2023-06-05 23:07:58.59162	2023-06-05 23:07:58.59162	\N	f
405	405.jpg	2023-06-05 23:07:58.598795	2023-06-05 23:07:58.598795	\N	f
398	398.jpg	2023-06-05 23:07:58.56712	2023-06-05 23:07:58.56712	\N	f
399	399.jpg	2023-06-05 23:07:58.569564	2023-06-05 23:07:58.569564	\N	f
401	401.jpg	2023-06-05 23:07:58.577181	2023-06-05 23:07:58.577181	\N	f
390	390.jpg	2023-06-05 23:07:58.539681	2023-06-05 23:07:58.539681	\N	f
391	391.jpg	2023-06-05 23:07:58.544692	2023-06-05 23:07:58.544692	\N	f
392	392.jpg	2023-06-05 23:07:58.545653	2023-06-05 23:07:58.545653	\N	f
393	393.jpg	2023-06-05 23:07:58.549964	2023-06-05 23:07:58.549964	\N	f
383	383.jpg	2023-06-05 23:07:58.506786	2023-06-05 23:07:58.506786	\N	f
384	384.jpg	2023-06-05 23:07:58.513002	2023-06-05 23:07:58.513002	\N	f
385	385.jpg	2023-06-05 23:07:58.518315	2023-06-05 23:07:58.518315	\N	f
386	386.jpg	2023-06-05 23:07:58.522716	2023-06-05 23:07:58.522716	\N	f
387	387.jpg	2023-06-05 23:07:58.523798	2023-06-05 23:07:58.523798	\N	f
388	388.jpg	2023-06-05 23:07:58.530466	2023-06-05 23:07:58.530466	\N	f
389	389.jpg	2023-06-05 23:07:58.534463	2023-06-05 23:07:58.534463	\N	f
425	425.jpg	2023-06-05 23:07:58.673018	2023-06-05 23:07:58.673018	\N	f
400	400.jpg	2023-06-05 23:07:58.573757	2023-06-05 23:07:58.573757	\N	f
369	369.jpg	2023-06-05 23:07:58.438036	2023-06-05 23:07:58.438036	\N	f
370	370.jpg	2023-06-05 23:07:58.442659	2023-06-05 23:07:58.442659	\N	f
371	371.jpg	2023-06-05 23:07:58.447908	2023-06-05 23:07:58.447908	\N	f
372	372.jpg	2023-06-05 23:07:58.453933	2023-06-05 23:07:58.453933	\N	f
373	373.jpg	2023-06-05 23:07:58.460815	2023-06-05 23:07:58.460815	\N	f
374	374.jpg	2023-06-05 23:07:58.466477	2023-06-05 23:07:58.466477	\N	f
421	421.jpg	2023-06-05 23:07:58.662149	2023-06-05 23:07:58.662149	\N	f
422	422.jpg	2023-06-05 23:07:58.666216	2023-06-05 23:07:58.666216	\N	f
426	426.jpg	2023-06-05 23:07:58.676314	2023-06-05 23:07:58.676314	\N	f
427	427.jpg	2023-06-05 23:07:58.681496	2023-06-05 23:07:58.681496	\N	f
367	367.jpg	2023-06-05 23:07:58.429228	2023-06-05 23:07:58.429228	\N	f
411	411.jpg	2023-06-05 23:07:58.622705	2023-06-05 23:07:58.622705	\N	f
412	412.jpg	2023-06-05 23:07:58.632806	2023-06-05 23:07:58.632806	\N	f
413	413.jpg	2023-06-05 23:07:58.633638	2023-06-05 23:07:58.633638	\N	f
414	414.jpg	2023-06-05 23:07:58.63767	2023-06-05 23:07:58.63767	\N	f
415	415.jpg	2023-06-05 23:07:58.642044	2023-06-05 23:07:58.642044	\N	f
416	416.jpg	2023-06-05 23:07:58.644665	2023-06-05 23:07:58.644665	\N	f
417	417.jpg	2023-06-05 23:07:58.645539	2023-06-05 23:07:58.645539	\N	f
418	418.jpg	2023-06-05 23:07:58.650754	2023-06-05 23:07:58.650754	\N	f
419	419.jpg	2023-06-05 23:07:58.654385	2023-06-05 23:07:58.654385	\N	f
420	420.jpg	2023-06-05 23:07:58.657821	2023-06-05 23:07:58.657821	\N	f
368	368.jpg	2023-06-05 23:07:58.434553	2023-06-05 23:07:58.434553	\N	f
406	406.jpg	2023-06-05 23:07:58.599639	2023-06-05 23:07:58.599639	\N	f
407	407.jpg	2023-06-05 23:07:58.602835	2023-06-05 23:07:58.602835	\N	f
408	408.jpg	2023-06-05 23:07:58.603767	2023-06-05 23:07:58.603767	\N	f
409	409.jpg	2023-06-05 23:07:58.612631	2023-06-05 23:07:58.612631	\N	f
403	403.jpg	2023-06-05 23:07:58.587501	2023-06-05 23:07:58.587501	\N	f
379	379.jpg	2023-06-05 23:07:58.488802	2023-06-05 23:07:58.488802	\N	f
380	380.jpg	2023-06-05 23:07:58.496527	2023-06-05 23:07:58.496527	\N	f
381	381.jpg	2023-06-05 23:07:58.500174	2023-06-05 23:07:58.500174	\N	f
382	382.jpg	2023-06-05 23:07:58.501188	2023-06-05 23:07:58.501188	\N	f
423	423.jpg	2023-06-05 23:07:58.671426	2023-06-05 23:07:58.671426	\N	f
424	424.jpg	2023-06-05 23:07:58.67224	2023-06-05 23:07:58.67224	\N	f
375	375.jpg	2023-06-05 23:07:58.472904	2023-06-05 23:07:58.472904	\N	f
376	376.jpg	2023-06-05 23:07:58.474007	2023-06-05 23:07:58.474007	\N	f
377	377.jpg	2023-06-05 23:07:58.478743	2023-06-05 23:07:58.478743	\N	f
378	378.jpg	2023-06-05 23:07:58.481484	2023-06-05 23:07:58.481484	\N	f
402	402.jpg	2023-06-05 23:07:58.581446	2023-06-05 23:07:58.581446	\N	f
394	394.jpg	2023-06-05 23:07:58.550838	2023-06-05 23:07:58.550838	\N	f
396	396.jpg	2023-06-05 23:07:58.557461	2023-06-05 23:07:58.557461	\N	f
397	397.jpg	2023-06-05 23:07:58.560824	2023-06-05 23:07:58.560824	\N	f
471	471.jpg	2023-06-05 16:35:49.491125	2023-06-05 16:35:49.491125	\N	f
466	466.webp	2023-06-05 16:08:36.134321	2023-06-05 16:08:36.134321	\N	f
453	453.jpg	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
461	461.jpeg	2023-06-05 15:42:37.077092	2023-06-05 15:42:37.077092	\N	f
472	472.jpg	2023-06-05 16:35:49.491125	2023-06-05 16:35:49.491125	\N	f
473	473.jpg	2023-06-05 16:35:49.491125	2023-06-05 16:35:49.491125	\N	f
474	474.jpg	2023-06-05 16:56:58.995191	2023-06-05 16:56:58.995191	\N	f
475	475.jpg	2023-06-05 16:56:58.995191	2023-06-05 16:56:58.995191	\N	f
476	476.jpg	2023-06-05 16:56:58.995191	2023-06-05 16:56:58.995191	\N	f
477	477.webp	2023-06-05 16:56:58.995191	2023-06-05 16:56:58.995191	\N	f
478	478.jpg	2023-06-05 16:57:18.911998	2023-06-05 16:57:18.911998	\N	f
479	479.jpg	2023-06-05 16:57:18.911998	2023-06-05 16:57:18.911998	\N	f
480	480.jpg	2023-06-05 17:12:58.232402	2023-06-05 17:12:58.232402	\N	f
481	481.jpg	2023-06-05 17:22:18.734016	2023-06-05 17:22:18.734016	\N	f
465	465.jpg	2023-06-06 00:42:34	2023-06-05 15:42:37.077092	\N	f
452	452.jpg	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
468	468.png	2023-06-05 16:15:33.250971	2023-06-05 16:15:33.250971	\N	f
445	445.jpg	2023-06-05 14:31:11.141416	2023-06-05 14:31:11.141416	\N	f
428	428.jpg	2023-06-05 23:07:58.690331	2023-06-05 23:07:58.690331	\N	f
429	429.jpg	2023-06-05 23:07:58.693739	2023-06-05 23:07:58.693739	\N	f
430	430.jpg	2023-06-05 23:07:58.703935	2023-06-05 23:07:58.703935	\N	f
431	431.jpg	2023-06-05 23:07:58.707288	2023-06-05 23:07:58.707288	\N	f
432	432.jpg	2023-06-05 23:07:58.713594	2023-06-05 23:07:58.713594	\N	f
433	433.jpg	2023-06-05 23:07:58.717834	2023-06-05 23:07:58.717834	\N	f
434	434.jpg	2023-06-05 23:07:58.727443	2023-06-05 23:07:58.727443	\N	f
435	435.jpg	2023-06-05 23:07:58.729869	2023-06-05 23:07:58.729869	\N	f
436	436.jpg	2023-06-05 23:07:58.734694	2023-06-05 23:07:58.734694	\N	f
437	437.jpg	2023-06-05 23:07:58.736198	2023-06-05 23:07:58.736198	\N	f
438	438.jpg	2023-06-05 23:07:58.739562	2023-06-05 23:07:58.739562	\N	f
440	440.jpg	2023-06-05 23:07:58.748683	2023-06-05 23:07:58.748683	\N	f
441	441.jpg	2023-06-05 23:07:58.755159	2023-06-05 23:07:58.755159	\N	f
439	439.jpg	2023-06-05 23:07:58.743999	2023-06-05 23:07:58.743	\N	f
444	444.jpg	2023-06-05 14:25:30.687819	2023-06-05 14:25:30.687819	\N	f
446	446.jpg	2023-06-05 14:39:09.03847	2023-06-05 14:39:09.03847	\N	f
447	447.jpg	2023-06-05 14:42:59.324718	2023-06-05 14:42:59.324718	\N	f
448	448.jpg	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
450	450.jpg	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
451	451.jpg	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
395	395.webp	2023-06-05 23:07:58.554968	2023-06-05 23:07:58.554968	\N	f
460	460.jpg	2023-06-05 15:42:37.077092	2023-06-05 15:42:37.077092	\N	f
462	462.png	2023-06-05 15:42:37.077092	2023-06-05 15:42:37.077092	\N	f
463	463.jpg	2023-06-05 15:42:37.077092	2023-06-05 15:42:37.077092	\N	f
464	464.jpg	2023-06-05 15:42:37.077092	2023-06-05 15:42:37.077092	\N	f
467	467.jpg	2023-06-05 16:15:01.874459	2023-06-05 16:15:01.874459	\N	f
469	469.jpg	2023-06-05 16:15:33.250971	2023-06-05 16:15:33.250971	\N	f
470	470.jpg	2023-06-05 16:35:49.491125	2023-06-05 16:35:49.491125	\N	f
443	443.png	2023-06-05 23:21:08	2023-06-05 23:21:10	\N	f
449	449.webp	2023-06-05 14:48:32.828037	2023-06-05 14:48:32.828037	\N	f
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.ingredient (ingredient_id, ingredient_name, ingredient_description) FROM stdin;
1	Light rum	\N
2	Applejack	\N
3	Gin	\N
4	Dark rum	\N
5	Sweet Vermouth	\N
6	Strawberry schnapps	\N
7	Scotch	\N
8	Apricot brandy	\N
9	Triple sec	\N
10	Southern Comfort	\N
11	Orange bitters	\N
12	Brandy	\N
13	Lemon vodka	\N
14	Blended whiskey	\N
15	Dry Vermouth	\N
16	Amaretto	\N
17	Tea	\N
18	Champagne	\N
19	Coffee liqueur	\N
20	Bourbon	\N
21	Tequila	\N
22	Vodka	\N
23	Añejo rum	\N
24	Bitters	\N
25	Sugar	\N
26	Kahlua	\N
27	demerara Sugar	\N
28	Dubonnet Rouge	\N
29	Watermelon	\N
31	Irish whiskey	\N
32	Apple brandy	\N
33	Carbonated water	\N
34	Cherry brandy	\N
35	Creme de Cacao	\N
36	Grenadine	\N
37	Port	\N
38	Coffee brandy	\N
39	Red wine	\N
40	Rum	\N
41	Grapefruit juice	\N
42	Ricard	\N
43	Sherry	\N
44	Cognac	\N
45	Sloe gin	\N
46	Apple juice	\N
47	Pineapple juice	\N
49	Sugar syrup	\N
50	Milk	\N
51	Strawberries	\N
52	Chocolate syrup	\N
53	Yoghurt	\N
54	Mango	\N
55	Ginger	\N
56	Lime	\N
57	Cantaloupe	\N
58	Berries	\N
59	Grapes	\N
60	Kiwi	\N
61	Tomato juice	\N
62	Cocoa powder	\N
63	Chocolate	\N
64	Heavy cream	\N
65	Galliano	\N
66	Peach Vodka	\N
67	Ouzo	\N
68	Coffee	\N
69	Spiced rum	\N
70	Water	\N
71	Espresso	\N
72	Angelica root	\N
73	Orange	\N
74	Cranberries	\N
75	Johnnie Walker	\N
76	Apple cider	\N
77	Everclear	\N
79	Egg yolk	\N
80	Egg	\N
81	Grape juice	\N
82	Peach nectar	\N
83	Lemon	\N
84	Firewater	\N
85	Lemonade	\N
86	Lager	\N
87	Whiskey	\N
88	Absolut Citron	\N
89	Pisco	\N
90	Irish cream	\N
91	Ale	\N
92	Chocolate liqueur	\N
93	Midori melon liqueur	\N
94	Sambuca	\N
95	Cider	\N
96	Sprite	\N
97	7-Up	\N
98	Blackberry brandy	\N
99	Peppermint schnapps	\N
100	Creme de Cassis	\N
101	Grand Marnier	\N
103	Baileys irish cream	\N
104	Egg White	\N
105	151 proof rum	\N
106	Wild Turkey	\N
107	Absolut Vodka	\N
110	Maraschino cherry	\N
111	Egg white	\N
112	Vermouth	\N
113	Mint	\N
114	lemon juice	\N
116	Creme de Banane	\N
117	Jack Daniels	\N
118	Sour mix	\N
119	Frangelico	\N
120	Light cream	\N
121	Lemon peel	\N
122	Campari	\N
123	Orange peel	\N
124	Orange Bitters	\N
125	Green Chartreuse	\N
126	Goldschlager	\N
127	Peach schnapps	\N
128	Creme de Mure	\N
129	Blue Curacao	\N
130	Rye Whiskey	\N
132	Angostura Bitters	\N
134	Passion fruit juice	\N
136	Pineapple Juice	\N
138	Prosecco	\N
139	Hot Chocolate	\N
140	Cherry Heering	\N
141	Wormwood	\N
142	Ice	\N
143	Corona	\N
144	Bacardi Limon	\N
145	Jägermeister	\N
146	Banana liqueur	\N
147	Vanilla ice-cream	\N
148	Powdered sugar	\N
149	Cherry	\N
150	Dark Rum	\N
153	Cachaca	\N
154	Coca-Cola	\N
155	Falernum	\N
156	blackstrap rum	\N
157	Cointreau	\N
158	Triple Sec	\N
159	Lillet Blanc	\N
160	Absinthe	\N
161	Wine	\N
162	Vanilla extract	\N
163	Almond flavoring	\N
164	Ginger ale	\N
165	gin	\N
166	Peach Bitters	\N
167	Blackcurrant cordial	\N
168	Fruit punch	\N
169	Olive	\N
170	Ginger Beer	\N
171	Hot Damn	\N
172	Soda water	\N
173	Vanilla syrup	\N
108	Tonic Water	\N
30	Lime Juice	\N
48	Lemon Juice	\N
78	Cranberry Juice	\N
115	Maraschino Liqueur	\N
109	Orange Juice	\N
174	Condensed milk	\N
175	Nutmeg	\N
176	Elderflower cordial	\N
177	Benedictine	\N
178	Banana	\N
179	Fruit	\N
180	Apricot Nectar	\N
181	Pomegranate juice	\N
182	lemon	\N
183	Soda Water	\N
184	Raspberry Liqueur	\N
185	pineapple juice	\N
186	Lillet	\N
188	Absolut Peppar	\N
189	Tabasco sauce	\N
190	Fruit juice	\N
191	Dr. Pepper	\N
192	Beer	\N
193	Pineapple	\N
194	Sugar Syrup	\N
195	Sirup of roses	\N
198	Grapefruit Juice	\N
199	Malibu rum	\N
201	Club soda	\N
202	Green Creme de Menthe	\N
203	Whisky	\N
204	White Rum	\N
205	Honey	\N
206	Butter	\N
207	Half-and-half	\N
208	Marshmallows	\N
209	Iced tea	\N
210	Coconut syrup	\N
211	Whipped cream	\N
212	Peach brandy	\N
213	Guinness stout	\N
214	Aperol	\N
215	Chambord raspberry liqueur	\N
216	Anis	\N
217	Jello	\N
218	Yellow Chartreuse	\N
219	Grain alcohol	\N
220	Kiwi liqueur	\N
221	Bitter lemon	\N
222	Absolut Kurant	\N
223	Cranberry vodka	\N
224	Apfelkorn	\N
225	Schweppes Russchian	\N
226	Kool-Aid	\N
227	Papaya	\N
228	Angostura bitters	\N
229	Salt	\N
230	Asafoetida	\N
231	Drambuie	\N
232	Tia maria	\N
233	Coconut Liqueur	\N
234	Fresh Lemon Juice	\N
235	Orgeat syrup	\N
236	Tomato Juice	\N
237	Hot Sauce	\N
238	Worcestershire Sauce	\N
239	Soy Sauce	\N
240	Pepsi Cola	\N
241	Pina colada mix	\N
242	Daiquiri mix	\N
243	Cloves	\N
244	Cinnamon	\N
245	Cucumber	\N
246	White Creme de Menthe	\N
247	Cream	\N
248	Lemon-lime soda	\N
249	Rye whiskey	\N
250	Rosemary Syrup	\N
251	Rosemary	\N
252	Grape Soda	\N
253	Apricot Brandy	\N
254	Orange Curacao	\N
255	Blackberries	\N
256	Blended Scotch	\N
257	Honey syrup	\N
258	Ginger Syrup	\N
259	Islay single malt Scotch	\N
260	Egg Yolk	\N
261	Coconut milk	\N
262	Passoa	\N
263	Passion fruit syrup	\N
264	Cherry liqueur	\N
265	Fresh Lime Juice	\N
266	Pepper	\N
267	Pink lemonade	\N
268	Lime vodka	\N
269	Black Sambuca	\N
270	Crown Royal	\N
271	Raspberry syrup	\N
272	Raspberry vodka	\N
273	Lime peel	\N
274	Amaro Montenegro	\N
275	Ruby Port	\N
276	Blood Orange	\N
277	Advocaat	\N
278	Jim Beam	\N
279	Godiva liqueur	\N
280	Apple	\N
281	Creme De Banane	\N
282	Brown sugar	\N
283	Irish Whiskey	\N
284	Celery salt	\N
285	7-up	\N
286	Melon Liqueur	\N
288	Yukon Jack	\N
289	Maple syrup	\N
290	Limeade	\N
291	White Wine	\N
292	Apple Brandy	\N
293	Cream of coconut	\N
294	Peachtree schnapps	\N
295	Surge	\N
296	Root beer	\N
297	Zima	\N
298	Dark Creme de Cacao	\N
299	Coconut liqueur	\N
300	Rumple Minze	\N
301	Vanilla vodka	\N
302	Roses sweetened lime juice	\N
303	Strawberry liqueur	\N
304	Strawberry	\N
305	Bacardi 151	\N
306	Bacardi Rum	\N
307	Finlandia Vodka	\N
308	Bombay Sapphire 	\N
309	Jack Daniels Tennessee Honey	\N
152	Sweet and sour	\N
310	Red Bull	\N
311	X-Rated Fusion Liquer	\N
312	Green Apple Schnapps	\N
313	Hendrick's Gin	\N
314	Sage	\N
315	Pastis	\N
316	Italicus liqueur	\N
317	Brewed Jasmine Coconut Tea	\N
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.message (message_id, message_content, message_receiver_id, message_sender_id, message_created_at, message_updated_at, message_deleted_at, message_deleted) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: moonshine; Owner: moonshine
--

COPY moonshine.users (user_id, user_name, user_email, user_password, user_profile_picture, user_created_at, user_updated_at, user_deleted_at, user_deleted) FROM stdin;
\.


--
-- Name: bar_reviews_bar_review_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.bar_reviews_bar_review_id_seq', 1, false);


--
-- Name: bars_bar_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.bars_bar_id_seq', 1, true);


--
-- Name: blog_post_comment_replies_blog_post_comment_reply_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_post_comment_replies_blog_post_comment_reply_id_seq', 1, false);


--
-- Name: blog_post_comments_blog_post_comment_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_post_comments_blog_post_comment_id_seq', 1, false);


--
-- Name: blog_posts_blog_post_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_posts_blog_post_id_seq', 1, false);


--
-- Name: blog_small_post_blog_small_post_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_small_post_blog_small_post_id_seq', 1, false);


--
-- Name: blog_small_post_comment_blog_small_post_comment_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_small_post_comment_blog_small_post_comment_id_seq', 1, false);


--
-- Name: blog_small_post_comment_reply_blog_small_post_comment_reply_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.blog_small_post_comment_reply_blog_small_post_comment_reply_seq', 1, false);


--
-- Name: cocktail_composition_composition_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.cocktail_composition_composition_id_seq', 1517, true);


--
-- Name: cocktail_reviews_cocktail_review_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.cocktail_reviews_cocktail_review_id_seq', 1, false);


--
-- Name: cocktails_cocktail_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.cocktails_cocktail_id_seq', 445, true);


--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.image_image_id_seq', 504, true);


--
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.ingredient_ingredient_id_seq', 317, true);


--
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.message_message_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: moonshine; Owner: moonshine
--

SELECT pg_catalog.setval('moonshine.users_user_id_seq', 1, false);


--
-- Name: bar_favorites bar_favorite_id; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_favorites
    ADD CONSTRAINT bar_favorite_id PRIMARY KEY (user_id, bar_id);


--
-- Name: bar_image_composition bar_image_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_image_composition
    ADD CONSTRAINT bar_image_composition_pkey PRIMARY KEY (bar_id, image_id);


--
-- Name: bar_menu_composition bar_menu_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_menu_composition
    ADD CONSTRAINT bar_menu_composition_pkey PRIMARY KEY (bar_id, cocktail_id);


--
-- Name: bar_review_menu_review bar_review_menu_review_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_review_menu_review
    ADD CONSTRAINT bar_review_menu_review_pkey PRIMARY KEY (bar_review_id, bar_id, cocktail_id);


--
-- Name: bar_reviews bar_reviews_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_reviews
    ADD CONSTRAINT bar_reviews_pkey PRIMARY KEY (bar_review_id);


--
-- Name: bars bars_bar_name_key; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bars
    ADD CONSTRAINT bars_bar_name_key UNIQUE (bar_name);


--
-- Name: bars bars_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bars
    ADD CONSTRAINT bars_pkey PRIMARY KEY (bar_id);


--
-- Name: blog_post_bar_composition blog_post_bar_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_bar_composition
    ADD CONSTRAINT blog_post_bar_composition_pkey PRIMARY KEY (blog_post_id, bar_id);


--
-- Name: blog_post_cocktail_composition blog_post_cocktail_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_cocktail_composition
    ADD CONSTRAINT blog_post_cocktail_composition_pkey PRIMARY KEY (blog_post_id, cocktail_id);


--
-- Name: blog_post_comment_replies blog_post_comment_replies_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comment_replies
    ADD CONSTRAINT blog_post_comment_replies_pkey PRIMARY KEY (blog_post_comment_reply_id);


--
-- Name: blog_post_comments blog_post_comments_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comments
    ADD CONSTRAINT blog_post_comments_pkey PRIMARY KEY (blog_post_comment_id);


--
-- Name: blog_post_image_composition blog_post_image_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_image_composition
    ADD CONSTRAINT blog_post_image_composition_pkey PRIMARY KEY (blog_post_id, image_id);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (blog_post_id);


--
-- Name: blog_small_post_comment blog_small_post_comment_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment
    ADD CONSTRAINT blog_small_post_comment_pkey PRIMARY KEY (blog_small_post_comment_id);


--
-- Name: blog_small_post_comment_reply blog_small_post_comment_reply_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment_reply
    ADD CONSTRAINT blog_small_post_comment_reply_pkey PRIMARY KEY (blog_small_post_comment_reply_id);


--
-- Name: blog_small_post_image_compostision blog_small_post_image_compostision_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_image_compostision
    ADD CONSTRAINT blog_small_post_image_compostision_pkey PRIMARY KEY (blog_small_post_id, image_id);


--
-- Name: blog_small_post blog_small_post_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post
    ADD CONSTRAINT blog_small_post_pkey PRIMARY KEY (blog_small_post_id);


--
-- Name: cocktail_composition cocktail_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_composition
    ADD CONSTRAINT cocktail_composition_pkey PRIMARY KEY (composition_id);


--
-- Name: cocktail_image_composition cocktail_image_composition_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_image_composition
    ADD CONSTRAINT cocktail_image_composition_pkey PRIMARY KEY (cocktail_id, image_id);


--
-- Name: cocktail_reviews cocktail_reviews_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_reviews
    ADD CONSTRAINT cocktail_reviews_pkey PRIMARY KEY (cocktail_review_id);


--
-- Name: cocktails cocktails_cocktail_name_key; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktails
    ADD CONSTRAINT cocktails_cocktail_name_key UNIQUE (cocktail_name);


--
-- Name: cocktails cocktails_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktails
    ADD CONSTRAINT cocktails_pkey PRIMARY KEY (cocktail_id);


--
-- Name: cocktail_favorites favorite_id; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_favorites
    ADD CONSTRAINT favorite_id PRIMARY KEY (user_id, cocktail_id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (image_id);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (ingredient_id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (message_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: bar_favorites bar_favorite_bar_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_favorites
    ADD CONSTRAINT bar_favorite_bar_id FOREIGN KEY (bar_id) REFERENCES moonshine.bars(bar_id);


--
-- Name: bar_favorites bar_favorite_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_favorites
    ADD CONSTRAINT bar_favorite_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: bar_image_composition bar_image_composition_bar_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_image_composition
    ADD CONSTRAINT bar_image_composition_bar_id_fkey FOREIGN KEY (bar_id) REFERENCES moonshine.bars(bar_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: bar_image_composition bar_image_composition_image_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_image_composition
    ADD CONSTRAINT bar_image_composition_image_id_fkey FOREIGN KEY (image_id) REFERENCES moonshine.image(image_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: bar_menu_composition bar_menu_composition_bar_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_menu_composition
    ADD CONSTRAINT bar_menu_composition_bar_id_fkey FOREIGN KEY (bar_id) REFERENCES moonshine.bars(bar_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: bar_menu_composition bar_menu_composition_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_menu_composition
    ADD CONSTRAINT bar_menu_composition_cocktail_id_fkey FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: bar_reviews bar_review_created_by; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_reviews
    ADD CONSTRAINT bar_review_created_by FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: bar_review_menu_review bar_review_menu_review_bar_id_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_review_menu_review
    ADD CONSTRAINT bar_review_menu_review_bar_id_cocktail_id_fkey FOREIGN KEY (bar_id, cocktail_id) REFERENCES moonshine.bar_menu_composition(bar_id, cocktail_id) ON UPDATE CASCADE;


--
-- Name: bar_review_menu_review bar_review_menu_review_bar_review_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_review_menu_review
    ADD CONSTRAINT bar_review_menu_review_bar_review_id_fkey FOREIGN KEY (bar_review_id) REFERENCES moonshine.bar_reviews(bar_review_id) ON UPDATE CASCADE;


--
-- Name: bar_reviews bar_reviews_bar_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bar_reviews
    ADD CONSTRAINT bar_reviews_bar_id_fkey FOREIGN KEY (bar_id) REFERENCES moonshine.bars(bar_id);


--
-- Name: bars bars_bar_image_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.bars
    ADD CONSTRAINT bars_bar_image_fkey FOREIGN KEY (bar_image) REFERENCES moonshine.image(image_id);


--
-- Name: blog_post_bar_composition blog_post_bar_composition_bar_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_bar_composition
    ADD CONSTRAINT blog_post_bar_composition_bar_id_fkey FOREIGN KEY (bar_id) REFERENCES moonshine.bars(bar_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_bar_composition blog_post_bar_composition_blog_post_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_bar_composition
    ADD CONSTRAINT blog_post_bar_composition_blog_post_id_fkey FOREIGN KEY (blog_post_id) REFERENCES moonshine.blog_posts(blog_post_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_cocktail_composition blog_post_cocktail_composition_blog_post_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_cocktail_composition
    ADD CONSTRAINT blog_post_cocktail_composition_blog_post_id_fkey FOREIGN KEY (blog_post_id) REFERENCES moonshine.blog_posts(blog_post_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_cocktail_composition blog_post_cocktail_composition_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_cocktail_composition
    ADD CONSTRAINT blog_post_cocktail_composition_cocktail_id_fkey FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_comments blog_post_comment_blog_post_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comments
    ADD CONSTRAINT blog_post_comment_blog_post_id FOREIGN KEY (blog_post_id) REFERENCES moonshine.blog_posts(blog_post_id) ON DELETE CASCADE;


--
-- Name: blog_post_comment_replies blog_post_comment_reply_blog_post_comment_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comment_replies
    ADD CONSTRAINT blog_post_comment_reply_blog_post_comment_id FOREIGN KEY (blog_post_comment_id) REFERENCES moonshine.blog_post_comments(blog_post_comment_id) ON DELETE CASCADE;


--
-- Name: blog_post_comment_replies blog_post_comment_reply_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comment_replies
    ADD CONSTRAINT blog_post_comment_reply_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_post_comments blog_post_comment_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_comments
    ADD CONSTRAINT blog_post_comment_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_post_image_composition blog_post_image_composition_blog_post_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_image_composition
    ADD CONSTRAINT blog_post_image_composition_blog_post_id_fkey FOREIGN KEY (blog_post_id) REFERENCES moonshine.blog_posts(blog_post_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_image_composition blog_post_image_composition_image_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_post_image_composition
    ADD CONSTRAINT blog_post_image_composition_image_id_fkey FOREIGN KEY (image_id) REFERENCES moonshine.image(image_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_posts blog_posts_blog_post_image_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_posts
    ADD CONSTRAINT blog_posts_blog_post_image_fkey FOREIGN KEY (blog_post_image) REFERENCES moonshine.image(image_id);


--
-- Name: blog_posts blog_posts_blog_post_user_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_posts
    ADD CONSTRAINT blog_posts_blog_post_user_id_fkey FOREIGN KEY (blog_post_user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_small_post blog_small_post_blog_small_post_user_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post
    ADD CONSTRAINT blog_small_post_blog_small_post_user_id_fkey FOREIGN KEY (blog_small_post_user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_small_post_comment blog_small_post_comment_blog_small_post_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment
    ADD CONSTRAINT blog_small_post_comment_blog_small_post_id FOREIGN KEY (blog_small_post_id) REFERENCES moonshine.blog_small_post(blog_small_post_id) ON DELETE CASCADE;


--
-- Name: blog_small_post_comment_reply blog_small_post_comment_reply_blog_small_post_comment_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment_reply
    ADD CONSTRAINT blog_small_post_comment_reply_blog_small_post_comment_id FOREIGN KEY (blog_small_post_comment_id) REFERENCES moonshine.blog_small_post_comment(blog_small_post_comment_id) ON DELETE CASCADE;


--
-- Name: blog_small_post_comment_reply blog_small_post_comment_reply_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment_reply
    ADD CONSTRAINT blog_small_post_comment_reply_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_small_post_comment blog_small_post_comment_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_comment
    ADD CONSTRAINT blog_small_post_comment_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: blog_small_post_image_compostision blog_small_post_image_compostision_blog_small_post_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_image_compostision
    ADD CONSTRAINT blog_small_post_image_compostision_blog_small_post_id_fkey FOREIGN KEY (blog_small_post_id) REFERENCES moonshine.blog_small_post(blog_small_post_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_small_post_image_compostision blog_small_post_image_compostision_image_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.blog_small_post_image_compostision
    ADD CONSTRAINT blog_small_post_image_compostision_image_id_fkey FOREIGN KEY (image_id) REFERENCES moonshine.image(image_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cocktail_composition cocktail_composition_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_composition
    ADD CONSTRAINT cocktail_composition_cocktail_id_fkey FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cocktail_composition cocktail_composition_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_composition
    ADD CONSTRAINT cocktail_composition_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES moonshine.ingredient(ingredient_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cocktail_image_composition cocktail_image_composition_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_image_composition
    ADD CONSTRAINT cocktail_image_composition_cocktail_id_fkey FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cocktail_image_composition cocktail_image_composition_image_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_image_composition
    ADD CONSTRAINT cocktail_image_composition_image_id_fkey FOREIGN KEY (image_id) REFERENCES moonshine.image(image_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cocktail_reviews cocktail_review_created_by; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_reviews
    ADD CONSTRAINT cocktail_review_created_by FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: cocktail_reviews cocktail_reviews_cocktail_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_reviews
    ADD CONSTRAINT cocktail_reviews_cocktail_id_fkey FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id);


--
-- Name: cocktails cocktails_cocktail_image_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktails
    ADD CONSTRAINT cocktails_cocktail_image_fkey FOREIGN KEY (cocktail_image) REFERENCES moonshine.image(image_id);


--
-- Name: cocktail_favorites favorite_cocktail_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_favorites
    ADD CONSTRAINT favorite_cocktail_id FOREIGN KEY (cocktail_id) REFERENCES moonshine.cocktails(cocktail_id);


--
-- Name: cocktail_favorites favorite_user_id; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.cocktail_favorites
    ADD CONSTRAINT favorite_user_id FOREIGN KEY (user_id) REFERENCES moonshine.users(user_id);


--
-- Name: message message_receiver_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.message
    ADD CONSTRAINT message_receiver_id_fkey FOREIGN KEY (message_receiver_id) REFERENCES moonshine.users(user_id);


--
-- Name: message message_sender_id_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.message
    ADD CONSTRAINT message_sender_id_fkey FOREIGN KEY (message_sender_id) REFERENCES moonshine.users(user_id);


--
-- Name: users users_user_profile_picture_fkey; Type: FK CONSTRAINT; Schema: moonshine; Owner: moonshine
--

ALTER TABLE ONLY moonshine.users
    ADD CONSTRAINT users_user_profile_picture_fkey FOREIGN KEY (user_profile_picture) REFERENCES moonshine.image(image_id);


--
-- Name: DATABASE moonshine; Type: ACL; Schema: -; Owner: moonshine
--

GRANT ALL ON DATABASE moonshine TO moonshine;


--
-- PostgreSQL database dump complete
--


PGDMP     '    *            	    s           jamsesh    9.4.4    9.4.4      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16393    jamsesh    DATABASE     �   CREATE DATABASE jamsesh WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE jamsesh;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            �            3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    180            �            1259    16474    comments    TABLE       CREATE TABLE comments (
    id integer NOT NULL,
    commentor_id integer,
    comment_text text,
    comment_timestamp timestamp without time zone,
    user_id integer,
    group_id integer,
    session_id integer,
    recording_id integer,
    duration interval
);
    DROP TABLE public.comments;
       public         postgres    false    5            �            1259    16472    comments_id_seq    SEQUENCE     q   CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       postgres    false    179    5            �           0    0    comments_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE comments_id_seq OWNED BY comments.id;
            public       postgres    false    178            �            1259    16446 	   recording    TABLE     �   CREATE TABLE recording (
    id integer NOT NULL,
    s3_location text,
    filename text,
    user_id integer[],
    session_id integer,
    group_id integer,
    comments_id integer[]
);
    DROP TABLE public.recording;
       public         postgres    false    5            �            1259    16444    recording_id_seq    SEQUENCE     r   CREATE SEQUENCE recording_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.recording_id_seq;
       public       postgres    false    5    177            �           0    0    recording_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE recording_id_seq OWNED BY recording.id;
            public       postgres    false    176            �            1259    16426    sessions    TABLE       CREATE TABLE sessions (
    id integer NOT NULL,
    name text,
    schedule timestamp without time zone,
    members integer[],
    instructor integer,
    description text,
    location text,
    duration interval,
    recording integer[],
    comments integer[]
);
    DROP TABLE public.sessions;
       public         postgres    false    5            �            1259    16424    sessions_id_seq    SEQUENCE     q   CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public       postgres    false    175    5            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;
            public       postgres    false    174            �            1259    16417    users    TABLE     �   CREATE TABLE users (
    id integer NOT NULL,
    username text,
    password text,
    first_name text,
    last_name text,
    email text,
    phone_number text,
    friends integer[],
    city text,
    state text
);
    DROP TABLE public.users;
       public         postgres    false    5            �            1259    16415    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    173    5            �           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       postgres    false    172            r           2604    16477    id    DEFAULT     \   ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    178    179    179            q           2604    16449    id    DEFAULT     ^   ALTER TABLE ONLY recording ALTER COLUMN id SET DEFAULT nextval('recording_id_seq'::regclass);
 ;   ALTER TABLE public.recording ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    177    177            p           2604    16429    id    DEFAULT     \   ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    174    175            o           2604    16420    id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172    173            �          0    16474    comments 
   TABLE DATA               �   COPY comments (id, commentor_id, comment_text, comment_timestamp, user_id, group_id, session_id, recording_id, duration) FROM stdin;
    public       postgres    false    179   �       �           0    0    comments_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('comments_id_seq', 1, false);
            public       postgres    false    178            �          0    16446 	   recording 
   TABLE DATA               c   COPY recording (id, s3_location, filename, user_id, session_id, group_id, comments_id) FROM stdin;
    public       postgres    false    177           �           0    0    recording_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('recording_id_seq', 1, false);
            public       postgres    false    176            �          0    16426    sessions 
   TABLE DATA               z   COPY sessions (id, name, schedule, members, instructor, description, location, duration, recording, comments) FROM stdin;
    public       postgres    false    175   3        �           0    0    sessions_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('sessions_id_seq', 1, false);
            public       postgres    false    174            �          0    16417    users 
   TABLE DATA               r   COPY users (id, username, password, first_name, last_name, email, phone_number, friends, city, state) FROM stdin;
    public       postgres    false    173   P        �           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 1, false);
            public       postgres    false    172            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     
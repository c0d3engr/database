PGDMP                      }            artdb    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16386    artdb    DATABASE     k   CREATE DATABASE artdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE artdb;
                     postgres    false            �            1259    16402    accounts    TABLE     @  CREATE TABLE public.accounts (
    account_id integer NOT NULL,
    user_id integer NOT NULL,
    account_name character varying(255) NOT NULL,
    total_zeny integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.accounts;
       public         heap r       postgres    false            �            1259    16401    accounts_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_account_id_seq;
       public               postgres    false    220            �           0    0    accounts_account_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;
          public               postgres    false    219            �            1259    16417 
   characters    TABLE       CREATE TABLE public.characters (
    character_id integer NOT NULL,
    account_id integer NOT NULL,
    character_name character varying(255) NOT NULL,
    character_class character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.characters;
       public         heap r       postgres    false            �            1259    16416    characters_character_id_seq    SEQUENCE     �   CREATE SEQUENCE public.characters_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.characters_character_id_seq;
       public               postgres    false    222            �           0    0    characters_character_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.characters_character_id_seq OWNED BY public.characters.character_id;
          public               postgres    false    221            �            1259    16388    users    TABLE       CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16387    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public               postgres    false    218            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public               postgres    false    217            -           2604    16405    accounts account_id    DEFAULT     z   ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);
 B   ALTER TABLE public.accounts ALTER COLUMN account_id DROP DEFAULT;
       public               postgres    false    219    220    220            1           2604    16420    characters character_id    DEFAULT     �   ALTER TABLE ONLY public.characters ALTER COLUMN character_id SET DEFAULT nextval('public.characters_character_id_seq'::regclass);
 F   ALTER TABLE public.characters ALTER COLUMN character_id DROP DEFAULT;
       public               postgres    false    222    221    222            +           2604    16391    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16402    accounts 
   TABLE DATA           i   COPY public.accounts (account_id, user_id, account_name, total_zeny, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �"       �          0    16417 
   characters 
   TABLE DATA           k   COPY public.characters (character_id, account_id, character_name, character_class, created_at) FROM stdin;
    public               postgres    false    222   �"       �          0    16388    users 
   TABLE DATA           T   COPY public.users (user_id, username, email, password_hash, created_at) FROM stdin;
    public               postgres    false    218   �"       �           0    0    accounts_account_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_account_id_seq', 1, false);
          public               postgres    false    219            �           0    0    characters_character_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.characters_character_id_seq', 1, false);
          public               postgres    false    221            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public               postgres    false    217            :           2606    16410    accounts accounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public                 postgres    false    220            <           2606    16423    characters characters_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (character_id);
 D   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_pkey;
       public                 postgres    false    222            4           2606    16400    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            6           2606    16396    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            8           2606    16398    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    218            =           2606    16411    accounts accounts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_user_id_fkey;
       public               postgres    false    4662    220    218            >           2606    16424 %   characters characters_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(account_id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_account_id_fkey;
       public               postgres    false    222    220    4666            �      x������ � �      �      x������ � �      �      x������ � �     
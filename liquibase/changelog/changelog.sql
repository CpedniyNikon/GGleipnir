--liquibase formatted sql

--changeset elyutinmaks:1 labels:label context:context
--comment: create table user_info
create table user_info (
    id varchar not null unique,
    login varchar(30) not null unique,
    password varchar(50) not null,
    name varchar(30) not null,
    meta varchar(255) not null
);

--changeset elyutinmaks:2 labels:label context:context
--comment: create table game_cart

create table game_cart (
    id varchar not null unique,
    name varchar(30) not null unique,
    image_url varchar not null,
    category int not null
);


--changeset elyutinmaks:3
create table lobby (
    id varchar not null unique,
    name varchar(30) not null unique,
    closed boolean not null,
    game_cart_id varchar not null
);

create table lobby_user_match (
    id varchar not null unique,
    lobby_id varchar not null unique,
    user_id varchar not null unique
);

--changeset elyutinmaks:4
--validCheckSum 8:2d0ce4723c5a5329ebe2a1bfea1be763
create table lobby_message (
    id varchar not null unique,
    lobby_id varchar not null unique,
    user_id varchar not null unique,
    message varchar
);

--changeset elyutinmaks:5
alter table lobby_user_match drop constraint lobby_user_match_lobby_id_key;

--changeset elyutinmaks:6
alter table lobby_message add column created_at bigint not null;

--changeset elyutinmaks:7
alter table lobby_message drop constraint lobby_message_lobby_id_key;
alter table lobby_message drop constraint lobby_message_user_id_key;

--changeset elyutinmaks:8
alter table lobby_message add column user_login varchar not null default 'empty';

--changeset elyutinmaks:9
delete from lobby_message where user_login = 'empty';

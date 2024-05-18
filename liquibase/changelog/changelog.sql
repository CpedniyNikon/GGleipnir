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

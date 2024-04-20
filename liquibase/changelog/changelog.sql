--liquibase formatted sql

--changeset elyutinmaks:1 labels:label context:context
--comment: create table user_info
create table user_info (
    id varchar not null unique,
    login varchar(30) not null unique,
    password varchar(50) not null,
    name varchar(30) not null,
    meta varchar(255) not null
)
--rollback DROP TABLE person;


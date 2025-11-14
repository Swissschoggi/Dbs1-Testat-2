---------------------------------
-- Fynn Gächter, Andretta Filippo
---------------------------------
SET client_min_messages = ERROR;
\set user autouser
\set password '\'autopassword\''
\set database autoverleih
\set promptvariable ''

\prompt 'DROP ROLE [':user'] and DROP DATABASE [':database'] if existing (\\q or Ctrl-C to abort)?' promptvariable
:promptvariable

DROP DATABASE if exists :database (FORCE);
DROP ROLE if exists :user;

\echo password for user :user = :password

\prompt 'CREATE ROLE [':user'] and DATABASE [':database'] (\\q or Ctrl-C to abort)?' promptvariable
:promptvariable

CREATE ROLE :user WITH LOGIN PASSWORD :password;
CREATE DATABASE :database WITH OWNER=:user ENCODING='UTF8';

\encoding 'UTF8'

\c -reuse-previous=on :database postgres
\c -reuse-previous=on :database :user

\ir 2_schemas.sql
\ir 3_inserts.sql
\ir 4_constraints.sql

\encoding 'auto'
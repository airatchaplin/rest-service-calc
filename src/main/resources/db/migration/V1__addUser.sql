create table expression (id int8 generated by default as identity, date date, expression varchar(255), precision varchar(255), time time, user_id int8, primary key (id));
create table roles (id int8 not null, name varchar(255), primary key (id));
create table users (id int8 generated by default as identity, password varchar(255), username varchar(255), primary key (id));
create table users_expressions (user_id int8 not null, expressions_id int8 not null, primary key (user_id, expressions_id));
create table users_roles (user_id int8 not null, roles_id int8 not null, primary key (user_id, roles_id));
alter table if exists users_expressions add constraint UK_4qvr7y9mmqf34s0g8nsq93ilv unique (expressions_id);
alter table if exists expression add constraint FK6502thn3idsaaaj4wyf0nqc8c foreign key (user_id) references users;
alter table if exists users_expressions add constraint FK7ner2hk2r6b1os25two7gh39l foreign key (expressions_id) references expression;
alter table if exists users_expressions add constraint FKq6q82g84knft2b6r2pscixusv foreign key (user_id) references users;
alter table if exists users_roles add constraint FKa62j07k5mhgifpp955h37ponj foreign key (roles_id) references roles;
alter table if exists users_roles add constraint FK2o0jvgh89lemvvo17cbqvdxaa foreign key (user_id) references users;
INSERT INTO users (username, password) VALUES ( 'admin','$2y$12$uSMwwzmriguqpgogwlmRCObreVtWTMOQV2/SpOYyvEnBOtXGSm1g2' );
INSERT INTO users (username, password) VALUES ( 'user','$2y$12$QLu7e322j7znPJTe18fwB.v5iTAZZcZg2AvAdhOIF/jk7WtNYW0n.' );
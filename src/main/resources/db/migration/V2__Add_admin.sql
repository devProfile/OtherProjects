-- user - admin,password - admin
insert into usr (id, username, password, active, email) values (1, 'admin', '$2a$08$dcr2wqUmUwdkAkYlrkI0KeveltwDL1biEOguZDdHM2nq7L/NuPB5W', true, 'jurakulek@gmail.com');
insert into user_role (user_id, roles) values (1, 'USER'), (1, 'ADMIN');

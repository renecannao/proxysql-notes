insert into mysql_users (username,password) values ('sbtest1','sbtest1');
insert into mysql_users (username,password) values ('sbtest2','sbtest2');
insert into mysql_users (username,password) values ('sbtest3','sbtest3');
insert into mysql_users (username,password) values ('sbtest4','sbtest4');
SAVE MYSQL USERS TO DISK;
LOAD MYSQL USERS TO RUNTIME;

DELETE FROM mysql_query_rules;
INSERT INTO mysql_query_rules (active,username,schemaname,match_digest,cache_ttl) VALUES (1,'sbtest1','sbtest1','^SELECT c FROM sbtest. WHERE id=\?$',1000);
INSERT INTO mysql_query_rules (active,username,schemaname,match_digest,cache_ttl) VALUES (1,'sbtest2','sbtest2','^SELECT c FROM sbtest. WHERE id=\?$',1000);
INSERT INTO mysql_query_rules (active,username,schemaname,match_digest,cache_ttl) VALUES (1,'sbtest3','sbtest3','^SELECT c FROM sbtest. WHERE id=\?$',1000);
INSERT INTO mysql_query_rules (active,username,schemaname,match_digest,cache_ttl) VALUES (1,'sbtest4','sbtest4','^SELECT c FROM sbtest. WHERE id=\?$',1000);
SAVE MYSQL QUERY RULES TO DISK;
LOAD MYSQL QUERY RULES TO RUNTIME;

SET mysql-session_idle_ms=200;
LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;

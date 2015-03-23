CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE "charters_charter" (
    "charter_id" varchar(20) NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "objective" varchar(100) NOT NULL,
    "min_time" integer NOT NULL,
    "max_time" integer NOT NULL,
    "requeriments" text,
    "setup" text,
    "notes" text,
    "key_areas" text,
    "issues" varchar(100),
    "important_notes" text,
    "created_at" datetime NOT NULL,
    "modified_at" datetime NOT NULL
);
CREATE TABLE "exploratory_comment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "description" text NOT NULL);
CREATE TABLE "exploratory_issue" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "code_jira" varchar(20) NOT NULL, "name" varchar(50) NOT NULL, "description" varchar(100) NOT NULL, "tipo" varchar(20) NOT NULL);
CREATE TABLE "exploratory_label" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "description" varchar(50) NOT NULL);
CREATE TABLE "exploratory_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "project" varchar(100) NOT NULL);
CREATE TABLE "exploratory_product_labels" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "product_id" integer NOT NULL REFERENCES "exploratory_product" ("id"), "label_id" integer NOT NULL REFERENCES "exploratory_label" ("id"), UNIQUE ("product_id", "label_id"));
CREATE TABLE "exploratory_sessao_comments" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sessao_id" integer NOT NULL REFERENCES "exploratory_sessao" ("id"), "comment_id" integer NOT NULL REFERENCES "exploratory_comment" ("id"), UNIQUE ("sessao_id", "comment_id"));
CREATE TABLE "exploratory_sessao_issues" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sessao_id" integer NOT NULL REFERENCES "exploratory_sessao" ("id"), "issue_id" integer NOT NULL REFERENCES "exploratory_issue" ("id"), UNIQUE ("sessao_id", "issue_id"));
CREATE INDEX "exploratory_product_labels_9bea82de" ON "exploratory_product_labels" ("product_id");
CREATE INDEX "exploratory_product_labels_abec2aca" ON "exploratory_product_labels" ("label_id");
CREATE INDEX "exploratory_sessao_comments_ad65f22e" ON "exploratory_sessao_comments" ("sessao_id");
CREATE INDEX "exploratory_sessao_comments_69b97d17" ON "exploratory_sessao_comments" ("comment_id");
CREATE INDEX "exploratory_sessao_issues_ad65f22e" ON "exploratory_sessao_issues" ("sessao_id");
CREATE INDEX "exploratory_sessao_issues_12f3e382" ON "exploratory_sessao_issues" ("issue_id");
CREATE TABLE "exploratory_sessao" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "comments" text NOT NULL, "duration" integer NOT NULL, "current_time" integer NOT NULL, "charter_id" varchar(20) NOT NULL REFERENCES "charters_charter" ("charter_id"), "product_id" integer NOT NULL REFERENCES "exploratory_product" ("id"), "tester_id" integer NOT NULL REFERENCES "auth_user" ("id"));
CREATE INDEX "exploratory_sessao_212116fa" ON "exploratory_sessao" ("charter_id");
CREATE INDEX "exploratory_sessao_9bea82de" ON "exploratory_sessao" ("product_id");
CREATE INDEX "exploratory_sessao_d7ccc8e6" ON "exploratory_sessao" ("tester_id");
/* No STAT tables available */
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2015-03-21 18:33:43.025000',1,7,'1','Explore the circle widget.',1,'');
INSERT INTO "django_admin_log" VALUES(2,'2015-03-21 19:27:29.153000',1,7,'ET:001','Explore the circle widget.	',1,'');
INSERT INTO "django_admin_log" VALUES(3,'2015-03-22 02:41:16.476000',1,7,'ET:002','Explore Gallery app',1,'');
INSERT INTO "django_admin_log" VALUES(4,'2015-03-22 03:10:46.495000',1,7,'ET:001','ET:001 - Explore the circle widget.	',2,'Changed notes.');
INSERT INTO "django_admin_log" VALUES(5,'2015-03-23 00:15:44.019000',1,4,'1','flavio',2,'Changed first_name and last_name.');
INSERT INTO "django_admin_log" VALUES(6,'2015-03-23 00:16:58.154000',1,4,'1','flavio',2,'Changed email.');
INSERT INTO "django_admin_log" VALUES(7,'2015-03-23 00:17:42.167000',1,4,'2','demo',2,'Changed username and first_name.');
INSERT INTO "django_admin_log" VALUES(8,'2015-03-23 00:18:16.142000',1,4,'1','fdsantos',2,'Changed username.');
INSERT INTO "django_admin_log" VALUES(9,'2015-03-23 00:19:08.671000',1,4,'2','demo',2,'Changed is_superuser.');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add charter',7,'add_charter');
INSERT INTO "auth_permission" VALUES(20,'Can change charter',7,'change_charter');
INSERT INTO "auth_permission" VALUES(21,'Can delete charter',7,'delete_charter');
INSERT INTO "auth_permission" VALUES(22,'Can add comment',8,'add_comment');
INSERT INTO "auth_permission" VALUES(23,'Can change comment',8,'change_comment');
INSERT INTO "auth_permission" VALUES(24,'Can delete comment',8,'delete_comment');
INSERT INTO "auth_permission" VALUES(25,'Can add issue',9,'add_issue');
INSERT INTO "auth_permission" VALUES(26,'Can change issue',9,'change_issue');
INSERT INTO "auth_permission" VALUES(27,'Can delete issue',9,'delete_issue');
INSERT INTO "auth_permission" VALUES(28,'Can add label',10,'add_label');
INSERT INTO "auth_permission" VALUES(29,'Can change label',10,'change_label');
INSERT INTO "auth_permission" VALUES(30,'Can delete label',10,'delete_label');
INSERT INTO "auth_permission" VALUES(31,'Can add product',11,'add_product');
INSERT INTO "auth_permission" VALUES(32,'Can change product',11,'change_product');
INSERT INTO "auth_permission" VALUES(33,'Can delete product',11,'delete_product');
INSERT INTO "auth_permission" VALUES(34,'Can add sessao',12,'add_sessao');
INSERT INTO "auth_permission" VALUES(35,'Can change sessao',12,'change_sessao');
INSERT INTO "auth_permission" VALUES(36,'Can delete sessao',12,'delete_sessao');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$15000$1bA07HkerQSM$yN8/X5jPu41Au2tODadiPRLPSGlEFuWdjRPc18LsIFA=','2015-03-23 01:14:55.014000',1,'fdsantos','Flavio','Santos','fhas@cin.ufpe.br',1,1,'2015-03-21 13:49:08');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$15000$wSpaRJSx2CXj$NpvXBL/gEwEWzQ7Xs9hPxQ+R+9z5GzqE8wNPZjE83mE=','2015-03-23 00:20:48.470000',0,'demo','Demo','','flaviohenriqu@gmail.com',1,1,'2015-03-21 14:11:08');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'charter','charters','charter');
INSERT INTO "django_content_type" VALUES(8,'comment','exploratory','comment');
INSERT INTO "django_content_type" VALUES(9,'issue','exploratory','issue');
INSERT INTO "django_content_type" VALUES(10,'label','exploratory','label');
INSERT INTO "django_content_type" VALUES(11,'product','exploratory','product');
INSERT INTO "django_content_type" VALUES(12,'sessao','exploratory','sessao');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('s5t2bx9e2wb8836smqrrd7ietpjeloik','YWRlZWE0MmVkZWI1ZDBkMTJkYzE2OTYzMGRiNTk5ZjQzZmY2ODAzYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxNmFkMjdkMWJhZTk1NWVlYzgyOGM3ODNmNWY4N2Y5ODQyOWMwOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-06 01:14:55.030000');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2015-03-21 17:51:07.348000');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2015-03-21 17:51:07.373000');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2015-03-21 17:51:07.410000');
INSERT INTO "django_migrations" VALUES(4,'sessions','0001_initial','2015-03-21 17:51:07.427000');
INSERT INTO "django_migrations" VALUES(5,'exploratory','0001_initial','2015-03-21 23:32:41.688000');
INSERT INTO "django_migrations" VALUES(6,'exploratory','0002_auto_20150321_2116','2015-03-22 00:21:49.832000');
INSERT INTO "django_migrations" VALUES(7,'exploratory','0003_auto_20150321_2122','2015-03-22 00:23:00.171000');
CREATE TABLE "charters_charter" (
    "charter_id" varchar(20) NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "objective" varchar(100) NOT NULL,
    "min_time" integer NOT NULL,
    "max_time" integer NOT NULL,
    "requeriments" text,
    "setup" text,
    "notes" text,
    "key_areas" text,
    "issues" varchar(100),
    "important_notes" text,
    "created_at" datetime NOT NULL,
    "modified_at" datetime NOT NULL
);
INSERT INTO "charters_charter" VALUES('ET:001','Explore the circle widget.	','Explore the circle widget with your basic functionalities and alter their standard settings',30,45,'Feature-3180','None.','','"Alter standard settings.
Move widget over screen.
Do the normal user actions and alternative flows.
Switch the sides.
Add cities for weather.
Work with battery in 100% to 0% and follow the third circle.
Interaction with tray"','IKJB42MAIN-5841, IKJB42MAIN-5656','"I couldn´t access the configuration and the sides of circles.
CR found in design: IKJB42MAIN-5869"','2015-03-21 19:27:29.152000','2015-03-22 03:10:46.487000');
INSERT INTO "charters_charter" VALUES('ET:002','Explore Gallery app','Explore Gallery options, settings and menu.',60,120,'None.','None.','','"Gallery options without any picture/video.
Verify editor options (effects, moldure, crop,...).
Set picture as Wallpaper.
Share with default options.
Delete Pictures/Videos (one by one and multiple selection)"','IKJB42MAIN-3328','','2015-03-22 02:41:16.475000','2015-03-22 02:41:16.475000');
CREATE TABLE "exploratory_comment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "description" text NOT NULL);
CREATE TABLE "exploratory_issue" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "code_jira" varchar(20) NOT NULL, "name" varchar(50) NOT NULL, "description" varchar(100) NOT NULL, "tipo" varchar(20) NOT NULL);
INSERT INTO "exploratory_issue" VALUES(1,'JRA-1330','Test Issue 1','Description test issues','test type');
CREATE TABLE "exploratory_label" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "description" varchar(50) NOT NULL);
CREATE TABLE "exploratory_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "project" varchar(100) NOT NULL);
INSERT INTO "exploratory_product" VALUES(1,'Moto G','MotoG-Project');
INSERT INTO "exploratory_product" VALUES(2,'Moto X','MotoX-Project');
CREATE TABLE "exploratory_product_labels" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "product_id" integer NOT NULL REFERENCES "exploratory_product" ("id"), "label_id" integer NOT NULL REFERENCES "exploratory_label" ("id"), UNIQUE ("product_id", "label_id"));
INSERT INTO "exploratory_product_labels" VALUES(1,1,1);
CREATE TABLE "exploratory_sessao_comments" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sessao_id" integer NOT NULL REFERENCES "exploratory_sessao" ("id"), "comment_id" integer NOT NULL REFERENCES "exploratory_comment" ("id"), UNIQUE ("sessao_id", "comment_id"));
CREATE TABLE "exploratory_sessao_issues" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sessao_id" integer NOT NULL REFERENCES "exploratory_sessao" ("id"), "issue_id" integer NOT NULL REFERENCES "exploratory_issue" ("id"), UNIQUE ("sessao_id", "issue_id"));
CREATE TABLE "exploratory_sessao" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "comments" text NOT NULL, "duration" integer NOT NULL, "current_time" integer NOT NULL, "charter_id" varchar(20) NOT NULL REFERENCES "charters_charter" ("charter_id"), "product_id" integer NOT NULL REFERENCES "exploratory_product" ("id"), "tester_id" integer NOT NULL REFERENCES "auth_user" ("id"));
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('django_migrations',7);
INSERT INTO "sqlite_sequence" VALUES('exploratory_sessao',0);
INSERT INTO "sqlite_sequence" VALUES('exploratory_issue',1);
INSERT INTO "sqlite_sequence" VALUES('exploratory_product',2);
INSERT INTO "sqlite_sequence" VALUES('exploratory_product_labels',1);
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "exploratory_product_labels_9bea82de" ON "exploratory_product_labels" ("product_id");
CREATE INDEX "exploratory_product_labels_abec2aca" ON "exploratory_product_labels" ("label_id");
CREATE INDEX "exploratory_sessao_comments_ad65f22e" ON "exploratory_sessao_comments" ("sessao_id");
CREATE INDEX "exploratory_sessao_comments_69b97d17" ON "exploratory_sessao_comments" ("comment_id");
CREATE INDEX "exploratory_sessao_issues_ad65f22e" ON "exploratory_sessao_issues" ("sessao_id");
CREATE INDEX "exploratory_sessao_issues_12f3e382" ON "exploratory_sessao_issues" ("issue_id");
CREATE INDEX "exploratory_sessao_212116fa" ON "exploratory_sessao" ("charter_id");
CREATE INDEX "exploratory_sessao_9bea82de" ON "exploratory_sessao" ("product_id");
CREATE INDEX "exploratory_sessao_d7ccc8e6" ON "exploratory_sessao" ("tester_id");
COMMIT;

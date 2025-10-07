CREATE TABLE "messages" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"content" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"firstName" varchar(256) NOT NULL,
	"lastName" varchar(256) NOT NULL,
	"email" varchar(256) NOT NULL,
	"password" varchar(256) NOT NULL,
	"avatar" varchar(256),
	CONSTRAINT "users_email_unique" UNIQUE("email")
);

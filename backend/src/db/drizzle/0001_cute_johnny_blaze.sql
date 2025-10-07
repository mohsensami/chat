CREATE TABLE "conversations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "user_conversations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"conversationId" uuid NOT NULL
);
--> statement-breakpoint
ALTER TABLE "messages" ADD COLUMN "senderId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "messages" ADD COLUMN "receiverId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "messages" ADD COLUMN "conversationId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "messages" ADD COLUMN "createdAt" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "user_conversations" ADD CONSTRAINT "user_conversations_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "user_conversations" ADD CONSTRAINT "user_conversations_conversationId_conversations_id_fk" FOREIGN KEY ("conversationId") REFERENCES "public"."conversations"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "messages" ADD CONSTRAINT "messages_senderId_users_id_fk" FOREIGN KEY ("senderId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "messages" ADD CONSTRAINT "messages_receiverId_users_id_fk" FOREIGN KEY ("receiverId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "messages" ADD CONSTRAINT "messages_conversationId_conversations_id_fk" FOREIGN KEY ("conversationId") REFERENCES "public"."conversations"("id") ON DELETE no action ON UPDATE no action;
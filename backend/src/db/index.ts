import { Pool } from "pg";
import { NodePgDatabase, drizzle } from "drizzle-orm/node-postgres";
import * as userSchema from "./schema/user";
import { messageSchema } from "./schema/message";
import { conversationSchema } from "./schema/conversation";
import { userConversationSchema } from "./schema/userConversation";

if (!process.env.DB_URL) {
  throw new Error("Database URL missing...");
}

const pool = new Pool({
  connectionString: process.env.DB_URL,
});

const combinedSchemas = {
  ...userSchema,
  ...messageSchema,
  ...conversationSchema,
  ...userConversationSchema
};

export const db: NodePgDatabase<typeof combinedSchemas> = drizzle(pool, {
  schema: combinedSchemas,
});

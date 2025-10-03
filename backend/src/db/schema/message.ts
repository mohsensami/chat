import { InferInsertModel, InferSelectModel } from "drizzle-orm";
import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";


export const messageSchema = pgTable("messages", {
  id: uuid("id").defaultRandom().primaryKey(),
  content: varchar("content").notNull(),
});

export type Message = InferSelectModel<typeof messageSchema>;
export type NewMessage = InferInsertModel<typeof messageSchema>;

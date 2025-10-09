import { Router } from "express";
import { sendMessage, getMessages } from "../controllers/message";
import { privateRoute } from "../middleware/privateRoute";

const messageRouter = Router();

messageRouter.post("/send/:receiverId", privateRoute, sendMessage);
messageRouter.get("/:receiverId", privateRoute, getMessages);

export default messageRouter;

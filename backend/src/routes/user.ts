import { Router } from "express";
import { signIn } from "../controllers/user";
// import { privateRoute } from "../middleware/privateRoute";

const userRouter = Router();

userRouter.post("/signin", signIn);
// userRouter.post("/signup", signUp);
// userRouter.post("/signout", signOut);
// userRouter.get("/", privateRoute, getUsers);

export default userRouter;

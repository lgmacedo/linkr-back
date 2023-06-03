import { Router } from "express";

import { logOut, searchUser, signIn, signUp } from "../controllers/users.controller.js";

import validateSchema from "../middlewares/validateSchema.middleware.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

import signUpSchema from "../schemas/signUpSchema.schema.js";
import signInSchema from "../schemas/signInSchema.schema.js";

const usersRouter = Router();
usersRouter.post("/sign-up", validateSchema(signUpSchema), signUp);
usersRouter.post("/sign-in", validateSchema(signInSchema), signIn);
usersRouter.post("/log-out", authValidation, logOut);
usersRouter.post("/users", searchUser)

export default usersRouter;

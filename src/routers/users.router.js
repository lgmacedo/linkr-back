import { Router } from "express";

import {
  checkIfFollows,
  followUser,
  logOut,
  searchUser,
  signIn,
  signUp,
  userFollowed,
} from "../controllers/users.controller.js";

import validateSchema from "../middlewares/validateSchema.middleware.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

import signUpSchema from "../schemas/signUpSchema.schema.js";
import signInSchema from "../schemas/signInSchema.schema.js";
import followSchema from "../schemas/followSchema.schema.js";

const usersRouter = Router();
usersRouter.post("/sign-up", validateSchema(signUpSchema), signUp);
usersRouter.post("/sign-in", validateSchema(signInSchema), signIn);
usersRouter.post("/log-out", authValidation, logOut);
usersRouter.post("/users", searchUser);
usersRouter.get("/follows/:id/:followedId", checkIfFollows);
usersRouter.post("/follows", validateSchema(followSchema), followUser);
usersRouter.get("/follows/:id", userFollowed);

export default usersRouter;

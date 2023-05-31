import { Router } from "express";

import usersRouter from "./users.router.js";
import postRouter from "./posts.router.js";

const router = Router();
router.use(usersRouter);
router.use(postRouter);

export default router;
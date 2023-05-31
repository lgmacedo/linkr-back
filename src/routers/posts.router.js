import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import postsSchema from "../schemas/postsSchema.schema.js";
import { createPost } from "../controllers/posts.controllers.js";

const postRouter = Router();

postRouter.post('/new-post', validateSchema(postsSchema), createPost);
postRouter.post('/timeline', getAllPosts);
postRouter.post('/user/:id', getPostsByUserId);

export default postRouter;
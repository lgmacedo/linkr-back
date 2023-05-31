import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import postsSchema from "../schemas/postsSchema.schema.js";
import { createPost, getAllPosts, getPostsByUserId } from "../controllers/posts.controllers.js";

const postRouter = Router();

postRouter.post('/new-post', validateSchema(postsSchema), createPost);
postRouter.get('/timeline', getAllPosts);
postRouter.get('/user/:id', getPostsByUserId);

export default postRouter;
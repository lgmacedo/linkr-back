import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import postsSchema from "../schemas/postsSchema.schema.js";
import { createPost, getAllPosts, getPostsByUserId, likePost } from "../controllers/posts.controllers.js";
import { authValidation } from "../middlewares/authValidation.middlewares.js";

const postRouter = Router();

postRouter.use(authValidation);
postRouter.post('/new-post', validateSchema(postsSchema), createPost);
postRouter.get('/timeline', getAllPosts);
postRouter.get('/user/:id', getPostsByUserId);
postRouter.post('/like', likePost);

export default postRouter;
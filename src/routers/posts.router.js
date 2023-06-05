import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import postsSchema from "../schemas/postsSchema.schema.js";
import {
  createPost,
  deletePostById,
  getAllPosts,
  getPostsByHashtag,
  getPostsByUserId,
  getTrending,
  likePost,
} from "../controllers/posts.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const postRouter = Router();

postRouter.use(authValidation);
postRouter.post("/new-post", validateSchema(postsSchema), createPost);
postRouter.get("/timeline", getAllPosts);
postRouter.get("/user/:id", getPostsByUserId);
postRouter.post("/like", likePost);
postRouter.get("/trending", getTrending);
postRouter.get("/hashtag/:hashtag", getPostsByHashtag);
postRouter.delete("/post/:id", deletePostById);

export default postRouter;
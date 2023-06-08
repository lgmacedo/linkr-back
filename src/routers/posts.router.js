import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import postsSchema from "../schemas/postsSchema.schema.js";
import {
  createPost,
  deletePostById,
  editPostById,
  getAllPosts,
  getPostsByHashtag,
  getPostsByUserId,
  getTrending,
  likePost,
  getPostComments,
  newComment,
  getPostFromFollowedUsersById,
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
postRouter.put("/post/:id", editPostById);
postRouter.get("/post/:id/comments", getPostComments);
postRouter.post("/new-comment", newComment);
postRouter.get("/timeline/followed/:id", getPostFromFollowedUsersById);

export default postRouter;
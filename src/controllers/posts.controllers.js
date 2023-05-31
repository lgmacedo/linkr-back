import { saveHashtag } from "../repositories/hashtag.repositories.js";
import { createNewPost, findPostByDescription, getPosts, getUserPosts } from "../repositories/posts.repositories.js";

export async function createPost(req, res) {
  const { userId } = res.locals.session;
  const { description } = req.body;
  try {
    await createNewPost(userId, req.body);

    const { rows: post } = await findPostByDescription(description);
    const postId = post.id;
    await saveHashtag(description, postId);

    res.sendStatus(200);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getAllPosts(req, res) {
  try {
    const { rows: posts } = await getPosts();
    res.send(posts);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostsByUserId(req, res) {
  const { id: userId } = req.params;
  try {
    const { row: userPosts } = await getUserPosts(userId);
    res.send(userPosts);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

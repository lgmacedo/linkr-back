import { saveHashtag } from "../repositories/hashtag.repositories.js";
import { createNewPost, findPostByDescription, getPosts, getUserPosts, 
  getLike, postLike, removeLike } from "../repositories/posts.repositories.js";
import createMetadata from "../utils/createMetadata.js";

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
    const postResult = await createMetadata(posts)
    res.send(postResult);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostsByUserId(req, res) {
  const { id: userId } = req.params;
  try {
    const { row: userPosts } = await getUserPosts(userId);
    const postResult = await createMetadata(userPosts)
    res.send(postResult);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

//Curte e descurte um post qualquer
export async function likePost(req, res){
  const { postId, userId } = req.body

  const alreadyLiked = await getLike(postId, userId)

  try {
    if(alreadyLiked.rowCount===0){
      await postLike(postId, userId)
      res.status(200).send("Post liked")
    } else {
      await removeLike(postId, userId)
      res.status(200).send("Post unliked")
    }
  } catch(err){
    res.status(500).send(err.message)
  }
}
import { saveHashtag } from "../repositories/hashtag.repositories.js";
import {
  createNewPost,
  findPostByToken,
  getPosts,
  getUserPosts,
  getLike,
  postLike,
  removeLike,
  countLikes,
  countHashtags,
  getPostAndUsersByHashtag,
  deletePostFromTableLikes,
  deletePostFromTableHashtags,
  deletePostFromTablePosts,
} from "../repositories/posts.repositories.js";
import createMetadata from "../utils/createMetadata.js";
import { v4 as uuid } from "uuid";

export async function createPost(req, res) {
  const { userId } = res.locals.session;
  const { description } = req.body;
  const token = uuid();

  try {
    await createNewPost(req.body, userId, token);

    const { rows: post } = await findPostByToken(token);
    const postId = post[0].id;

    await saveHashtag(description, postId);

    res.sendStatus(200);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getAllPosts(req, res) {
  try {
    const { rows: posts } = await getPosts();
    const postResult = await createMetadata(posts);
    res.send(postResult);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostsByUserId(req, res) {
  const { id: userId } = req.params;
  try {
    const { rows: userPosts } = await getUserPosts(userId);
    const postResult = await createMetadata(userPosts);
    res.send(postResult);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

//Curte e descurte um post qualquer
export async function likePost(req, res) {
  const { postId, ui } = req.body;

  const alreadyLiked = await getLike(postId, ui);

  try {
    if (alreadyLiked.rows.length === 0) {
      await postLike(postId, ui);
      const result = await countLikes(postId);
      res.status(200).send(result.rows[0].likeCount);
    } else {
      await removeLike(postId, ui);
      const result = await countLikes(postId);
      res.status(200).send(result.rows[0].likeCount);
    }
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getTrending(req, res) {
  try {
    res.send((await countHashtags()).rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostsByHashtag(req, res) {
  const { hashtag } = req.params;

  try {
    const posts = await getPostAndUsersByHashtag(hashtag);

    const filter = [];

    posts.rows.forEach((post) => {
      const existingPost = filter.find(
        (item) => item.postId === post.postId && item.hashtag === post.hashtag
      );
      if (!existingPost) {
        filter.push(post);
      }
    });

    res.send(filter);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function deletePostById(req, res) {
  const postId = req.params.id;

  try {
    await deletePostFromTableLikes(postId);

    await deletePostFromTableHashtags(postId);

    await deletePostFromTablePosts(postId);

    res.sendStatus(204);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
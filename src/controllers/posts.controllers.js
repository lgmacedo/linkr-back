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
  updatePostDescription,
  getCommentsFromPostId,
  insertNewComment,
  postRepost,
  countRepost,
  getPostById,
  getRepost
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

export async function editPostById(req, res) {
  const postId = req.params.id;
  const description = req.body.descriptionEdit;

  try {
    await updatePostDescription(postId, description);

    await deletePostFromTableHashtags(postId);

    await saveHashtag(description, postId);

    res.sendStatus(204);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostComments(req, res) {
  const postId = req.params.id;
  const { session } = res.locals;
  try {
    const comments = await getCommentsFromPostId(postId, session.userId);
    return res.status(200).send(comments.rows);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}

export async function newComment(req, res) {
  const { postId, comment } = req.body;
  const { session } = res.locals;
  const userId = session.userId;
  try {
    await insertNewComment(comment, postId, userId);
    return res.sendStatus(201);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}

export async function rePost(req, res) {
  const { userId,postId } = req.body;

  try {
    await postRepost(userId, postId)
    const count = await countRepost(postId)
    //const result = await getPostById(postId)
    res.status(200).send(count.rows[0].postCount)
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getReposts(req, res){
  try {
    const result = await getRepost()
    return res.status(200).send(result.rows);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}
import { db } from "../database/database.connect.js";
export async function createNewPost(body, userId, token) {
  const { link, description } = body;
  await db.query(
    `INSERT INTO posts ("userId", link, description, "identificationToken") VALUES ($1, $2, $3, $4)`,
    [userId, link, description, token]
  );
}
export function findPostByToken(token) {
  return db.query(`SELECT * FROM posts WHERE "identificationToken"=$1`, [
    token,
  ]);
}
export function getUserPosts(userId, offset) {
  return db.query(
    `
      SELECT
          posts.*,
          users.username,
          users.picture,
          COUNT(likes."postId") AS likesCount,
          (
              SELECT
                  JSON_AGG(
                      JSON_BUILD_OBJECT('name', users.username)
                  )
              FROM
                  likes
              JOIN users ON users.id = likes."userId"
              WHERE
                  likes."postId" = posts.id
              GROUP BY
                  posts.id
          ) AS "likedBy",
          (
            SELECT
                COUNT(*)
            FROM
                comments
            WHERE
                comments."postId" = posts.id) AS commentsCount
      FROM
          posts
      JOIN users ON users.id = posts."userId"
      LEFT JOIN likes ON likes."postId" = posts.id
      WHERE posts."userId" = $1
      GROUP BY
          posts.id,
          users.username,
          users.picture
      ORDER BY
          posts."createdAt" DESC
      LIMIT 10
      OFFSET $2;`,
    [userId, offset]
  );
}
export function getLike(postId, ui) {
  return db.query(
    `
        SELECT * FROM likes WHERE "postId"=$1 AND "userId"=$2
    `,
    [postId, ui]
  );
}
export function postLike(postId, ui) {
  return db.query(
    `
        INSERT INTO likes ("postId", "userId") VALUES ($1, $2)
    `,
    [postId, ui]
  );
}
export function removeLike(postId, ui) {
  return db.query(
    `
        DELETE FROM likes WHERE "postId"=$1 AND "userId"=$2
    `,
    [postId, ui]
  );
}

export function countLikes(postId) {
  return db.query(
    `
        SELECT COUNT(*) as "likeCount" FROM likes WHERE "postId" = $1
    `,
    [postId]
  );
}

export function countHashtags() {
  return db.query(`
      SELECT hashtag, COUNT(*) AS quantity FROM hashtags
      GROUP BY hashtag 
      ORDER BY quantity DESC
      LIMIT 10
      `);
}

export function getPostAndUsersByHashtag(hashtag, offset) {
  return db.query(
    `
  SELECT
  posts.*,
  users.username,
  users.picture,
  hashtags.*,
  COUNT(likes."postId") AS likesCount,
  (
      SELECT
          JSON_AGG(
              JSON_BUILD_OBJECT('name', users.username)
          )
      FROM
          likes
          JOIN users ON users.id = likes."userId"
      WHERE
          likes."postId" = posts.id
      GROUP BY
          posts.id
  ) AS "likedBy",
  (
    SELECT
        COUNT(*)
    FROM
        comments
    WHERE
        comments."postId" = posts.id
  ) AS commentsCount
  FROM
    hashtags
  JOIN posts ON posts.id = hashtags."postId"
  JOIN users ON users.id = posts."userId"
  LEFT JOIN likes ON likes."postId" = posts.id
  WHERE hashtags.hashtag='${hashtag}'
  GROUP BY
    posts.id,
    users.username,
    users.picture,
    hashtags.id
  ORDER BY
    posts."createdAt" DESC
  LIMIT 10
  OFFSET $1;`,
    [offset]
  );
}

export function deletePostFromTableLikes(postId) {
  return db.query(`DELETE FROM likes WHERE "postId"=$1`, [postId]);
}

export function deletePostFromTableHashtags(postId) {
  return db.query(`DELETE FROM hashtags WHERE "postId"=$1`, [postId]);
}

export function deletePostFromTableComments(postId) {
  return db.query(`DELETE FROM comments WHERE "postId"=$1`, [postId]);
}

export function deletePostFromTablePosts(postId) {
  return db.query(`DELETE FROM posts WHERE id=$1`, [postId]);
}

export function updatePostDescription(postId, description) {
  return db.query(`UPDATE posts SET description='${description}' WHERE id=$1`, [
    postId,
  ]);
}

export function getCommentsFromPostId(postId, userId) {
  return db.query(
    `
    SELECT comments.id, comments.comment, users.username, users.picture,
      comments."userId" = posts."userId" AS "postAuthor",
      CASE WHEN EXISTS (SELECT 1 FROM follows WHERE follows."userId" = $1 AND follows."followedId" = comments."userId") THEN true ELSE false END AS following
    FROM comments
    JOIN users ON comments."userId" = users.id
    JOIN posts ON comments."postId" = posts.id
    WHERE comments."postId" = $2;
  `,
    [userId, postId]
  );
}

export function insertNewComment(comment, postId, userId) {
  return db.query(
    `
    INSERT INTO comments ("userId", "postId", "comment") 
      VALUES ($1, $2,$3);
    `,
    [userId, postId, comment]
  );
}

export function getUserAndFollowedPosts(userId, offset) {
  return db.query(
    `
    SELECT 
    posts.*,
    users.username,
    users.picture,
    likes_count.likesCount,
    (
        SELECT
            JSON_AGG(
                JSON_BUILD_OBJECT('name', users.username)
            )
        FROM
            likes
            JOIN users ON users.id = likes."userId"
        WHERE
            likes."postId" = posts.id
        GROUP BY
            posts.id
    ) AS "likedBy",
    (
        SELECT
            COUNT(*)
        FROM
            comments
        WHERE
            comments."postId" = posts.id
    ) AS commentsCount
FROM
    posts
    LEFT JOIN follows ON follows."followedId" = posts."userId" OR follows."userId" = posts."userId"
    JOIN users ON posts."userId" = users.id
    LEFT JOIN (
        SELECT
            "postId",
            COUNT("postId") AS likesCount
        FROM
            likes
        GROUP BY
            "postId"
    ) likes_count ON likes_count."postId" = posts.id
WHERE
    follows."userId" = $1 OR posts."userId" = $1
GROUP BY
    posts.id,
    users.username,
    users.picture,
    likes_count.likesCount
ORDER BY
    posts."createdAt" DESC
LIMIT 10
OFFSET $2;
    `,
    [userId, offset]
  );
}

export function getUserFollowed(userId) {
  return db.query(`SELECT * FROM follows WHERE "userId"=$1`, [userId]);
}

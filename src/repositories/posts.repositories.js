import { db } from "../database/database.connect.js";

export async function createNewPost(body, userId) {
    const { link, description } = body;

    await db.query(
        `INSERT INTO posts ("userId", link, description) VALUES ($1, $2, $3)`,
        [userId, link, description]
      );
}

export function findPostByDescription(description) {
    return db.query(
        `SELECT * FROM posts WHERE description=$1`,
        [description]
      );
}

export function getPosts(){
    return db.query(`
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
    ) AS likedBy
FROM
    posts
JOIN users ON users.id = posts."userId"
LEFT JOIN likes ON likes."postId" = posts.id
GROUP BY
    posts.id,
    users.username,
    users.picture
ORDER BY
    posts."createdAt" DESC
LIMIT 20;`);
}

export function getUserPosts(userId){
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
          ) AS likedBy
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
      LIMIT 20;`,
        [userId]
      );
}

export function getLike(postId, userId){
    return db.query(`
        SELECT * FROM likes WHERE "postId"=$1 AND "userId"=$2
    `, [postId, userId])
}

export function postLike(postId, userId){
    return db.query(`
        INSERT INTO likes ("postId", "userId") VALUES ($1, $2)
    `, [postId, userId])
}

export function removeLike(postId, userId){
    return db.query(`
        DELETE FROM likes WHERE "postId"=$1 AND "userId"=$2
    `, [postId, userId])
}

export function countLikes(postId){
    return db.query(`
        SELECT * FROM likes WHERE "postId"=$1
    `, [postId])
}
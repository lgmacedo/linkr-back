import { db } from "../database/database.connect.js";

export async function searchEmail(email) {
  return db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
}

export async function insertNewUser(user, password) {
  db.query(
    `INSERT INTO users (email, password, username, picture) VALUES ($1, $2, $3, $4);`,
    [user.email, password, user.username, user.picture]
  );
}

export async function insertNewSession(id, token) {
  db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, [
    id,
    token,
  ]);
}

export async function deleteSession(id) {
  db.query(`DELETE FROM sessions WHERE id = $1;`, [id]);
}

export async function searchUserByUsername(username){
  return db.query(`
    SELECT id, username, picture FROM users
    WHERE username ILIKE '%' || $1 || '%'
    LIMIT 10
  `, [username])
}

export async function searchFollow(userId, followedId) {
  return db.query(
    `SELECT * FROM follows WHERE "userId"=$1 AND "followedId"=$2`,
    [userId, followedId]
  );
}

export async function deleteFollow(userId, followedId) {
  return db.query(
    `DELETE FROM follows WHERE "userId"=${userId} AND "followedId"=${followedId}`
  );
}

export async function insertFollow(userId, followedId) {
  return db.query(
    `INSERT INTO follows ("userId", "followedId") VALUES (${userId}, ${followedId})`
  );
}

export function selectUserFollowed(userId) {
  return db.query(
    `
    SELECT users.id, users.username, users.picture FROM follows 
    JOIN users
      ON follows."followedId"=users.id
    WHERE "userId"=$1`,
    [userId]
  );
}
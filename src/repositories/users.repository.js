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

import { db } from "../database/database.connect.js";

export function findUserSession(token) {
    return db.query(`SELECT * FROM sessions WHERE token=$1`, [token]);
}
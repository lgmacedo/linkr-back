import { db } from "../database/database.connect.js";

export async function saveHashtag(text, postId) {
    const regex = /#(\w+)/g;
    let match;
  
    while ((match = regex.exec(text)) !== null) {
      const tags = match[1];
      await db.query(`INSERT INTO hashtags ("postId", hashtag) VALUES ($1, $2)`, [postId, tags])
    }
}
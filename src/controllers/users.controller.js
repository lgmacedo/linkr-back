import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

import { searchEmail, insertNewUser, insertNewSession, deleteSession } from "../repositories/users.repository.js";

export async function signUp(req, res) {
  const { email, password, username, picture } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);
  try {
    const emailQuery = await searchEmail(email);
    if (emailQuery.rowCount) return res.status(409).send("E-mail address already in use");
    await insertNewUser(req.body, passwordHash);
    return res.sendStatus(201);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}

export async function signIn(req, res) {
  const { email, password } = req.body;
  try {
    const emailQuery = await searchEmail(email);
    const user = emailQuery.rows[0];
    if (!emailQuery.rowCount || !bcrypt.compareSync(password, user.password))
      return res.status(401).send("Login details do not match");
    const token = jwt.sign({id: user.id, picture: user.picture}, process.env.SECRET_KEY);
    await insertNewSession(user.id, token);
    return res.status(200).send({ token, picture: user.picture });
  } catch (err) {
    return res.status(500).send(err.message);
  }
}

export async function logOut(req, res) {
  const { session } = res.locals;
  try {
    await deleteSession(session.id);
    return res.sendStatus(202);
  } catch (err) {
    return res.status(500).send("An unexpected error occurred. Try again.");
  }
}

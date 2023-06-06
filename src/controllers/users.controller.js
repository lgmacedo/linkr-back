import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

import {
  searchEmail,
  insertNewUser,
  insertNewSession,
  deleteSession,
  searchUserByUsername,
  searchFollow,
  deleteFollow,
  insertFollow,
} from "../repositories/users.repository.js";

export async function signUp(req, res) {
  const { email, password, username, picture } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);
  try {
    const emailQuery = await searchEmail(email);
    if (emailQuery.rowCount)
      return res.status(409).send("E-mail address already in use");
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
    const token = jwt.sign(
      { id: user.id, picture: user.picture },
      process.env.SECRET_KEY
    );
    await insertNewSession(user.id, token);
    console.log(user);
    return res.status(200).send({
      token,
      picture: user.picture,
      username: user.username,
      id: user.id,
    });
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

export async function searchUser(req, res) {
  const { username } = req.body;
  try {
    const result = await searchUserByUsername(username);
    res.send(result.rows);
  } catch (error) {
    console.error("Erro ao buscar usuários:", error);
    res.status(500).json({ error: "Erro ao buscar usuários" });
  }
}

export async function checkIfFollows(req, res) {
  const { id, followedId } = req.params;

  try {
    const follows = await searchFollow(id, followedId);

    res.send(follows.rows);
  } catch (error) {
    return res.status(500).send(err.message);
  }
}

export async function followUser(req, res) {
  const { userId, followedId } = req.body;

  try {
    const follows = await searchFollow(userId, followedId);

    if (follows.rowCount) {
      await deleteFollow(userId, followedId);
      return res.sendStatus(204);
    }

    await insertFollow(userId, followedId);
    res.sendStatus(201);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}

import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

import { searchEmail, insertNewUser, insertNewSession, deleteSession } from "../repositories/users.repository.js";

export async function signUp(req, res) {
  const { email, password, username, picture } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);
  try {
    const emailQuery = await searchEmail(email);
    if (emailQuery.rowCount) return res.status(409).send("Email já cadastrado");
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
      return res.status(401).send("Dados de login não conferem");
    const token = jwt.sign({id: user.id}, process.env.SECRET_KEY, {expiresIn: 60*60*24}); //1 dia em segundos
    await insertNewSession(user.id, token);
    res.status(200).send({ token });
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
    return res.status(500).send("Erro inesperado. Tente novamente.");
  }
}
import Joi from "joi";

const signUpSchema = Joi.object({
  email: Joi.string().email().required().messages({
    "any.required": 'The "email" field is mandatory.',
    "string.empty": 'The "email" field cannot be empty.',
    "string.email": 'The "email" field must have a valid email format.',
  }),
  password: Joi.string().required().messages({
    "any.required": 'The "password" field is mandatory.',
    "string.empty": 'The "password" field cannot be empty.',
  }),
  username: Joi.string().required().messages({
    "any.required": 'The "username" field is mandatory.',
    "string.empty": 'The "username" field cannot be empty.',
  }),
  picture: Joi.string().uri().required().messages({
    "any.required": 'The "picture url" field is mandatory.',
    "string.empty": 'The "picture url" field cannot be empty.',
    "string.uri": 'The "picture url" field must be a valid URL.',
  }),
});

export default signUpSchema;

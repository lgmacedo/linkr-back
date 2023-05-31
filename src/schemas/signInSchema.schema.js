import Joi from "joi";

const signInSchema = Joi.object({
  email: Joi.string().email().required().messages({
    "any.required": 'The "email" field is mandatory.',
    "string.empty": 'The "email" field cannot be empty.',
    "string.email": 'The "email" field must have a valid email format.',
  }),
  password: Joi.string().required().messages({
    "any.required": 'The "email" field is mandatory.',
    "string.empty": 'The "email" field cannot be empty.',
  }),
});

export default signInSchema;
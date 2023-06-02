import Joi from "joi";

const postsSchema = Joi.object({
    link: Joi.string().uri().required().messages({
        "any.required": 'The "link" field is mandatory.',
        "string.empty": 'The "link" field cannot be empty.',
        "string.uri": 'The "link" field must be a valid URL.',
    }),
    description: Joi.string().trim().allow('').optional()
})

export default postsSchema;
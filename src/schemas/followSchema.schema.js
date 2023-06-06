import joi from "joi";

const followSchema = joi.object({
  userId: joi.number().required(),
  followedId: joi.number().required(),
});

export default followSchema;

import urlMetadata from "url-metadata";

export default async function createMetadata(data) {
  try {
    const postInfo = await Promise.all(
      data.map(async (post) => {
        const posts = await urlMetadata(post.link);
        return {
          ...post,
          title: posts.title,
          description: posts.description,
          image: posts.image,
        };
      })
    );
    return postInfo;
  } catch (err) {
    console.error(err);
  }
}

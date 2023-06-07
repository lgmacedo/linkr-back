import urlMetadata from "url-metadata";

export default async function createMetadata(data) {
  try {
    const postInfo = await Promise.all(
      data.map(async (post) => {
        try {
          const posts = await urlMetadata(post.link);
          return {
            ...post,
            title: posts.title || "",
            desc: posts.description,
            image: posts.image,
          };
        } catch (err) {
          return {
            ...post,
            title: "",
            desc: "",
            image: "",
          };
        }
      })
    );    
    return postInfo;
  } catch (err) {
    console.error(err);
  }
}

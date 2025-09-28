walker create_post(visit_profile) {
has content: str;
has images: list = [];
has analysis: str = "";
can post with Profile entry {
    embedding = vectorizer.fit_transform([self.content]).toarray().tolist();
    post_node = here +>: AuthoredBy() :+> Post(content=self.content, embedding=embedding, images=self.images, analysis=self.analysis);
    grant(post_node[0], level=ConnectPerm);
    report post_node;
}
}

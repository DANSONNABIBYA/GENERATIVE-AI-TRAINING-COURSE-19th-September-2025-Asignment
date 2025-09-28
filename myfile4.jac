node Post {
has content: str;
has embedding: list;
has created_at: str = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S");
has images: list = [];
has analysis: str = "";
can update with update_post exit {
    self.content = visitor.updated_content;
    self.images = visitor.updated_images;
    self.analysis = visitor.updated_analysis;
    report self;
}

can delete with remove_post exit {
    del self;
    disengage;
}

def get_info() -> PostInfo {
    return PostInfo(
        author_name=[self<-:AuthoredBy:<-][0].name,
        id=jid(self),
        content=self.content,
        embedding=self.embedding,
        images=self.images,
        analysis=self.analysis
    );
}

can get with load_posts entry {
    report self;
}
}
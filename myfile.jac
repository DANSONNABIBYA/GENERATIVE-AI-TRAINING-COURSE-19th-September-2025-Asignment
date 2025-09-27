with entry {
    print("Hello, World!");
}

node BlogPost {
    has title: str;
    has content: str;
    has tags: list[str];
    has region: str;  # e.g., 'Sub-Saharan Africa', 'Kenya'
    has date_posted: str;
}

node Blog {
    has name: str = "Danson Nabibya Official";
    has posts: list[BlogPost] = [];

    can add_post with entry(visitor: BlogPost) {
        self.posts.append(visitor);
        here ++> visitor;
        print(f"Added post titled: {visitor.title}");
    }

    can show_posts with entry {
        for p in self.posts {
            if p.region == "Kenya" or p.region == "Sub-Saharan Africa" {
                print(f"Title: {p.title}");
                print(f"Date: {p.date_posted}");
                print(f"Tags: {p.tags}");
                print(f"Content: {p.content}\n\n");
            }
        }
    }
}

with entry {
    my_blog = Blog();
    # Example post
    post1 = BlogPost(
        title = "Economic Growth in Kenya",
        content = "Kenya has seen remarkable economic growth driven by technology and agriculture...",
        tags = ["economy", "Kenya", "technology"],
        region = "Kenya",
        date_posted = "2025-09-19"
    );
    my_blog add_post(post1);

    # Show posts relevant to Sub-Saharan Africa and Kenya
    my_blog show_posts();
}
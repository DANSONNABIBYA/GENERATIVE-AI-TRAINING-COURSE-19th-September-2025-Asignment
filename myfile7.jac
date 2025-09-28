walker load_posts(visit_profile) {
has search_query: str = "";
has results: list = [];
can load with Profile entry {
    visit [-->(`?Post)];
}

can report with exit {
    if self.search_query != "" {
        self.results.sort(key=lambda x: dict: x['similarity'][0], reverse=True);
    }
    report self.results;
}
}
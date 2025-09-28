def search_posts(query: str, content: str) -> float {
transformed = vectorizer.fit_transform([query, content]);
similarity = cosine_similarity(transformed[0], transformed[1])[0];
return similarity;
}
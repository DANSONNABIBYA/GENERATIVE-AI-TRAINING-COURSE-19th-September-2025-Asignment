node Profile {
has name: str = "Danson Nabibya";
has occupation: str = "Economist";
has affiliation: str = "Maseno University, Kenya";
can update with update_profile entry {
    self.name = visitor.new_name;
    self.occupation = visitor.new_occupation;
    self.affiliation = visitor.new_affiliation;
    report self;
}

can get with get_profile entry {
    report {"name": self.name, "occupation": self.occupation, "affiliation": self.affiliation};
}
}
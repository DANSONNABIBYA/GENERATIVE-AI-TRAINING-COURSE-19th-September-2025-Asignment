node Environment {
    has name: str;
    has version: str = "1.0";

    can initialize with `root entry {
        print(f"Initializing environment: {self.name} version {self.version}");
    }
}

walker Setup {
    can start with `root entry {
        env = Environment(name="My Jac Environment");
        root ++> env;
        env spawn initialize();
    }
}

with entry {
    root spawn Setup();
}
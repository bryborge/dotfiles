# Linux Config

My linux config files.

## Description

I don't want to have to think about keeping track of multiple versions of my config files.
So,
git version control is the perfect solution because:

1. I have all my configs in one place
1. I can easily rollback if shit gets hairy

This works by generating symlinks in the home directory to the config files in this repo.
If that doesn't makes sense,
just trust that it's genius.

## How to Use

### Get Started

1. Clone this repo down to your code directory: `/home/user_name/code/`
1. Look at the contents of `scripts/gen_symlinks` **BEFORE** running it. Don't be a n00b.
1. Run `$ bash scripts/gen_symlinks`
1. Bask in the glory

### Tracking New Files

Currently the process is:

1. Create the new file in the root directory of this project
1. Add the file to the `start()` method in `scripts/gen_symlinks`
1. Run `$ bash scripts/gen_symlinks`

### Configure Atom

There are some configs in `atom_configs` that need to be added manually to the editor.


# .spacemacs.d

## Installation:

Start by closing Spacemacs.

Make a backup of your `.spacemacs` file if you have one.

Clone this configuration.
```
git clone --recursive https://github.com/0xbadc0fee/dotspacemacs.git ~/.spacemacs.d
```
## 2nd-brain ~/org
Your mind is for having ideas, not holding them. - David Allen This is my take on a personal knowledge system that has one purpose; to empty my mind without losing anything of value. I've blended two very useful but contradictory systems here. Consider it a 2nd brain with a classic left and right side split. Digitally, the root directory of this system is
```
org
├── README.md
├── gtd
└── roam
```
The root org directory is tracked in github both to make easier to share across terminals and for long term project version control. Both GTD and ROAM have extremely broad and free support in the forms of Emacs packages. I prefer to edit using VIM key "motions" though. VIM keybindings can be used in Emacs either through installing Evil Mode in vanilla Emacs or by starting out with Emacs frameworks like Doom Emacs or Spacemacs. This project is built on Spacemacs. This repo is only the GTD and ROAM related assets of the knowledge base. It requires a properly configured Spacemacs instance to take full advantage of everything. The configuration and .dotfiles for the Spacemacs package is separated in a different repo.

### Left Brain ~/org/gtd
Getting Things Done by David Allen is a proven approach for handling the organization of the more day to day duties of work and home.

### Right Brain ~/org/roam
ROAM is the emacs package modeled after Roam Research's note taking software, which is itself modeled on the Zettlekasten note taking approach developed by Niklas Luhmann in the 1950's.

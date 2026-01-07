"Projekt iz kolegija Deklarativno programiranje" by Lucija Polak

The Starting Room is a room. "Your adventure begins here."

Ivan is a man in the Starting Room.
Petar is a man in the Starting Room.

A torch is a unlit thing. 
Every turn when the torch is lit and the location is DarkChamber:
	now DarkChamber is lighted.
	
A gold coin is a thing.

The torch is carried by Ivan.
The gold coin is carried by Petar.

Trap revealed is a truth state that varies. Trap revealed is false.
Trap timer is a number that varies. Trap timer is 0.
Pit Room is a room. "You fell into a dark pit. A trap door closed above you."
The trap door is a locked door. The trap door is north of Pit Room and south of DarkChamber. The trap door is locked. It is scenery. Understand "hole" as the trap door when Trap revealed is true.

The player is a person.

Character-chosen is a truth state that varies.
Character-chosen is false.

When play begins:
	now the player is in the Starting Room;
	say "Welcome to the game! It was created as a project for the Declarative Programming course. However, I hope you will still enjoy playing it.[paragraph break] ";
	say "Choose your character:[line break]";
	say "1 - Ivan (has a torch and one gold coin)[line break]";
	say "2 - Petar (has nothing)[paragraph break]";
	say "Type 1 or 2 to continue.";

Choosing is an action applying to one number.
Understand "[number]" as choosing.

Use undo prevention.

Carry out choosing:
	if Character-chosen is true:
		say "You have already chosen your character.";
	otherwise if the number understood is 1:
		now the player is Ivan;
		now Character-chosen is true;
		now Petar is off-stage;
		move the player to DarkChamber;
		say "You have chosen Ivan. Good luck on your adventure!";
	otherwise if the number understood is 2:
		now the player is Petar;
		now Character-chosen is true;
		now Ivan is off-stage;
		move the player to LightRoom;
		say "You have chosen Petar. Good luck on your adventure!";
	otherwise:
		say "Invalid choice. Type 1 or 2.";

Instead of doing something other than choosing when Character-chosen is false:
	say "You must choose a character first. Type 1 or 2.";

Chapter 1 - Where am I?

DarkChamber is a dark room. The printed name is "The Dark Room".
The description is "[if DarkChamber is lighted]The room is now illuminated by your torch. On a small golden stool sits a golden apple.[otherwise]The room is dark. You can barely make out a small golden stool in the faint light.[end if]".

LightRoom is a room. The printed name of LightRoom is "The Light Room".
"The room is well-lit and empty except for an old wooden box on the floor."

Golden stool is a scenery supporter in DarkChamber. Understand "small golden" as Golden stool. "A small stool made of solid gold."
Golden apple is a scenery thing on the Golden stool."The golden apple has 'RUN' inscribed on it!"


Wooden box is in LightRoom. "An old, run-down wooden box sits on the floor."

The block burning rule does nothing when the noun is not the torch.

Check burning the torch:
	if the torch is lit, say "The torch is already lit." instead;
	now the torch is lit;
	say "You light the torch. The room is now illuminated." instead.

Check burning something:
	say "You can't light that." instead.

Extinguishing it is an action applying to one thing. Understand "extinguish [something]" as extinguishing it.

Carry out extinguishing it:
	if the noun is not a torch:
		say "You can't extinguish that.";
	otherwise if the torch is unlit:
		say "The torch is already unlit.";
	otherwise:
		now the torch is unlit;
		now the location is dark;
		say "You extinguish the torch. Darkness surrounds you again.";

After examining the golden apple:
	if Trap revealed is false:
		say "It seems light for something made of gold.";
		now Trap timer is 3;
		now Trap revealed is true;
		say "[italic type]Don't do it...[roman type]";		

Before taking the golden apple when Trap revealed is true:
	say "[italic type]Ignoring the warning...[roman type]".

Check taking the golden apple:
	say "The apple crumbles to dust!";
	now Trap timer is 0;
	say "The floor collapses! You fall through a hole!";
	move the player to Pit Room;
	if the player carries the torch:
		try dropping the torch;
		now the torch is off-stage;
	now the trap door is locked;
	stop the action. 

Every turn when Trap timer > 0:
	decrease Trap timer by 1;
	if Trap timer is 2:
		say "The floor creaks ominously...";
	otherwise if Trap timer is 1:
		say "The floor collapses! You fall through a hole!";
		move the player to Pit Room;
		if the player carries the torch:
			try dropping the torch;
			now the torch is off-stage;
		now the trap door is locked.